# 每3天的23:50分清理一次日志(互助码不清理，proc_file.sh对该文件进行了去重)
50 23 */3 * * find /scripts/logs -name '*.log' | grep -v 'sharecodeCollection' | xargs rm -rf
#收集助力码
30 * * * * sh +x /scripts/docker/auto_help.sh collect >> /scripts/logs/auto_help_collect.log 2>&1


##############短期活动##############
#京东极速版红包(活动时间：2021-5-5至？)
44 0 * * * node /scripts/jd_speed_redpocke.js >> /scripts/logs/jd_speed_redpocke.log 2>&1
#女装盲盒（活动时间：2021-8-5至2021-8-31）
35 1,23 * * *  node /scripts/jd_nzmh.js >> /scripts/logs/jd_nzmh.log 2>&1
#金榜创造营 活动时间：2021-05-21至2021-12-31
0 1,22 * * * node /scripts/jd_gold_creator.js >> /scripts/logs/jd_gold_creator.log 2>&1
#半点京豆雨
#30 16-23/1 * * *  node /scripts/jd_half_redrain.js >> /scripts/logs/jd_half_redrain.log 2>&1
#柠檬推一推
0 0 * * * node /scripts/jd_tyt.js  >> /scripts/logs/jd_tyt.log 2>&1
#柠檬众筹许愿池
0 6 * * * node /scripts/jd_wish.js  >> /scripts/logs/jd_wish.log 2>&1
#天天优惠大乐透
15 6 * * *  node /scripts/jd_DrawEntrance.js   >> /scripts/logs/jd_DrawEntrance.log 2>&1  
#省钱大赢家之翻翻乐
1 0-12/1 * * *  node /scripts/jd_big_winner.js   >> /scripts/logs/jd_big_winner.log 2>&1  
#小鸽有礼
13 1,22,23 * * *  node /scripts/jd_daily_lottery.js   >> /scripts/logs/jd_daily_lottery.log 2>&1
#添加MM领京豆
15 1,9 * * * node /scripts/gua_MMdou.js   >> /scripts/logs/gua_MMdou.log 2>&1
#财富大陆互助
18 0,1,9,14,18 * * *   node /scripts/gua_wealth_island_help.js    >> /scripts/logs/gua_wealth_island_help.log 2>&1 
#真·抢京豆
0 0 * * *  node /scripts/jd_angryBean.js   >> /scripts/logs/jd_angryBean.log 2>&1
#京喜领88元红包
4 10,16,21,16,21 * * *  node /scripts/jd_jxlhb.js  >> /scripts/logs/jd_jxlhb.log 2>&1
#京喜签到
30 0,22 * * * node /scripts/jx_sign.js  >> /scripts/logs/jx_sign.log 2>&1  
#积分换话费
33 7,19 * * *  node /scripts/jd_dwapp.js >> /scripts/logs/jd_dwapp.log 2>&1  
#特物Z|万物皆可国创
30 16,2 * * * node /scripts/jd_superBrand.js >> /scripts/logs/jd_superBrand.log 2>&1    
#粉丝签到
34 5,18 * * *  node /scripts/jd_fan.js >> /scripts/logs/jd_fan.log 2>&1  
#内容鉴赏官
15 3,6 * * *  node /scripts/jd_connoisseur.js >> /scripts/logs/jd_connoisseur.log 2>&1
#京喜财富岛合成月饼
13 6,13,23 * * * node /scripts/jd_cfd_mooncake.js >> /scripts/logs/jd_cfd_mooncake.log 2>&1 
# 母婴-跳跳乐
1 0,11,21 * * * node /scripts/jd_jump.js >> /scripts/logs/jd_jump.log 2>&1 
# 东东世界
25 2,10 * * * node /scripts/jd_ddworld.js >> /scripts/logs/jd_ddworld.log 2>&1
# 东东世界兑换
0 0 * * * node /scripts/jd_ddworld_exchange.js >> /scripts/logs/jd_ddworld_exchange.log 2>&1
#集魔方
6 8,20 * * * node /scripts/jd_mofang.js >> /scripts/logs/jd_mofang.log 2>&1 
#京东金融天天拼图
20 0,16 * * * node /scripts/jd_ttpt.js  >> /scripts/logs/jd_ttpt.log 2>&1 
# 京喜财富岛热气球
30 * * * * node /scripts/jd_cfd_loop.js >> /scripts/logs/jd_cfd_loop.log 2>&1
#柠檬赚金币
0 7 * * * node /scripts/jd_zjb.js >> /scripts/logs/jd_zjb.log 2>&1 
#攒金币 赢大礼
22 0,8 * * * node /scripts/jd_GoldcoinToGift.js >> /scripts/logs/jd_GoldcoinToGift.log 2>&1
#城城领现金
0 0-23/5,22 10 * * node /scripts/gua_city.js >> /scripts/logs/gua_city.log 2>&1
#京东超市 限时抢京豆
23 7,9 * * *  node /scripts/jd_xsljd.js >> /scripts/logs/jd_xsljd.log 2>&1 
#预售福利机
5 0,2 * * * node /scripts/jd_ys.js >> /scripts/logs/jd_ys.log 2>&1  
#电竞预言家瓜分京豆
23 10,11 * * * node /scripts/jd_lol.js >> /scripts/logs/jd_lol.log 2>&1  
#发财大赢家
#1 6-22/3 * * * node /scripts/jd_fcdyj.js >> /scripts/logs/jd_fcdyj.log 2>&1 
#柠檬是兄弟就砍我2
0 5,17 * * * node /scripts/jd_kanjia2.js >> /scripts/logs/jd_kanjia2.log 2>&1
#7天店铺签到
1 0 * * *  node /scripts/jd_sevenDay.js >> /scripts/logs/jd_sevenDay.log 2>&1
#京东超级盒子
40 12,16 * * * node /scripts/jd_fcwb.js >> /scripts/logs/jd_fcwb.log 2>&1 
#京喜-首页-牛牛福利
1 0,9,19,23 * * * node /scripts/zx_nnfls.js >> /scripts/logs/zx_nnfls.log 2>&1  
#手机竞猜
0 0 * * * 1 0,9,19,23 * * * node /scripts/zy_sjjc.js >> /scripts/logs/zy_sjjc.log 2>&1  
#双十一无门槛红包
0 10,12,20 * * *  node /scripts/jd_jxred.js >> /scripts/logs/jd_jxred.log 2>&1   
#京东电器盲盒
0 0 8 1-20 * * node /scripts/jd_dqmh.js >> /scripts/logs/jd_dqmh.log 2>&1   
#整点红包雨
0 9-22/1 9-20 11 * node /scripts/jd_super_redrain.js >> /scripts/logs/jd_super_redrain.log 2>&1 
#发财挖宝
#40 12,16 * * * node /scripts/jd_fcwb.js >> /scripts/logs/jd_fcwb.log 2>&1 
#饭粒
0 9-22/1 9-20 11 * node /scripts/jd_fanli.js >> /scripts/logs/jd_fanli.log 2>&1 
#京东零食街2
0 0,6-22/2 * * *  node /scripts/jd_foodRunning.js >> /scripts/logs/jd_foodRunning.log 2>&1  
#京东金融-每日签到
49 8 * * * node /scripts/jd_jdjrjf.js >> /scripts/logs/jd_jdjrjf.log 2>&1 
#5G盲盒2021年11月1日到2022年1月28日
5 0,1-23/3 * * *  node /scripts/jd_mohe.js >> /scripts/logs/jd_mohe.log 2>&1 
#美丽研究院--兑换
5 0,1-23/3 * * *  node /scripts/jd_beauty_ex.js  >> /scripts/logs/jd_beauty_ex.log 2>&1 
#京喜财富岛合成生鲜
45 7-23/1 * * *  node /scripts/jd_cfd_fresh.js >> /scripts/logs/jd_cfd_fresh.log 2>&1 
#京喜财富岛合成生鲜兑换
0 0,12 * * * node /scripts/jd_cfd_fresh_exchange.js >> /scripts/logs/jd_cfd_fresh_exchange.log 2>&1 
#京东到家果园任务脚本
10 0,3,8,11,17 * * * node /scripts/jd_jddj_fruit.js >> /scripts/logs/jd_jddj_fruit.log 2>&1 
#财富岛珍珠合成红包兑换
59 0-23/1 * * * node /scripts/jd_cfd_pearl_ex.js >> /scripts/logs/jd_cfd_pearl_ex.log 2>&1 
#京东赚赚
10 3 * * *  node /scripts/jd_jdzz.js >> /scripts/logs/jd_jdzz.log 2>&1 
#星系牧场
1 0-23/4 * * *  node /scripts/jd_qqxing.js >> /scripts/logs/jd_qqxing.log 2>&1 
#晓龙
18 0,21 * * *  node /scripts/jd_xiaolong.js >> /scripts/logs/jd_xiaolong.log 2>&1 
#京东我的理想家，可抽奖获得京豆
18 0,21 * * *  node /scripts/jd_lxLottery.js >> /scripts/logs/jd_lxLottery.log 2>&1 
#京东答题领金豆
9 10 * * * node /scripts/jd_answer.js >> /scripts/logs/jd_answer.log 2>&1 
#生活特权
26 22 * *  node /scripts/jd_week.js >> /scripts/logs/jd_week.log 2>&1 
#京东小魔方
1 2,8 * * * node /scripts/jd_mf.js >> /scripts/logs/jd_mf.log 2>&1  
#暖暖红包
0 0,12,20 * * * node /scripts/jd_redEnvelope.js >> /scripts/logs/jd_redEnvelope.log 2>&1
#京东生鲜每日抽奖
42 7 * * * node /scripts/jd_sxLottery.js >> /scripts/logs/jd_sxLottery.log 2>&1
#京东特价翻翻乐
15 0,8 * * * node /scripts/jd_jdtj_winner.js  >> /scripts/logs/jd_jdtj_winner.log 2>&1 

##############长期活动##############
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
# 京东全民开红包
12 0-23/4 * * * node /scripts/jd_redPacket.js >> /scripts/logs/jd_redPacket.log 2>&1
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
#京东电竞经理
41 10 * * * node /scripts/jd_djjl.js >> /scripts/logs/jd_djjl.log 2>&1
#东东乐园
18 7 * * * node /scripts/jd_ddly.js >> /scripts/logs/jd_ddly.log 2>&1
#早起福利
30 6 * * *  node /scripts/jd_goodMorning.js >> /scripts/logs/jd_goodMorning.log 2>&1  
#京东签到图形验证
14 2,10 * * * node /scripts/jd_sign_graphics.js >> /scripts/logs/jd_sign_graphics.log 2>&1   
#京东试用
14 10-20/2 * * * node /scripts/jd_try.js >> /scripts/logs/jd_try.log 2>&1 
#财富大陆
18 0,6-23/2 * * * node /scripts/gua_wealth_island.js  >> /scripts/logs/gua_wealth_island.log 2>&1 
#财富大陆(京喜财富岛)
18 0-23/2 * * * node /scripts/jd_cfd.js  >> /scripts/logs/jd_cfd.log 2>&1 
#店铺签到
0 0 * * *  node /scripts/jd_shop_sign.js >> /scripts/logs/jd_shop_sign.log 2>&1 
#汪汪乐园每日任务
20 7,9,17,20 * * * node /scripts/jd_joy_park_task.js >> /scripts/logs/jd_joy_park_task.log 2>&1 
#汪汪乐园
20 0-23/3 * * * node /scripts/jd_joy_park.js >> /scripts/logs/jd_joy_park.log 2>&1 
#取关主播
55 6 * * *  node /scripts/jd_unsubscriLive.js >> /scripts/logs/jd_unsubscriLive.log 2>&1
#京东汽车兑换
0 0 * * * node /scripts/jd_car_exchange.js >> /scripts/logs/jd_car_exchange.log 2>&1  
#（快过期）京豆兑换为喜豆
33 0 * * *  node /scripts/jd_exchangejxbeans.js >> /scripts/logs/jd_exchangejxbeans.log 2>&1  

