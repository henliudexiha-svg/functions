# 全局初始化函数。
# 建议在世界/行为包首次加载或重置数据时执行一次。
# 本文件只声明规则、计分板和常量，不负责开局剧情；玩家初始化见 xwj.mcfunction 和 jq/ks.mcfunction。

# 游戏规则相关
# 关闭原版破坏性或噪音行为，保证自定义 RPG 系统可控。
gamerule commandblockoutput false
gamerule mobgriefing false
gamerule keepinventory true
gamerule doweathercycle false
gamerule tntexplodes false
gamerule showbordereffect false
gamerule showcoordinates true
gamerule respawnblocksexplode false
gamerule randomtickspeed 0

# 积分声明（玩家属性相关）
# 命名习惯：
# 基础值：atk/fy/hp2/ll2 等。
# 装备或附加值：atka/fya/hp2a/ll2a 等带 a 后缀。
# 最终结算值：atkatk/fyfy/hp2hp2/ll2ll2 等双写字段，由 sxjs.mcfunction 每秒刷新。
# ls   灵石           | hp   当前血量      | hp2  血上限
# atk  攻击           | fy   防御         | atkjc   攻击加成
# atkjm 攻击减免      | sb   闪避率       | mz      命中
# bj   暴击率         | bs   暴击伤害加成 | ll      当前蓝量
# ll2  蓝量上限       | zs   真伤         | xy      幸运
# day  天数           | hx   回血         | hl      回蓝
# xx   吸血           | shxs 伤害吸收     | jy      经验
# jy2  dj等级         | xw   修为         | tdqw    筑基奇物
# tdqw1 金丹功法      | tdqw2 元婴洞天    | tdqw3   化神天之髓
# tdqw4 合道天地之魄  | uuid 玩家id       | yj      耀金
# gf     
scoreboard objectives add uuid dummy
scoreboard objectives add day dummy
scoreboard objectives add sw dummy
scoreboard objectives add shxs dummy 
scoreboard objectives add ls dummy 
scoreboard objectives add hp dummy 
scoreboard objectives add hp2 dummy 
scoreboard objectives add hl dummy 
scoreboard objectives add hx dummy 
scoreboard objectives add atk dummy
scoreboard objectives add fy dummy
scoreboard objectives add atkjc dummy 
scoreboard objectives add atkjm dummy
scoreboard objectives add sb dummy
scoreboard objectives add mz dummy
scoreboard objectives add bj dummy
scoreboard objectives add bs dummy
scoreboard objectives add ll dummy
scoreboard objectives add ll2 dummy
scoreboard objectives add xx dummy
scoreboard objectives add zs dummy
scoreboard objectives add xy dummy
scoreboard objectives add dj dummy
scoreboard objectives add jy dummy
scoreboard objectives add jy2 dummy
scoreboard objectives add tdqw dummy
scoreboard objectives add tdqw1 dummy
scoreboard objectives add tdqw2 dummy
scoreboard objectives add tdqw3 dummy
scoreboard objectives add tdqw4 dummy
scoreboard objectives add zq dummy
scoreboard objectives add yj dummy
scoreboard objectives add yja dummy
scoreboard objectives add ld dummy
scoreboard objectives add ldll dummy
scoreboard objectives add ldjy dummy
scoreboard objectives add ldjy2 dummy
scoreboard objectives add gf dummy
scoreboard objectives add gftime dummy
# 最终属性缓存：战斗、面板和回复都读取这些值，避免每条命令重复叠加装备和 buff。
# 玩家最终防御 # 玩家最终伤害
scoreboard objectives add atkatk dummy     
scoreboard objectives add fyfy dummy        
scoreboard objectives add hlhl dummy
scoreboard objectives add hxhx dummy
scoreboard objectives add bjbj dummy
scoreboard objectives add bsbs dummy
scoreboard objectives add mzmz dummy
scoreboard objectives add sbsb dummy
scoreboard objectives add hp2hp2 dummy
scoreboard objectives add ll2ll2 dummy
scoreboard objectives add zszs dummy

scoreboard objectives add kshx dummy
scoreboard objectives add kshxt dummy
scoreboard objectives add kshl dummy
scoreboard objectives add kshlt dummy
scoreboard objectives add ksfy dummy
scoreboard objectives add ksfyt dummy
scoreboard objectives add ksatk dummy
scoreboard objectives add ksatkt dummy
# 丹药/临时 buff：
# kshx/kshxt 代表临时回血量和剩余时间，kshl/kshlt 代表临时回蓝，ksfy/ksfyt 代表防御，ksatk/ksatkt 代表攻击。
# 装备属性相关
# 武器
scoreboard objectives add atka dummy
scoreboard objectives add bja dummy
scoreboard objectives add bsa dummy
scoreboard objectives add mza dummy
scoreboard objectives add zsa dummy
# 装备
scoreboard objectives add fya dummy
scoreboard objectives add sba dummy
scoreboard objectives add ll2a dummy
scoreboard objectives add hp2a dummy
scoreboard objectives add hla dummy
scoreboard objectives add hxa dummy

# 战斗相关
# sskx 是“本次应受伤害”，由 hxxt/tpsj 写入，扣血后会被重置。
# 受伤扣血
scoreboard objectives add sskx dummy  

# Tick/计时相关
# tick 和 "10" tick 两套虚拟计时器由 xh.mcfunction 推进，用来分摊每 tick 的系统负载。
scoreboard objectives add ftime dummy
scoreboard objectives add tick dummy
scoreboard objectives add ticka dummy

# 武器类型相关
scoreboard objectives add wqlx dummy

# 常用数值
# scoreboard operation 不能直接写字面量乘除，所以用虚拟玩家保存常量。
scoreboard objectives add sum dummy
scoreboard players set "-1" sum -1
scoreboard players set "1" sum 1
scoreboard players set "2" sum 2
scoreboard players set "3" sum 3
scoreboard players set "4" sum 4
scoreboard players set "5" sum 5
scoreboard players set "6" sum 6
scoreboard players set "7" sum 7
scoreboard players set "8" sum 8
scoreboard players set "9" sum 9
scoreboard players set "10" sum 10
scoreboard players set "50" sum 50
scoreboard players set "100" sum 100
scoreboard players set "200" sum 200

# 临时变量
# temp/tempa/tempb/... 在多个系统中复用；每个系统用完后应自行 reset 或覆盖。
scoreboard objectives add temp dummy
scoreboard objectives add tempa dummy
scoreboard objectives add tempb dummy
scoreboard objectives add tempc dummy
scoreboard objectives add tempd dummy
scoreboard objectives add x dummy
scoreboard objectives add z dummy
# 随机相关
scoreboard objectives add rand dummy
scoreboard objectives add gwrand dummy

# 菜单相关
# xqcd 控制 actionbar 面板：1 属性，2 战斗，3 突破，4 自身状态。
scoreboard objectives add xqcd dummy 

# 显示相关
# sjshxs/xxxs 保存最近一次攻击和吸血显示；xwa/lsa/yja 是待结算的修为、灵石、耀金增量。
scoreboard objectives add sjshxs dummy     
scoreboard objectives add xxxs dummy
scoreboard objectives add xwa dummy
scoreboard objectives add lsa dummy
# 战斗统计
scoreboard objectives add jzrs dummy    

# 突破/传送相关
# tp 系列主要由 tpsj.mcfunction 使用：tp=剩余雷劫次数，tptime=倒计时，tprand/tptick=判定条。
scoreboard objectives add tptime dummy
scoreboard objectives add tp dummy
scoreboard objectives add tpsh dummy
scoreboard objectives add tpqd dummy 
scoreboard objectives add tpph dummy
scoreboard objectives add tprand dummy
scoreboard objectives add tptick dummy
scoreboard objectives add tpzt dummy

# 特殊武器
# tygcd 是灵力枪弹体寿命，tyglx 区分弹体类型；弹体本体通常是带“标记”的 boat。
scoreboard objectives add tygcd dummy
scoreboard objectives add tyglx dummy 

# 剧情相关
# jq 是已完成剧情节点，jqa 是目标剧情节点；rw/rwa 是主线任务已完成/当前目标；rw2 是日常委托。
scoreboard objectives add jqtime dummy
scoreboard objectives add jq dummy
scoreboard objectives add jqa dummy
scoreboard objectives add rw dummy
scoreboard objectives add rwa dummy

scoreboard objectives add rw2 dummy

scoreboard objectives add wy dummy

# 特殊状态
# wqjx 表示缴械剩余时间，会让武器显示回到屏障并阻止正常攻击。
scoreboard objectives add wqjx dummy  

#雪球菜单
scoreboard objectives add cd dummy