/*
京东多合一签到,自用,可N个京东账号
活动入口：各处的签到汇总
Node.JS专用
https://raw.githubusercontent.com/zero205/JD_tencent_scf/main/jd_bean_sign.js
IOS软件用户请使用 https://raw.githubusercontent.com/NobyDa/Script/master/JD-DailyBonus/JD_DailyBonus.js
更新时间：2021-8-15
金融签到在测试,有能力可以单独反馈.
JRBODY抓取网站:ms.jr.jd.com/gw/generic/hy/h5/m/appSign(进入金融APP签到页面手动签到);格式:"reqData=xxx"
变量填写示例:JRBODY: reqData=xxx&reqData=xxx&&reqData=xxx(比如第三个号没有,则留空,长度要与CK一致)
云函数AC用户Secrests添加JRBODY_SCF,每行一个jrbody,结尾行写'Finish',某个帐号无jrbody则留空行
其他环境用户除了JRBODY环境变量可以选用JRBODY.txt文件,放在同目录下,规则同上一行AC用户.
注:优先识别环境变量,如使用txt文件请不要设置环境变量.
 */
const $ = new Env('京东多合一签到SCF')
const fs = require('fs')
const jr_file = 'JRBODY.txt'
const readline = require('readline')

async function processLineByLine(jrbodys) {
  const fileStream = fs.createReadStream(jr_file)
  const rl = readline.createInterface({
    input: fileStream,
    crlfDelay: Infinity
  })
  for await (let line of rl) {
    line = line.trim()
    if (line == 'Finish'){
      console.log(`识别到读取结束符号,结束.供读取${jrbodys.length}个`)
      return
    }
    jrbodys.push(line)
  }
}

// const vm = require('vm')
let sendNotify
if ($.isNode()){
  sendNotify = require('./sendNotify.js').sendNotify
}
//Node.js用户请在jdCookie.js处填写京东ck;
const jdCookieNode = $.isNode() ? require('./jdCookie.js') : ''
let cookiesArr = []

if ($.isNode()) {
  Object.keys(jdCookieNode).forEach((item) => {
    cookiesArr.push(jdCookieNode[item])
  })
  if (process.env.JD_DEBUG && process.env.JD_DEBUG === 'false') console.log = () => {};
} else {
  cookiesArr = [$.getdata('CookieJD'), $.getdata('CookieJD2'), ...jsonParse($.getdata('CookiesJD') || "[]").map(item => item.cookie)].filter(item => !!item);
}
!(async() => {
  if (!cookiesArr[0]) {
    $.msg($.name, '【提示】请先获取cookie\n直接使用NobyDa的京东签到获取', 'https://bean.m.jd.com/bean/signIndex.action', {"open-url": "https://bean.m.jd.com/bean/signIndex.action"});
    return;
  }
  const cks = []
  for (let i =0; i < cookiesArr.length; i++) {
    const cookie = cookiesArr[i]
    cks.push(await TotalBean(cookie))
    if (!cks[i]){
      const UserName = decodeURIComponent(cookie.match(/pt_pin=([^; ]+)(?=;?)/) && cookie.match(/pt_pin=([^; ]+)(?=;?)/)[1])
      const msg = `${$.name}cookie已失效 - ${UserName} 京东账号${i} ${UserName}\n请重新登录获取cookie`
      $.msg(msg)
      if ($.isNode()) {
        await sendNotify(`${$.name}cookie已失效`,msg);
      }
    }
  }
  cookiesArr = cookiesArr.filter((_, index) => cks[index])
  let jrbodys
  if(process.env.JRBODY) {
    jrbodys = process.env.JRBODY.split('&')
    if (jrbodys.length != cookiesArr.length) {
      console.error('CK和JRBODY长度不匹配,不使用JRBODY,请阅读脚本开头说明')
      jrbodys = undefined
    }
  }else{
    console.log(`为检测到JRBODY环境变量,开始检测${jr_file}`)
    try {
      await fs.accessSync('./'+jr_file, fs.constants.F_OK)
      console.log(`${jr_file} '存在,读取配置'`)
      jrbodys = []
      await processLineByLine(jrbodys)
    } catch (err) {
      console.log(`${jr_file} '不存在,跳过'`)
    }
  }
  for (let i = 0; i < cookiesArr.length; i++) {
    const data = {
      'cookie':cookiesArr[i]
    }
    if (jrbodys) {
      if(jrbodys[i].startsWith('reqData=')){
          data['jrBody'] = jrbodys[i]
        }else{
          console.log(`跳过第${i+1}个JRBODY,为空或格式不正确`)
        }
    }
    cookiesArr[i] = data
  }
  if (!cookiesArr[0]) {
    $.msg($.name, '【提示】无可用cookie,结束');
    return;
  }
  // 下载最新代码
  const content = await download()
  if(! content){
    console.error("JD_DailyBonus.js 没有成功加载")
    $.done()
    return
  }
  console.log(`*****************开始${$.name}*******************\n`)
  const originalLog = console.log
  let notifyContent = ''
  console.log = (...args) => {
    if(args[0].includes("【签到概览】") || args[0].includes("【签到号")){
      notifyContent += args[0].split('\n\n')[1] + '\n'
    }
    originalLog.apply(
        console,
        [...args]
    )
    if (args[0].includes('签到用时')){
      console.log = originalLog
      if ($.isNode() && notifyContent.length != 0) {
        $.msg($.name, '', notifyContent)
        sendNotify($.name, notifyContent).then(() => {
          console.log('send Notify finish')
          $.done()
        })
      }else{
        $.done()
      }
    }
  }
  eval(changeFile(content,JSON.stringify(cookiesArr)))
  // new vm.Script('console.log("start");\n'+changeFile(content,JSON.stringify(cookiesArr))+'\nconsole.log("end");').runInThisContext()
  // new vm.Script(changeFile(content,JSON.stringify(cookiesArr))).runInContext(new vm.createContext({
  //   console: console,
  //   require: require,
  //   setTimeout:setTimeout
  // }))
})()
    .catch((e) => $.logErr(e))
    // .finally(() => $.done())

function changeFile (content,cookie) {
  console.log(`开始替换变量`)
  let newContent = content.replace(/var OtherKey = `.*`/, `var OtherKey = \`${cookie}\``);
  // newContent = newContent.replace(/const NodeSet = 'CookieSet.json'/, `const NodeSet = '${NodeSet}'`)
  if (process.env.JD_BEAN_STOP && process.env.JD_BEAN_STOP !== '0') {
    newContent = newContent.replace(/var stop = '0'/, `var stop = '${process.env.JD_BEAN_STOP}'`)
  }
  const zone = new Date().getTimezoneOffset()
  if (zone === 0) {
    //此处针对UTC-0时区用户做的
    newContent = newContent.replace(/tm\s=.*/, `tm = new Date(new Date().toLocaleDateString()).getTime() - 28800000;`)
  }
  return newContent
}

function TotalBean(cookie) {
  return new Promise(async resolve => {
    const options = {
      url: "https://wq.jd.com/user_new/info/GetJDUserInfoUnion?sceneval=2",
      headers: {
        Host: "wq.jd.com",
        Accept: "*/*",
        Connection: "keep-alive",
        Cookie: cookie,
        "User-Agent": $.isNode() ? (process.env.JD_USER_AGENT ? process.env.JD_USER_AGENT : (require('./USER_AGENTS').USER_AGENT)) : ($.getdata('JDUA') ? $.getdata('JDUA') : "jdapp;iPhone;9.4.4;14.3;network/4g;Mozilla/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148;supportJDSHWK/1"),
        "Accept-Language": "zh-cn",
        "Referer": "https://home.m.jd.com/myJd/newhome.action?sceneval=2&ufc=&",
        "Accept-Encoding": "gzip, deflate, br"
      }
    }
    $.post(options, (err, resp, data) => {
      try {
        if (err) {
          console.log(`${JSON.stringify(err)}`)
          console.error(`${$.name} API请求失败，请检查网路重试`)
          resolve(false)
        } else {
          if (data) {
            data = JSON.parse(data);
            if (data['retcode'] === "1001") {
              resolve(false); //cookie过期
              console.warn('CK过期')
              return
            }
            resolve(true)
          } else {
            console.error(`京东服务器返回空数据`)
            resolve(false)
          }
        }
      } catch (e) {
        $.logErr(e, resp)
      }
    })
  })
}
async function download() {
  return new Promise(resolve => {
    const options = { 'url':'https://raw.githubusercontent.com/NobyDa/Script/master/JD-DailyBonus/JD_DailyBonus.js', "timeout": 10000 };
    if ($.isNode() && process.env.TG_PROXY_HOST && process.env.TG_PROXY_PORT) {
      const tunnel = require("tunnel");
      const agent = {
        https: tunnel.httpsOverHttp({
          proxy: {
            host: process.env.TG_PROXY_HOST,
            port: process.env.TG_PROXY_PORT * 1
          }
        })
      }
      Object.assign(options, { agent })
    }
    $.get(options, async (err, resp, data) => {
      if (err) {
        console.log(`raw download err:${JSON.stringify(err)}`)
        console.log(`检测到您当前网络环境不能访问外网,将使用jsdelivr CDN下载JD_DailyBonus.js文件`);
        options['url'] = 'https://purge.jsdelivr.net/gh/NobyDa/Script@master/JD-DailyBonus/JD_DailyBonus.js'
        await $.http.get(options).then((resp) => {
          if (resp.statusCode === 200) {
            // console.log(`resp:${JSON.stringify(resp)}`)
            let { body } = resp;
            body = JSON.parse(body);
            if (body['success']) {
              console.log(`JD_DailyBonus.js文件  CDN刷新成功`)
            } else {
              console.log(`JD_DailyBonus.js文件 CDN刷新失败`)
            }
          }
        })
        options['url'] = 'https://cdn.jsdelivr.net/gh/NobyDa/Script@master/JD-DailyBonus/JD_DailyBonus.js'
        await $.get(options, async (err, resp, data) => {
          if (err) {
            console.error(`CDN download err:${JSON.stringify(err)}`)
            resolve()
          }else{
            console.log('JD_DailyBonus.js文件 下载成功(CDN)')
            resolve(data)
          }
        })
      } else {
        console.log(`JD_DailyBonus.js文件 下载成功(raw)`)
        resolve(data)
      }
    })
  })
}
function Env(t,e){"undefined"!=typeof process&&JSON.stringify(process.env).indexOf("GITHUB")>-1&&process.exit(0);class s{constructor(t){this.env=t}send(t,e="GET"){t="string"==typeof t?{url:t}:t;let s=this.get;return"POST"===e&&(s=this.post),new Promise((e,i)=>{s.call(this,t,(t,s,r)=>{t?i(t):e(s)})})}get(t){return this.send.call(this.env,t)}post(t){return this.send.call(this.env,t,"POST")}}return new class{constructor(t,e){this.name=t,this.http=new s(this),this.data=null,this.dataFile="box.dat",this.logs=[],this.isMute=!1,this.isNeedRewrite=!1,this.logSeparator="\n",this.startTime=(new Date).getTime(),Object.assign(this,e),this.log("",`🔔${this.name}, 开始!`)}isNode(){return"undefined"!=typeof module&&!!module.exports}isQuanX(){return"undefined"!=typeof $task}isSurge(){return"undefined"!=typeof $httpClient&&"undefined"==typeof $loon}isLoon(){return"undefined"!=typeof $loon}toObj(t,e=null){try{return JSON.parse(t)}catch{return e}}toStr(t,e=null){try{return JSON.stringify(t)}catch{return e}}getjson(t,e){let s=e;const i=this.getdata(t);if(i)try{s=JSON.parse(this.getdata(t))}catch{}return s}setjson(t,e){try{return this.setdata(JSON.stringify(t),e)}catch{return!1}}getScript(t){return new Promise(e=>{this.get({url:t},(t,s,i)=>e(i))})}runScript(t,e){return new Promise(s=>{let i=this.getdata("@chavy_boxjs_userCfgs.httpapi");i=i?i.replace(/\n/g,"").trim():i;let r=this.getdata("@chavy_boxjs_userCfgs.httpapi_timeout");r=r?1*r:20,r=e&&e.timeout?e.timeout:r;const[o,h]=i.split("@"),n={url:`http://${h}/v1/scripting/evaluate`,body:{script_text:t,mock_type:"cron",timeout:r},headers:{"X-Key":o,Accept:"*/*"}};this.post(n,(t,e,i)=>s(i))}).catch(t=>this.logErr(t))}loaddata(){if(!this.isNode())return{};{this.fs=this.fs?this.fs:require("fs"),this.path=this.path?this.path:require("path");const t=this.path.resolve(this.dataFile),e=this.path.resolve(process.cwd(),this.dataFile),s=this.fs.existsSync(t),i=!s&&this.fs.existsSync(e);if(!s&&!i)return{};{const i=s?t:e;try{return JSON.parse(this.fs.readFileSync(i))}catch(t){return{}}}}}writedata(){if(this.isNode()){this.fs=this.fs?this.fs:require("fs"),this.path=this.path?this.path:require("path");const t=this.path.resolve(this.dataFile),e=this.path.resolve(process.cwd(),this.dataFile),s=this.fs.existsSync(t),i=!s&&this.fs.existsSync(e),r=JSON.stringify(this.data);s?this.fs.writeFileSync(t,r):i?this.fs.writeFileSync(e,r):this.fs.writeFileSync(t,r)}}lodash_get(t,e,s){const i=e.replace(/\[(\d+)\]/g,".$1").split(".");let r=t;for(const t of i)if(r=Object(r)[t],void 0===r)return s;return r}lodash_set(t,e,s){return Object(t)!==t?t:(Array.isArray(e)||(e=e.toString().match(/[^.[\]]+/g)||[]),e.slice(0,-1).reduce((t,s,i)=>Object(t[s])===t[s]?t[s]:t[s]=Math.abs(e[i+1])>>0==+e[i+1]?[]:{},t)[e[e.length-1]]=s,t)}getdata(t){let e=this.getval(t);if(/^@/.test(t)){const[,s,i]=/^@(.*?)\.(.*?)$/.exec(t),r=s?this.getval(s):"";if(r)try{const t=JSON.parse(r);e=t?this.lodash_get(t,i,""):e}catch(t){e=""}}return e}setdata(t,e){let s=!1;if(/^@/.test(e)){const[,i,r]=/^@(.*?)\.(.*?)$/.exec(e),o=this.getval(i),h=i?"null"===o?null:o||"{}":"{}";try{const e=JSON.parse(h);this.lodash_set(e,r,t),s=this.setval(JSON.stringify(e),i)}catch(e){const o={};this.lodash_set(o,r,t),s=this.setval(JSON.stringify(o),i)}}else s=this.setval(t,e);return s}getval(t){return this.isSurge()||this.isLoon()?$persistentStore.read(t):this.isQuanX()?$prefs.valueForKey(t):this.isNode()?(this.data=this.loaddata(),this.data[t]):this.data&&this.data[t]||null}setval(t,e){return this.isSurge()||this.isLoon()?$persistentStore.write(t,e):this.isQuanX()?$prefs.setValueForKey(t,e):this.isNode()?(this.data=this.loaddata(),this.data[e]=t,this.writedata(),!0):this.data&&this.data[e]||null}initGotEnv(t){this.got=this.got?this.got:require("got"),this.cktough=this.cktough?this.cktough:require("tough-cookie"),this.ckjar=this.ckjar?this.ckjar:new this.cktough.CookieJar,t&&(t.headers=t.headers?t.headers:{},void 0===t.headers.Cookie&&void 0===t.cookieJar&&(t.cookieJar=this.ckjar))}get(t,e=(()=>{})){t.headers&&(delete t.headers["Content-Type"],delete t.headers["Content-Length"]),this.isSurge()||this.isLoon()?(this.isSurge()&&this.isNeedRewrite&&(t.headers=t.headers||{},Object.assign(t.headers,{"X-Surge-Skip-Scripting":!1})),$httpClient.get(t,(t,s,i)=>{!t&&s&&(s.body=i,s.statusCode=s.status),e(t,s,i)})):this.isQuanX()?(this.isNeedRewrite&&(t.opts=t.opts||{},Object.assign(t.opts,{hints:!1})),$task.fetch(t).then(t=>{const{statusCode:s,statusCode:i,headers:r,body:o}=t;e(null,{status:s,statusCode:i,headers:r,body:o},o)},t=>e(t))):this.isNode()&&(this.initGotEnv(t),this.got(t).on("redirect",(t,e)=>{try{if(t.headers["set-cookie"]){const s=t.headers["set-cookie"].map(this.cktough.Cookie.parse).toString();s&&this.ckjar.setCookieSync(s,null),e.cookieJar=this.ckjar}}catch(t){this.logErr(t)}}).then(t=>{const{statusCode:s,statusCode:i,headers:r,body:o}=t;e(null,{status:s,statusCode:i,headers:r,body:o},o)},t=>{const{message:s,response:i}=t;e(s,i,i&&i.body)}))}post(t,e=(()=>{})){if(t.body&&t.headers&&!t.headers["Content-Type"]&&(t.headers["Content-Type"]="application/x-www-form-urlencoded"),t.headers&&delete t.headers["Content-Length"],this.isSurge()||this.isLoon())this.isSurge()&&this.isNeedRewrite&&(t.headers=t.headers||{},Object.assign(t.headers,{"X-Surge-Skip-Scripting":!1})),$httpClient.post(t,(t,s,i)=>{!t&&s&&(s.body=i,s.statusCode=s.status),e(t,s,i)});else if(this.isQuanX())t.method="POST",this.isNeedRewrite&&(t.opts=t.opts||{},Object.assign(t.opts,{hints:!1})),$task.fetch(t).then(t=>{const{statusCode:s,statusCode:i,headers:r,body:o}=t;e(null,{status:s,statusCode:i,headers:r,body:o},o)},t=>e(t));else if(this.isNode()){this.initGotEnv(t);const{url:s,...i}=t;this.got.post(s,i).then(t=>{const{statusCode:s,statusCode:i,headers:r,body:o}=t;e(null,{status:s,statusCode:i,headers:r,body:o},o)},t=>{const{message:s,response:i}=t;e(s,i,i&&i.body)})}}time(t,e=null){const s=e?new Date(e):new Date;let i={"M+":s.getMonth()+1,"d+":s.getDate(),"H+":s.getHours(),"m+":s.getMinutes(),"s+":s.getSeconds(),"q+":Math.floor((s.getMonth()+3)/3),S:s.getMilliseconds()};/(y+)/.test(t)&&(t=t.replace(RegExp.$1,(s.getFullYear()+"").substr(4-RegExp.$1.length)));for(let e in i)new RegExp("("+e+")").test(t)&&(t=t.replace(RegExp.$1,1==RegExp.$1.length?i[e]:("00"+i[e]).substr((""+i[e]).length)));return t}msg(e=t,s="",i="",r){const o=t=>{if(!t)return t;if("string"==typeof t)return this.isLoon()?t:this.isQuanX()?{"open-url":t}:this.isSurge()?{url:t}:void 0;if("object"==typeof t){if(this.isLoon()){let e=t.openUrl||t.url||t["open-url"],s=t.mediaUrl||t["media-url"];return{openUrl:e,mediaUrl:s}}if(this.isQuanX()){let e=t["open-url"]||t.url||t.openUrl,s=t["media-url"]||t.mediaUrl;return{"open-url":e,"media-url":s}}if(this.isSurge()){let e=t.url||t.openUrl||t["open-url"];return{url:e}}}};if(this.isMute||(this.isSurge()||this.isLoon()?$notification.post(e,s,i,o(r)):this.isQuanX()&&$notify(e,s,i,o(r))),!this.isMuteLog){let t=["","==============📣系统通知📣=============="];t.push(e),s&&t.push(s),i&&t.push(i),console.log(t.join("\n")),this.logs=this.logs.concat(t)}}log(...t){t.length>0&&(this.logs=[...this.logs,...t]),console.log(t.join(this.logSeparator))}logErr(t,e){const s=!this.isSurge()&&!this.isQuanX()&&!this.isLoon();s?this.log("",`❗️${this.name}, 错误!`,t.stack):this.log("",`❗️${this.name}, 错误!`,t)}wait(t){return new Promise(e=>setTimeout(e,t))}done(t={}){const e=(new Date).getTime(),s=(e-this.startTime)/1e3;this.log("",`🔔${this.name}, 结束! 🕛 ${s} 秒`),this.log(),(this.isSurge()||this.isQuanX()||this.isLoon())&&$done(t)}}(t,e)}
