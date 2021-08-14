# 每3天的23:50分清理一次日志(互助码不清理，proc_file.sh对该文件进行了去重)
50 23 */3 * * find /scripts/logs -name '*.log' | grep -v 'sharecodeCollection' | xargs rm -rf
#收集助力码
30 * * * * sh +x /scripts/docker/auto_help.sh collect >> /scripts/logs/auto_help_collect.log 2>&1

##############短期活动##############
#京东极速版红包(活动时间：2021-5-5至？)
45 0,6,23 * * * node /scripts/jd_speed_redpocke.js >> /scripts/logs/jd_speed_redpocke.log 2>&1
#女装盲盒（活动时间：2021-8-5至2021-8-31）
35 1,23 * * *  node /scripts/jd_nzmh.js >> /scripts/logs/jd_nzmh.log 2>&1
#超级直播间红包雨(活动时间不定期，出现异常提示请忽略。红包雨期间会正常)
40 */1 * * * node /scripts/jd_live_redrain.js >> /scripts/logs/jd_live_redrain.log 2>&1
#金榜创造营 活动时间：2021-05-21至2021-12-31
0 1,22 * * * node /scripts/jd_gold_creator.js >> /scripts/logs/jd_gold_creator.log 2>&1
#半点京豆雨
30 16-23/1 * * *  node /scripts/jd_half_redrain.js >> /scripts/logs/jd_half_redrain.log 2>&1
#星系牧场
30 7 * * *  node /scripts/jd_qqxing.js >> /scripts/logs/jd_qqxing.log 2>&1
#来客有礼小程序
45 4 * * * node /scripts/jd_sendBeans.js >> /scripts/logs/jd_sendBeans.log 2>&1
#柠檬推一推
0 0 * * * node /scripts/jd_tyt.js  >> /scripts/logs/jd_tyt.log 2>&1
#柠檬众筹许愿池
0 6 * * * node /scripts/jd_wish.js  >> /scripts/logs/jd_wish.log 2>&1
#天天优惠大乐透
15 6 * * *  node /scripts/jd_DrawEntrance.js   >> /scripts/logs/jd_DrawEntrance.log 2>&1  
#省钱大赢家之翻翻乐
1 0-23/1 * * *  node /scripts/jd_big_winner.js   >> /scripts/logs/jd_big_winner.log 2>&1  
#小鸽有礼
13 1,22,23 * * *  node /scripts/jd_daily_lottery.js   >> /scripts/logs/jd_daily_lottery.log 2>&1
#柠檬伊利养牛记
0 6-23/3 * * * node /scripts/jd_ylyn.js   >> /scripts/logs/jd_ylyn.log 2>&1
#赚30
1 1,12 * * * node /scripts/jd_earn30.js   >> /scripts/logs/jd_earn30.log 2>&1
#添加MM领京豆
15 1,9 * * * node /scripts/gua_MMdou.js   >> /scripts/logs/gua_MMdou.log 2>&1
#财富大陆互助
18 0,1,9,14,18 * * *   node /scripts/gua_wealth_island_help.js    >> /scripts/logs/gua_wealth_island_help.log 2>&1 
#真·抢京豆
0 0 * * *  node /scripts/jd_angryBean.js   >> /scripts/logs/jd_angryBean.log 2>&1
#京喜领88元红包
4 2,10 * * *  node /scripts/jd_jxlhb.js  >> /scripts/logs/jd_jxlhb.log 2>&1
#京喜签到
30 0,22 * * * node /scripts/jx_sign.js  >> /scripts/logs/jx_sign.log 2>&1
#七夕告白季-开卡
30 0,8 * 8 * node /scripts/gua_opencard6.js  >> /scripts/logs/gua_opencard6.log 2>&1
#七夕情报局
36 0,10,21 4-15 8 * node /scripts/gua_doge.js  >> /scripts/logs/gua_doge.log 2>&1 
#全民抢京豆 8.6-8.16
10 7 * * *  node /scripts/jd_qjd.py >> /scripts/logs/jd_qjd.log 2>&1 
#8.8-8.14 七夕会员福利社 [gua_opencard7.js]
36 0,10,21 4-15 8 * node /scripts/guaopencard7.js  >> /scripts/logs/guaopencard7.log 2>&1 
#8.10-8.15 头号玩家 一起热8
28 0,22 8-15 8 * node /scripts/guaopencard8.js  >> /scripts/logs/guaopencard8.log 2>&1 
#8.11-8.15 星动七夕 纵享丝滑
39 0,22 8-15 8 * node /scripts/guaopencard9.js  >> /scripts/logs/guaopencard9.log 2>&1 
#8.11-8.18 大牌联合 约惠一夏
30 0,22 11-18 8 *  node /scripts/guaopencard10.js  >> /scripts/logs/guaopencard10.log 2>&1 
#京东手机狂欢城活动（活动时间: 2021-8-9至2021-8-28）
0 0-18/6 * * * node /scripts/gua_carnivalcity.js  >> /scripts/logs/gua_carnivalcity.log 2>&1 
#粉丝互动
34 6,18 * * *  node /scripts/jd_wxFans.js  >> /scripts/logs/jd_wxFans.log 2>&1 
#来电好物季
10 1 * * * node /scripts/zy_ldhwj.js >> /scripts/logs/zy_ldhwj.log 2>&1  
#荣耀焕新季
0 1 * * * node /scripts/zy_ryhxj.js >> /scripts/logs/zy_ryhxj.log 2>&1
# 京小鸽吾悦寄
35 4,7 * * * node /scripts/jd_jxg.js >> /scripts/logs/jd_jxg.log 2>&1
# 汽车生活节
30 9,21 12-20 8 * node /scripts/jd_qcshj.js >> /scripts/logs/jd_qcshj.log 2>&1
#8.13-8.31 小米-星空大冒险
31 8,22 13-31 8 *   node /scripts/gua_xmGame.js >> /scripts/logs/gua_xmGame.log 2>&1 
#8.13-8.25 骁龙品牌日 
31 8,22 13-31 8 *   node /scripts/gua_xiaolong.js >> /scripts/logs/gua_xiaolong.log 2>&1 
#金机馆
33 4,7 8-20 8 *    node /scripts/jd_goldPhone.js >> /scripts/logs/jd_goldPhone.log 2>&1 
#送豆得豆 
45 0,8 * * *    node /scripts/jd_sddd.js >> /scripts/logs/jd_sddd.log 2>&1 
  

##############长期活动##############
# 签到
6 1,16,20 * * * node /scripts/jd_bean_sign.js >> /scripts/logs/jd_bean_sign.log 2>&1
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
0 0-16/8 * * * node /scripts/jd_joy_reward.js >> /scripts/logs/jd_joy_reward.log 2>&1
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
# 京东全民开红包
12 0-23/4 * * * node /scripts/jd_redPacket.js >> /scripts/logs/jd_redPacket.log 2>&1
# 进店领豆
6 0 * * * node /scripts/jd_shop.js >> /scripts/logs/jd_shop.log 2>&1
# 东东超市
31 0,1-23/2 * * * node /scripts/jd_superMarket.js >> /scripts/logs/jd_superMarket.log 2>&1
# 取消关注
45 23,6 * * * node /scripts/jd_unsubscribe.js >> /scripts/logs/jd_unsubscribe.log 2>&1
# 京豆变动通知
20 10 * * * node /scripts/jd_bean_change.js >> /scripts/logs/jd_bean_change.log 2>&1
# 京东抽奖机
0 0,12,23 * * * node /scripts/jd_lotteryMachine.js >> /scripts/logs/jd_lotteryMachine.log 2>&1
# 京东排行榜
21 9 * * * node /scripts/jd_rankingList.js >> /scripts/logs/jd_rankingList.log 2>&1
# 天天提鹅
28 * * * * node /scripts/jd_daily_egg.js >> /scripts/logs/jd_daily_egg.log 2>&1
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
12 * * * * node /scripts/jd_syj.js >> /scripts/logs/jd_syj.log 2>&1
# 京东快递签到
47 1 * * * node /scripts/jd_kd.js >> /scripts/logs/jd_kd.log 2>&1
# 京东汽车(签到满500赛点可兑换500京豆)
0 0 * * * node /scripts/jd_car.js >> /scripts/logs/jd_car.log 2>&1
# 领京豆额外奖励(每日可获得3京豆)
23 1,12,22 * * * node /scripts/jd_bean_home.js >> /scripts/logs/jd_bean_home.log 2>&1
# 微信小程序京东赚赚
6 0-5/1,11 * * * node /scripts/jd_jdzz.js >> /scripts/logs/jd_jdzz.log 2>&1
# 导到所有互助码
23 7 * * * node /scripts/jd_get_share_code.js >> /scripts/logs/jd_get_share_code.log 2>&1
# 口袋书店
38 8,12,18 * * * node /scripts/jd_bookshop.js >> /scripts/logs/jd_bookshop.log 2>&1
# 京喜农场
30 9,12,18 * * * node /scripts/jd_jxnc.js >> /scripts/logs/jd_jxnc.log 2>&1
# 签到领现金
10 */4 * * * node /scripts/jd_cash.js >> /scripts/logs/jd_cash.log 2>&1
# 闪购盲盒
47 8,22 * * * node /scripts/jd_sgmh.js >> /scripts/logs/jd_sgmh.log 2>&1
# 京东秒秒币
10 6,21 * * * node /scripts/jd_ms.js >> /scripts/logs/jd_ms.log 2>&1
#美丽研究院
41 7,12,19 * * * node /scripts/jd_beauty.js >> /scripts/logs/jd_beauty.log 2>&1
#京东保价
#41 0,23 * * * node /scripts/jd_price.js >> /scripts/logs/jd_price.log 2>&1
#京东极速版签到+赚现金任务
21 1,6 * * * node /scripts/jd_speed_sign.js >> /scripts/logs/jd_speed_sign.log 2>&1
# 删除优惠券(默认注释，如需要自己开启，如有误删，已删除的券可以在回收站中还原，慎用)
#20 9 * * 6 node /scripts/jd_delCoupon.js >> /scripts/logs/jd_delCoupon.log 2>&1

#京东直播（又回来了）
13-33/5 13 * * * node /scripts/jd_live.js >> /scripts/logs/jd_live.log 2>&1
#京东健康社区
13 1,6,22 * * * node /scripts/jd_health.js >> /scripts/logs/jd_health.log 2>&1
#京东健康社区收集健康能量
5-45/20 * * * * node /scripts/jd_health_collect.js >> /scripts/logs/jd_health_collect.log 2>&1
# 幸运大转盘
10 10,23 * * * node /scripts/jd_market_lottery.js >> /scripts/logs/jd_market_lottery.log 2>&1
# 领金贴
5 0 * * * node /scripts/jd_jin_tie.js >> /scripts/logs/jd_jin_tie.log 2>&1
#京喜牧场
15 0,3,6,12,14,16,18,20,22 * * * node /scripts/jd_jxmc.js >> /scripts/logs/jd_jxmc.log 2>&1
#京东电竞经理
41 10 * * * node /scripts/jd_djjl.js >> /scripts/logs/jd_djjl.log 2>&1
#柠檬全民挖现金
50 0-23/8 * * * node /scripts/jd_wxj.js >> /scripts/logs/jd_wxj.log 2>&1
#东东乐园
18 7 * * * node /scripts/jd_ddly.js >> /scripts/logs/jd_ddly.log 2>&1
#早起福利
30 6 * * *  node /scripts/jd_goodMorning.js >> /scripts/logs/jd_goodMorning.log 2>&1  
#京东签到图形验证
14 2,10 * * * node /scripts/jd_sign_graphics.js >> /scripts/logs/jd_sign_graphics.log 2>&1   
#京东试用
28 10,22 * * * node /scripts/jd_try.js >> /scripts/logs/jd_try.log 2>&1 
#财富大陆
18 0-23/2 * * * node /scripts/gua_wealth_island.js  >> /scripts/logs/gua_wealth_island.log 2>&1 
#财富大陆体现
#59 11,12,23 * * * node /scripts/jd_cfdtx.js  >> /scripts/logs/jd_cfdtx.log 2>&1 
#店铺签到
0 0,12 * * * node /scripts/jd_dpqd.js >> /scripts/logs/jd_dpqd.log 2>&1 
#店铺签到2
0 0,12 * * * node /scripts/jd_dpqd2.js >> /scripts/logs/jd_dpqd2.log 2>&1 
#清理购物车
0 0 */5 * * node /scripts/jd_cleancart.js >> /scripts/logs/jd_cleancart.log 2>&1 
#汪汪乐园每日任务
20 7,9,17,20 * * * node /scripts/jd_joy_park_task.js >> /scripts/logs/jd_joy_park_task.log 2>&1 
#汪汪乐园
20 0-23/3 * * * node /scripts/jd_joy_park.js >> /scripts/logs/jd_joy_park.log 2>&1 
