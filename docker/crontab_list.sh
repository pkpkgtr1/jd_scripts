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
#天天优惠大乐透
15 6 * * *  node /scripts/jd_DrawEntrance.js   >> /scripts/logs/jd_DrawEntrance.log 2>&1  
#省钱大赢家之翻翻乐
#1 0-12/6 * * *  node /scripts/jd_big_winner.js   >> /scripts/logs/jd_big_winner.log 2>&1  
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
#通天塔签到共建
#53 0,12 * * * node /scripts/jd_babel_sign.js >> /scripts/logs/jd_babel_sign.log 2>&1  
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

##############开卡活动##############
#5.5-6.20【金领冠】航天活动
30 10 5-31,1-19 5,6 * node /scripts/jd_opencardL131.js >> /scripts/logs/jd_opencardL131.log 2>&1
#5.1-5.31 植选轻饮小店
25 11 1-31 5 * node /scripts/jd_opencardL132.js >> /scripts/logs/jd_opencardL132.log 2>&1
#5.1-9.30 泉粉邀请卡
30 5 7-31 5 * node /scripts/jd_opencardL133.js >> /scripts/logs/jd_opencardL133.log 2>&1
#5.1-5.31 唤醒味蕾 伊样吃狂
33 19 1-31 5 *  node /scripts/jd_opencardL134.js >> /scripts/logs/jd_opencardL134.log 2>&1
#5.8-5.31 洁净星愿
33 3 8-31 5 * node /scripts/jd_opencardL135.js >> /scripts/logs/jd_opencardL135.log 2>&1
#5.9-5.19 酒水会员盛典
50 11 9-19 5 * node /scripts/jd_opencardL137.js >> /scripts/logs/jd_opencardL137.log 2>&1
#5.12~5.20 吃货来袭 惠聚好食光
10 12 12-20 5 * node /scripts/jd_opencardL140.js >> /scripts/logs/jd_opencardL140.log 2>&1
#5.15-5.28 童装童鞋盛典
35 5 16-28 5 * node /scripts/jd_opencardL144.js >> /scripts/logs/jd_opencardL144.log 2>&1

#5.16-5.23 情暖五月 以爱之名
15 21 15-23 5 * node /scripts/jd_opencardL146.js >> /scripts/logs/jd_opencardL146.log 2>&1
#5.17-6.1 爱上夏日 大牌献礼
0 2 17-31,1 5,6 * node /scripts/jd_opencardL147.js >> /scripts/logs/jd_opencardL147.log 2>&1
##############长期活动##############
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
20 10 * * * node /scripts/jd_bean_change.js >> /scripts/logs/jd_bean_change.log 2>&1
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
# 京东汽车(签到满500赛点可兑换500京豆)
0 0 * * * node /scripts/jd_car.js >> /scripts/logs/jd_car.log 2>&1
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
10 */4 * * * node /scripts/jd_cash.js >> /scripts/logs/jd_cash.log 2>&1
# 签到领现金
15 0,7 * * * node /scripts/jd_ccSign.js >> /scripts/logs/jd_ccSign.log 2>&1
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
#东东乐园
18 7 * * * node /scripts/jd_ddly.js >> /scripts/logs/jd_ddly.log 2>&1
#早起福利
30 6 * * *  node /scripts/jd_goodMorning.js >> /scripts/logs/jd_goodMorning.log 2>&1  
#京东签到图形验证
14 2,10 * * * node /scripts/jd_sign_graphics.js >> /scripts/logs/jd_sign_graphics.log 2>&1   
#京东试用
#14 10-20/8 * * * node /scripts/jd_try.js >> /scripts/logs/jd_try.log 2>&1 
#京东试用python版
14 7-15/7 * * * cd /scripts && python3 /scripts/jd_try.py > /scripts/logs/jd_try.log 2>&1
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
33 0 * * *  node /scripts/jd_exchangejxbeans.js >> /scripts/logs/jd_exchangejxbeans.log 2>&1  
#清理购物车
33 0 */1 * *  node /scripts/jd_cleancart.js >> /scripts/logs/jd_cleancart.log 2>&1 
