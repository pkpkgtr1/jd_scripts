/*
京东快递签到
活动入口：https://jingcai-h5.jd.com/#/
签到领豆,14天内满4次和7次享额外奖励，每天运行一次即可
更新地址：https://gitee.com/lxk0301/jd_scripts/raw/master/jd_kd.js

已支持IOS双京东账号, Node.js支持N个京东账号
脚本兼容: QuantumultX, Surge, Loon, 小火箭，JSBox, Node.js
============Quantumultx===============
[task_local]
#京东快递签到
10 0 * * * https://gitee.com/lxk0301/jd_scripts/raw/master/jd_kd.js, tag=京东快递签到, img-url=https://raw.githubusercontent.com/58xinian/icon/master/jd_kd.png, enabled=true

================Loon==============
[Script]
cron "10 0 * * *" script-path=https://gitee.com/lxk0301/jd_scripts/raw/master/jd_kd.js, tag=京东快递签到

===============Surge=================
京东快递签到 = type=cron,cronexp="10 0 * * *",wake-system=1,timeout=3600,script-path=https://gitee.com/lxk0301/jd_scripts/raw/master/jd_kd.js

============小火箭=========
京东快递签到 = type=cron,script-path=https://gitee.com/lxk0301/jd_scripts/raw/master/jd_kd.js, cronexpr="10 0 * * *", timeout=3600, enable=true
 */
const jd_helpers = require('./utils/JDHelpers.js');
const jd_env = require('./utils/JDEnv.js');
const $ = jd_env.env('京东快递签到');

const notify = $.isNode() ? require('./sendNotify') : '';
//Node.js用户请在jdCookie.js处填写京东ck;
const jdCookieNode = $.isNode() ? require('./jdCookie.js') : '';
let jdNotify = true; //是否关闭通知，false打开通知推送，true关闭通知推送
const randomCount = $.isNode() ? 20 : 5;
//IOS等用户直接用NobyDa的jd cookie
let cookiesArr = [],
  cookie = '',
  message,
  allMsg = '';
if ($.isNode()) {
  Object.keys(jdCookieNode).forEach((item) => {
    cookiesArr.push(jdCookieNode[item]);
  });
  if (process.env.JD_DEBUG && process.env.JD_DEBUG === 'false') console.log = () => {};
} else {
  cookiesArr = [$.getdata('CookieJD'), $.getdata('CookieJD2'), ...jd_helpers.jsonParse($.getdata('CookiesJD') || '[]').map((item) => item.cookie)].filter((item) => !!item);
}
const JD_API_HOST = 'https://api.m.jd.com/api';
!(async () => {
  if (!cookiesArr[0]) {
    $.msg($.name, '【提示】请先获取京东账号一cookie\n直接使用NobyDa的京东签到获取', 'https://bean.m.jd.com/bean/signIndex.action', { 'open-url': 'https://bean.m.jd.com/bean/signIndex.action' });
    return;
  }
  for (let i = 0; i < cookiesArr.length; i++) {
    if (cookiesArr[i]) {
      $.cookie = cookie = cookiesArr[i];
      $.UserName = decodeURIComponent(cookie.match(/pt_pin=([^; ]+)(?=;?)/) && cookie.match(/pt_pin=([^; ]+)(?=;?)/)[1]);
      $.index = i + 1;
      $.isLogin = true;
      $.nickName = '';
      message = '';
      await $.totalBean();
      console.log(`\n******开始【京东账号${$.index}】${$.nickName || $.UserName}*********\n`);
      if (!$.isLogin) {
        $.msg($.name, `【提示】cookie已失效`, `京东账号${$.index} ${$.nickName || $.UserName}\n请重新登录获取\nhttps://bean.m.jd.com/bean/signIndex.action`, {
          'open-url': 'https://bean.m.jd.com/bean/signIndex.action',
        });

        if ($.isNode()) {
          await notify.sendNotify(`${$.name}cookie已失效 - ${$.UserName}`, `京东账号${$.index} ${$.UserName}\n请重新登录获取cookie`);
        }
        continue;
      }
      await userSignIn();
      // await showMsg();
    }
  }
  if (allMsg) {
    $.msg($.name, '', allMsg);
  }
})()
  .catch((e) => {
    $.log('', `❌ ${$.name}, 失败! 原因: ${e}!`, '');
  })
  .finally(() => {
    $.done();
  });

function showMsg() {
  return new Promise((resolve) => {
    $.msg($.name, '', `【京东账号${$.index}】${$.nickName}\n${message}`);
    resolve();
  });
}
function userSignIn() {
  return new Promise((resolve) => {
    $.post(taskUrl(), (err, resp, data) => {
      try {
        if (err) {
          console.log(`${JSON.stringify(err)}`);
          console.log(resp);
          console.log(`${$.name} API请求失败，请检查网路重试`);
        } else {
          if (jd_helpers.safeGet(data)) {
            data = JSON.parse(data);
            if (data.code === 1) {
              console.log(`今日签到成功，获得${data.content[0].title}`);
              message += `京东账号${$.index}${$.nickName}\n今日签到成功，获得${data.content[0].title} 🐶\n`;
              allMsg += message;
            } else if (data.code === -1) {
              console.log(`今日已签到`);
              // message += `【签到】失败，今日已签到`;
            } else {
              console.log(`异常：${JSON.stringify(data)}`);
            }
          }
        }
      } catch (e) {
        $.logErr(e, resp);
      } finally {
        resolve();
      }
    });
  });
}
function taskUrl() {
  let t = +new Date();
  return {
    url: `https://lop-proxy.jd.com/jiFenApi/signInAndGetReward`,
    body: '[{"userNo":"$cooMrdGatewayUid$"}]',
    headers: {
      uuid: `${t}${t * 2}`,
      Host: 'lop-proxy.jd.com',
      'lop-dn': 'jingcai.jd.com',
      'biz-type': 'service-monitor',
      'app-key': 'jexpress',
      access: 'H5',
      'content-type': 'application/json;charset=utf-8',
      clientinfo: '{"appName":"jingcai","client":"m"}',
      accept: 'application/json, text/plain, */*',
      'jexpress-report-time': t,
      'x-requested-with': 'XMLHttpRequest',
      'source-client': '2',
      appparams: '{"appid":158,"ticket_type":"m"}',
      version: '1.0.0',
      origin: 'https://jingcai-h5.jd.com',
      'sec-fetch-site': 'same-site',
      'sec-fetch-mode': 'cors',
      'sec-fetch-dest': 'empty',
      referer: 'https://jingcai-h5.jd.com/',
      'accept-language': 'zh-CN,zh;q=0.9',
      Cookie: cookie,
      'User-Agent': $.isNode()
        ? process.env.JD_USER_AGENT
          ? process.env.JD_USER_AGENT
          : require('./USER_AGENTS').USER_AGENT
        : $.getdata('JDUA')
        ? $.getdata('JDUA')
        : 'jdapp;iPhone;9.4.4;14.3;network/4g;Mozilla/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148;supportJDSHWK/1',
    },
  };
}
