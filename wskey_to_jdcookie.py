import re
#此脚本给python获取ck使用
def read_js_cookie():
    all_ck = ''
    js=0
    with open("jdCookie.js", "r", encoding='utf-8') as f:  # 打开文件
        data = f.read()  # 读取文件

    env_jd_cookie_list=(re.findall(r"'pt_key=(.*?)',",data))
    ck_len = len(env_jd_cookie_list)
    for i in  env_jd_cookie_list:
        if js ==ck_len-1:
            all_ck= all_ck +'pt_key=' + i         
        else:
            all_ck= all_ck +'pt_key=' + i + '&'
            js=js+1
    return(all_ck)




print(read_js_cookie())
