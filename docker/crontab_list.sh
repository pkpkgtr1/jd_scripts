# 每3天的23:50分清理一次日志(互助码不清理，proc_file.sh对该文件进行了去重)
50 23 */3 * * find /scripts/logs -name '*.log' | grep -v 'sharecodeCollection' | xargs rm -rf
#收集助力码
30 * * * * sh +x /scripts/docker/auto_help.sh collect >> /scripts/logs/auto_help_collect.log 2>&1


##############短期活动##############
#京东极速版红包(活动时间：2021-5-5至？)
#44 8,11 * * * node /scripts/jd_speed_redpocke.js >> /scripts/logs/jd_speed_redpocke.log 2>&1
#半点京豆雨
#30 16-23/1 * * *  node /scripts/jd_half_redrain.js >> /scripts/logs/jd_half_redrain.log 2>&1
#柠檬推一推
0 3 * * * node /scripts/jd_tyt.js  >> /scripts/logs/jd_tyt.log 2>&1
#柠檬众筹许愿池
0 6 * * * node /scripts/jd_wish.js  >> /scripts/logs/jd_wish.log 2>&1  
#小鸽有礼
13 1,22,23 * * *  node /scripts/jd_daily_lottery.js   >> /scripts/logs/jd_daily_lottery.log 2>&1
#添加MM领京豆
15 1,9 * * * node /scripts/gua_MMdou.js   >> /scripts/logs/gua_MMdou.log 2>&1
#京喜签到
30 0,22 * * * node /scripts/jd_jx_sign.js   >> /scripts/logs/jd_jx_sign.log 2>&1  
#积分换话费
33 7,19 * * *  node /scripts/jd_dwapp.js >> /scripts/logs/jd_dwapp.log 2>&1    
# 京喜财富岛热气球
#30 * * * * node /scripts/jd_cfd_loop.js >> /scripts/logs/jd_cfd_loop.log 2>&1  
#发财大赢家
#1 6-22/6 * * * node /scripts/jd_fcdyj.js >> /scripts/logs/jd_fcdyj.log 2>&1  
#整点红包雨
#0 9-22/1 9-20 11 * node /scripts/jd_super_redrain.js >> /scripts/logs/jd_super_redrain.log 2>&1 
#发财挖宝
#40 12,16 * * * node /scripts/jd_fcwb.js >> /scripts/logs/jd_fcwb.log 2>&1 
#粉丝签到
0 8 * * * node /scripts/jd_fan.js >> /scripts/logs/jd_fan.log 2>&1 
#美丽研究院--兑换
#5 0,1-23/3 * * *  node /scripts/jd_beauty_ex.js  >> /scripts/logs/jd_beauty_ex.log 2>&1  
#京东赚赚
10 3 * * *  node /scripts/jd_jdzz.js >> /scripts/logs/jd_jdzz.log 2>&1 
#京东我的理想家，可抽奖获得京豆
18 0,21 * * *  node /scripts/jd_lxLottery.js >> /scripts/logs/jd_lxLottery.log 2>&1 
#生活特权
26 22 * *  node /scripts/jd_week.js >> /scripts/logs/jd_week.log 2>&1 
#京东特价翻翻乐
#15 0,8 * * * node /scripts/jd_jdtj_winner.js  >> /scripts/logs/jd_jdtj_winner.log 2>&1 
#京东通天塔--签到
#3 1,11 * * * node /scripts/jd_m_sign.js  >> /scripts/logs/jd_m_sign.log 2>&1 
#颜究种植园
15 10,22 31,1 1,2 *  node /scripts/jd_xinruimz.js  >> /scripts/logs/jd_xinruimz.log 2>&1
#健康社区种植
#15 6,17 * * * cd /scripts && python3 jd_health_plant.py  >> /scripts/logs/jd_health_plant.log 2>&1
#店铺签到
10 5 * * * node /scripts/jd_dpqd.js >> /scripts/logs/jd_dpqd.log 2>&1 
#发财挖宝助力
10 6 * * * node /scripts/jd_fcwb_help.js >> /scripts/logs/jd_fcwb_help.log 2>&1
#开卡脚本
#30 12,16 19-31/3 4 * node /scripts/jd_opencardty.js >> /scripts/logs/jd_opencardty.log 2>&1
#通用开卡脚本
#30 12 * * * node /scripts/jd_opencardDPLHTY.js >> /scripts/logs/jd_opencardDPLHTY.log 2>&1
#通用CJ组队瓜分
#30 12 * * * node /scripts/jd_cjzdgf.js >> /scripts/logs/jd_cjzdgf.log 2>&1
#特务集卡
35 10,20 * * * node /scripts/jd_superBrand.js >> /scripts/logs/jd_superBrand.log 2>&1
#旺旺乐园任务
35 6,7 * * * node /scripts/jd_joy_park_task.js >> /scripts/logs/jd_joy_park_task.log 2>&1
#小鸽有礼微信签到
06 6,7 * * * node /scripts/jd_xgyl_wx.js  >> /scripts/logs/jd_xgyl_wx.log 2>&1
#入口：APP首页下拉-JOY庄园
11 0,16 * * *  node /scripts/jd_joymanor_task.js  >> /scripts/logs/jd_joymanor_task.log 2>&1
#5.1-5.30 云养牛，免费赢好礼
31 7-20/1 1-30 5 *   node /scripts/jd_mnyyn.js  >> /scripts/logs/jd_mnyyn.log 2>&1
#探味奇遇记 活动入口：美食馆-右侧悬浮
31 0,13 26-31,1-16 5,6 *   node /scripts/jd_tanwei.js  >> /scripts/logs/jd_tanwei.log 2>&1
#618红包
31 0 1-18 6 *   node /scripts/jd_tanwei.js  >> /scripts/logs/jd_tanwei.log 2>&1
#京东超级盲盒
0 20 3,17 6 *  node /scripts/jd_supermh.js  >> /scripts/logs/jd_supermh.log 2>&1
#京洞察问卷通知
0 9 * * *  node /scripts/jd_insight.js  >> /scripts/logs/jd_insight.log 2>&1
#头文字J
0 9 * * *  node /scripts/jd_carplay.js  >> /scripts/logs/jd_carplay.log 2>&1
#618红包
5 0 * * *  node /scripts/jd_618red.js  >> /scripts/logs/jd_618red.log 2>&1

##############开卡活动##############
#5.5-6.20【金领冠】航天活动
30 10 5-31,1-19 5,6 * node /scripts/jd_opencardL131.js >> /scripts/logs/jd_opencardL131.log 2>&1
#5.1-9.30 泉粉邀请卡
30 5 7-31 5 * node /scripts/jd_opencardL133.js >> /scripts/logs/jd_opencardL133.log 2>&1
#5.23-6.20 会员联合狂欢  618百万京豆大派送
20 0 23-31,1-20 5,6 * node /scripts/jd_opencardL155.js >> /scripts/logs/jd_opencardL155.log 2>&1
#5.23-6.20 寻找潮配之旅
18 2 23-31,1-20 5,6 * node /scripts/jd_opencardL156.js >> /scripts/logs/jd_opencardL156.log 2>&1
#入口：[ 5.23-6.19 母婴“会”聚 幸运连击]
40 13 26-31,1-19 5,6 *  node /scripts/jd_xiaomi.js >> /scripts/logs/jd_xiaomi.log 2>&1
#5.31~6.20 时尚狂欢盛典
35 21 31,1-20 5,6 *   node /scripts/jd_opencardL164.js  >> /scripts/logs/jd_opencardL164.log 2>&1 
#5.31~6.10 大牌联合 好物焕新季
1 22 31,1-10 5,6 *   node /scripts/jd_opencardL165.js  >> /scripts/logs/jd_opencardL165.log 2>&1 
#6.1~6.18 618限定 和你一起为爱而购
40 0 1-18 6 *  node /scripts/jd_opencardL166.js  >> /scripts/logs/jd_opencardL166.log 2>&1 
#6.1~6.18 618 陪伴让爱升级
1 1 1-18 6 *   node /scripts/jd_opencardL168.js  >> /scripts/logs/jd_opencardL168.log 2>&1 
#6.1~6.18 618 感恩有你 真情回馈
35 1 1-18 6 *  node /scripts/jd_opencardL169.js  >> /scripts/logs/jd_opencardL169.log 2>&1 
#6.1~6.18 618 大牌有礼 暖心陪伴
1 2 1-18 6 * node /scripts/jd_opencardL170js  >> /scripts/logs/jd_opencardL170.log 2>&1 
#6.1~6.18 盛宠618 大牌齐聚倾囊相送
35 2 1-18 6 *   node /scripts/jd_opencardL171.js  >> /scripts/logs/jd_opencardL171.log 2>&1 
#6.1-6.18 情暖618 全民抢红包
551 1-18 6 *   node /scripts/jd_opencardL172.js  >> /scripts/logs/jd_opencardL172.log 2>&1 
#6.1-6.30 雅诗兰黛奢雅邀请入会有礼
31 13 1-30/5 6 *   node /scripts/jd_opencardL174.js  >> /scripts/logs/jd_opencardL174.log 2>&1 
#6.1-6.20 酒水会员盛典
1 21 1-20 6 *  node /scripts/jd_opencardL175.js  >> /scripts/logs/jd_opencardL175.log 2>&1 
#6.2-6.20 大牌狂欢嗨享购
35 9 3-20 6 * node /scripts/jd_opencardL176.js  >> /scripts/logs/jd_opencardL176.log 2>&1 

#6.9-6.18 618好物狂欢盛典
11 0,18 9-18 6 * node /scripts/jd_opencardL184.js  >> /scripts/logs/jd_opencardL184.log 2>&1
#6.10~6.20 心尖好物 618拔草时刻
41 0,18 8-20 6 * node /scripts/jd_opencardL185.js  >> /scripts/logs/jd_opencardL185.log 2>&1
#6.10~6.20 为热爱选择 一起618
23 0,18 10-30 6 * node /scripts/jd_opencardL186.js  >> /scripts/logs/jd_opencardL186.log 2>&1
##############长期活动##############
#领津贴
30 5,23 * * * node /scripts/jd_jin_tie.js >> /scripts/logs/jd_jin_tie.log 2>&1
#极速版签到
30 0 * * * node /scripts/jd_js_sign.js >> /scripts/logs/jd_js_sign.log 2>&1
# 签到
7 0,17 * * * cd /scripts && node jd_bean_sign.js >> /scripts/logs/jd_bean_sign.log 2>&1
# 东东超市兑换奖品
0,30 0 * * * node /scripts/jd_blueCoin.js >> /scripts/logs/jd_blueCoin.log 2>&1
# 摇京豆
5 0,6,23 * * * node /scripts/jd_club_lottery.js >> /scripts/logs/jd_club_lottery.log 2>&1
# 东东农场
15 6-18/6 * * * node /scripts/jd_fruit.js >> /scripts/logs/jd_fruit.log 2>&1
# 宠汪汪
45 */2,23 * * * node /scripts/jd_joy.js >> /scripts/logs/jd_joy.log 2>&1
# 宠汪汪偷好友积分与狗粮
10 0-21/3 * * * node /scripts/jd_joy_steal.js >> /scripts/logs/jd_joy_steal.log 2>&1
# 宠汪汪积分兑换京豆
59 7,15,23 * * * node /scripts/jd_joy_reward.js >> /scripts/logs/jd_joy_reward.log 2>&1
# 宠汪汪喂食
35 */1 * * * node /scripts/jd_joy_feedPets.js >> /scripts/logs/jd_joy_feedPets.log 2>&1
# 宠汪汪邀请助力
10 13-20/1 * * * node /scripts/jd_joy_run.js >> /scripts/logs/jd_joy_run.log 2>&1
# 摇钱树
23 */2 * * * node /scripts/jd_moneyTree.js >> /scripts/logs/jd_moneyTree.log 2>&1
# 东东萌宠
35 6-18/6 * * * node /scripts/jd_pet.js >> /scripts/logs/jd_pet.log 2>&1
# 京东种豆得豆
10 7-22/1 * * * node /scripts/jd_plantBean.js >> /scripts/logs/jd_plantBean.log 2>&1
# 进店领豆
6 0 * * * node /scripts/jd_shop.js >> /scripts/logs/jd_shop.log 2>&1
# 东东超市
31 0,1-23/2 * * * node /scripts/jd_superMarket.js >> /scripts/logs/jd_superMarket.log 2>&1
# 取消关注
45 23,6 * * * node /scripts/jd_unsubscribe.js >> /scripts/logs/jd_unsubscribe.log 2>&1
# 京豆变动通知(增强版)
20 17 * * * node /scripts/jd_bean_change.js >> /scripts/logs/jd_bean_change.log 2>&1
# 京东抽奖机
0 0,12,23 * * * node /scripts/jd_lotteryMachine.js >> /scripts/logs/jd_lotteryMachine.log 2>&1
# 京东排行榜
21 9 * * * node /scripts/jd_rankingList.js >> /scripts/logs/jd_rankingList.log 2>&1
# 金融养猪
32 0-23/6 * * * node /scripts/jd_pigPet.js >> /scripts/logs/jd_pigPet.log 2>&1
# 点点券
40 0,20 * * * node /scripts/jd_necklace.js >> /scripts/logs/jd_necklace.log 2>&1
# 京喜工厂
50 * * * * node /scripts/jd_dreamFactory.js >> /scripts/logs/jd_dreamFactory.log 2>&1
# 东东小窝
46 6,23 * * * node /scripts/jd_small_home.js >> /scripts/logs/jd_small_home.log 2>&1
# 东东工厂
26 * * * * node /scripts/jd_jdfactory.js >> /scripts/logs/jd_jdfactory.log 2>&1
# 赚京豆(微信小程序)
#12 * * * * node /scripts/jd_syj.js >> /scripts/logs/jd_syj.log 2>&1
# 京东快递签到
47 1 * * * node /scripts/jd_kd.js >> /scripts/logs/jd_kd.log 2>&1
# 领京豆额外奖励(每日可获得3京豆)
23 1,12,22 * * * node /scripts/jd_bean_home.js >> /scripts/logs/jd_bean_home.log 2>&1
# 微信小程序京东赚赚
#6 0-5/1,11 * * * node /scripts/jd_jdzz.js >> /scripts/logs/jd_jdzz.log 2>&1
# 导到所有互助码
23 7 * * * node /scripts/jd_get_share_code.js >> /scripts/logs/jd_get_share_code.log 2>&1
# 口袋书店
38 8,12,18 * * * node /scripts/jd_bookshop.js >> /scripts/logs/jd_bookshop.log 2>&1
# 京喜农场
30 9,12,18 * * * node /scripts/jd_jxnc.js >> /scripts/logs/jd_jxnc.log 2>&1
# 领现金
10 */4 * * * node /scripts/jd_cash_windfgg.js >> /scripts/logs/jd_cash_windfgg.log 2>&1
#领现金微信版
15 0,7 * * * node /scripts/jd_cash_wx.js >> /scripts/logs/jd_cash_wx.log 2>&1
# 闪购盲盒
47 8,22 * * * node /scripts/jd_sgmh.js >> /scripts/logs/jd_sgmh.log 2>&1
# 京东秒秒币
10 6,21 * * * node /scripts/jd_ms.js >> /scripts/logs/jd_ms.log 2>&1
#美丽研究院
1 7,12,19 * * * node /scripts/jd_beauty.js >> /scripts/logs/jd_beauty.log 2>&1
#京东保价
#41 0,23 * * * node /scripts/jd_price.js >> /scripts/logs/jd_price.log 2>&1
#京东极速版签到+赚现金任务
21 1,6 * * * node /scripts/jd_speed_sign.js >> /scripts/logs/jd_speed_sign.log 2>&1
# 删除优惠券(默认注释，如需要自己开启，如有误删，已删除的券可以在回收站中还原，慎用)
#20 9 * * 6 node /scripts/jd_delCoupon.js >> /scripts/logs/jd_delCoupon.log 2>&1
#京喜工厂商品列表详情
10 10 * * * node /scripts/jx_products_detail.js >> /scripts/logs/jx_products_detail.log 2>&1 
#京东直播（又回来了）
50 12-14 * * * node /scripts/jd_live_redrain.js >> /scripts/logs/jd_live_redrain.log 2>&1
#京东健康社区
13 1,6,22 * * * node /scripts/jd_health.js >> /scripts/logs/jd_health.log 2>&1
#京东健康社区收集健康能量
5-45/20 * * * * node /scripts/jd_health_collect.js >> /scripts/logs/jd_health_collect.log 2>&1
# 领金贴
5 0 * * * node /scripts/jd_jin_tie.js >> /scripts/logs/jd_jin_tie.log 2>&1
#京喜牧场
15 0,3,6,12,14,16,18,20,22 * * * node /scripts/jd_jxmc.js >> /scripts/logs/jd_jxmc.log 2>&1 
#京东签到图形验证
14 2,10 * * * node /scripts/jd_sign_graphics.js >> /scripts/logs/jd_sign_graphics.log 2>&1   
#京东试用
14 8-18/5 * * * node /scripts/jd_try.js >> /scripts/logs/jd_try.log 2>&1 
#财富大陆
18 0,6-23/2 * * * node /scripts/gua_wealth_island.js  >> /scripts/logs/gua_wealth_island.log 2>&1 
#财富大陆(京喜财富岛)
18 0-23/2 * * * node /scripts/jd_cfd.js  >> /scripts/logs/jd_cfd.log 2>&1 
#汪汪乐园每日任务
#20 7,9,17,20 * * * node /scripts/jd_joy_park_task.js >> /scripts/logs/jd_joy_park_task.log 2>&1 
#汪汪乐园
#20 0-23/10 * * * node /scripts/jd_joy_park.js >> /scripts/logs/jd_joy_park.log 2>&1 
#取关主播
55 6 * * *  node /scripts/jd_unsubscriLive.js >> /scripts/logs/jd_unsubscriLive.log 2>&1 
#（快过期）京豆兑换为喜豆
#33 0 * * *  node /scripts/jd_exchangejxbeans.js >> /scripts/logs/jd_exchangejxbeans.log 2>&1  
#清理购物车
33 0 */1 * *  node /scripts/jd_cleancart.js >> /scripts/logs/jd_cleancart.log 2>&1 
