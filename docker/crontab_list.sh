# 每3天的23:50分清理一次日志(互助码不清理，proc_file.sh对该文件进行了去重)
50 23 */3 * * find /scripts/logs -name '*.log' | grep -v 'sharecodeCollection' | xargs rm -rf
#收集助力码
30 * * * * sh +x /scripts/docker/auto_help.sh collect >> /scripts/logs/auto_help_collect.log 2>&1


##############短期活动##############
#入口 极速版 赚金币 种水果
5 0-23/6 * * * node /scripts/jd_wsdlb.js >> /scripts/logs/jd_wsdlb.log 2>&1
#京东极速版红包(活动时间：2021-5-5至？)
#44 8,11 * * * node /scripts/jd_speed_redpocke.js >> /scripts/logs/jd_speed_redpocke.log 2>&1
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
#整点红包雨
#0 9-22/1 9-20 11 * node /scripts/jd_super_redrain.js >> /scripts/logs/jd_super_redrain.log 2>&1 
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
#京东超级盲盒
0 20 3,17 6 *  node /scripts/jd_supermh.js  >> /scripts/logs/jd_supermh.log 2>&1
#京洞察问卷通知
0 9 * * *  node /scripts/jd_insight.js  >> /scripts/logs/jd_insight.log 2>&1
#京东到家鲜豆任务
5 0 * * *  node /scripts/jd_jddj_bean.js  >> /scripts/logs/jd_jddj_bean.log 2>&1
#京东到家鲜豆任务
1 10 * * *  node /scripts/jd_mfredrain.js  >> /scripts/logs/jd_mfredrain.log 2>&1
#7.1-7.31 安佳 邀新有礼
11 6 1-3,4-31/5 7 *  node /scripts/jd_AJYX.js  >> /scripts/logs/jd_AJYX.log 2>&1
#闪购签到有礼
11 6 * * *  node /scripts/jd_shangou.js  >> /scripts/logs/jd_shangou.log 2>&1
#7.4-9.30 集碳豆赢大奖
30 10 * * * node /scripts/jd_yiliBaby.js  >> /scripts/logs/jd_yiliBaby.log 2>&1
#特务之明星送好礼
36 2,19 * * * node /scripts/jd_superBrandStar.js >> /scripts/logs/jd_superBrandStar.log 2>&1
#特务集卡
2 10,18,20 * * * node /scripts/jd_superBrandJK.js >> /scripts/logs/jd_superBrandJK.log 2>&1
特务集勋章
3 10,18,20 * * * node /scripts/jd_SuperBrandJXZ.js >> /scripts/logs/jd_SuperBrandJXZ.log 2>&1
##############开卡活动##############
#5.1-9.30 泉粉邀请卡
30 5 7-31 5 * node /scripts/jd_opencardL133.js >> /scripts/logs/jd_opencardL133.log 2>&1
#7.21-7.24 品类联合 
10 11 1 1 *   node /scripts/jd_opencardL198.js >> /scripts/logs/jd_opencardL198.log 2>&1
#7.22-8.6 超燃好物 七夕献礼
25 1,13 23-31,1-6 7,8 *  node /scripts/jd_opencardL199.js >> /scripts/logs/jd_opencardL199.log 2>&1
#7.20-8.4 七夕喜鹊叫，好运身边绕
31 4,15 20-31,1-4 7,8 *  node /scripts/jd_opencardL200.js >> /scripts/logs/jd_opencardL200.log 2>&1
#7.24-8.4 甜蜜七夕 跨越时空中意你
50 1,12 25-31,1-4 7,8 *   node /scripts/jd_opencardL203.js >> /scripts/logs/jd_opencardL203.log 2>&1
#7.28-8.4 “七”待已久，“夕”望你来
29 11,14 28-31,1-4 7,8 * node /scripts/jd_opencardL207.js >> /scripts/logs/jd_opencardL207.log 2>&1
#7.30-8.4 惊喜派送 纵享甜蜜
21 1 30-31,1-4 7,8 * node /scripts/jd_opencardL209.js >> /scripts/logs/jd_opencardL209.log 2>&1

#8.15-8.22 玩转818 超值购物攻略
29 0,18 16-22 8 * node /scripts/jd_opencardL216.js >> /scripts/logs/jd_opencardL216.log 2>&1
#8.15-8.25 畅享一夏，消费赢壕礼
29 19 15-25 8 *  node /scripts/jd_opencardL217.js >> /scripts/logs/jd_opencardL217.log 2>&1
#8.1-8.31 全民酿造 岁月酱香
29 8,17 3-10 8 * node /scripts/jd_opencardL218.js >> /scripts/logs/jd_opencardL218.log 2>&1
#8.18~8.26 解锁好物 宠粉时刻
53 0,17 19-26 8 * node /scripts/jd_opencardL219.js >> /scripts/logs/jd_opencardL219.log 2>&1
#8.18~9.2 能量派送 幻新出发
45 1,17 18-26 8 * node /scripts/jd_opencardL220.js >> /scripts/logs/jd_opencardL220.log 2>&1
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
10 */4 * * * node /scripts/jd_cash_nolan.js >> /scripts/logs/jd_cash_nolan.log 2>&1
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
