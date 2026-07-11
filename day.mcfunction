# 日期与天气系统。
# daytime day 保存当天时间进度，day day 保存世界总天数，rand day 保存当天随机天气。
# xh.mcfunction 在 tick=1 时调用本文件，所以这里每次增加 20 游戏刻，等价于维持原版一天 24000 刻节奏。
# 注意：doweathercycle 已在 qz 中关闭，天气完全由本文件控制。
scoreboard players add daytime day 20
time add 20
############################################################执行
# 每天中段刷新矿场资源。
execute if entity @p[x=1,y=51,z=246,r=50] if score daytime day matches 6000 run function kw/fr 
execute if entity @p[x=1,y=51,z=246,r=50] if score daytime day matches 6000 run tellraw @a[x=1,y=51,z=246,r=50] {"rawtext":[{"text":"§l[§6矿场§r§l]: §r矿场已更新"}]}















############################################################
# 每日结束前统计炼丹奇遇权重，并预加载对应区域。
# cyy day 会根据在线修士数量和随机值累计，之后 xh 检测 cyy>0 时调用 ld/cyy 生成采药点。
execute if score daytime day matches 23980  run scoreboard players set cyy day 0
execute if score daytime day matches 23980 if entity @a[scores={dj=1..}] as @a run scoreboard players random @s[scores={dj=1..}] tempa 10 60
execute if score daytime day matches 23980 if entity @a[scores={dj=1..}] as @a run scoreboard players operation cyy day += @s tempa
execute if score daytime day matches 23960 if entity @a[scores={dj=1..}]  run tickingarea add 863 151 -1189 870 150 -1180 cyy 

execute if score daytime day matches 24000.. run scoreboard players set @a[scores={rw2=-1}] rw2 0
execute if score daytime day matches 24000.. run scoreboard players add @a[scores={rw=..10,rwa=11}] day 1
execute if score daytime day matches 24000.. run scoreboard players add @a[scores={rw=..13,rwa=14}] day 1 
execute if score daytime day matches 24000.. run scoreboard players add @a[scores={rw=..20,rwa=21}] day 1 
execute if score daytime day matches 24000.. run scoreboard players add @a[scores={rw=..29,rwa=30}] day 1 
# 新的一天推进任务等待天数，并逐日削减处于修行清修状态玩家的瘴气。
# 只有正在对应任务阶段的玩家会增加 day 任务等待计数。
execute if score daytime day matches 24000.. run scoreboard players add @a[tag=xhqxz] zq 0
execute if score daytime day matches 24000.. run scoreboard players add @a[tag=xhqxz,scores={zq=0..19}] zq 10
execute if score daytime day matches 24000.. run titleraw @a[tag=xhqxz,scores={zq=0..20}] title {"rawtext":[{"text":"\n\n\n\n                §e§l瘴气-10"}]}
execute if score daytime day matches 24000.. run scoreboard players add @a[tag=xhqxz,scores={zq=20..29}] zq 5
execute if score daytime day matches 24000.. run titleraw @a[tag=xhqxz,scores={zq=0..20}] title {"rawtext":[{"text":"\n\n\n\n                §e§l瘴气-5"}]}
execute if score daytime day matches 24000.. run scoreboard players add @a[tag=xhqxz,scores={zq=30..40}] zq 3
execute if score daytime day matches 24000.. run titleraw @a[tag=xhqxz,scores={zq=0..20}] title {"rawtext":[{"text":"\n\n\n\n                §e§l瘴气-3"}]}
execute if score daytime day matches 24000.. run scoreboard players add @a[tag=xhqxz,scores={zq=41..50}] zq 2
execute if score daytime day matches 24000.. run titleraw @a[tag=xhqxz,scores={zq=0..20}] title {"rawtext":[{"text":"\n\n\n\n                §e§l瘴气-2"}]}
execute if score daytime day matches 24000.. run scoreboard players add day day 1
execute if score daytime day matches 24000.. run weather clear 24000
execute if score daytime day matches 24000.. run fog @a remove day
execute if score daytime day matches 24000.. run scoreboard players random rand day 1 1000

# 天气分布：
# 1-300/751-1000 晴或多云，301-550 雾/雨/雷，551-600 血月，601-750 特殊灵气天气。
# rand day 不只影响播报，也会被 xh 的回血回蓝节奏读取。
execute if score daytime day matches 24000.. if score rand day matches 1..100 run tellraw @a {"rawtext":[{"text":"§l[§6玄黄日报§r§l]§r 新的一天开始了，今天是§a§l"},{"score":{"name":"day","objective":"day"}},{"text":"§r天--§a§l晴天"}]}
execute if score daytime day matches 24000.. if score rand day matches 101..200 run tellraw @a {"rawtext":[{"text":"§l[§6玄黄日报§r§l]§r 新的一天开始了，今天是§a§l"},{"score":{"name":"day","objective":"day"}},{"text":"§r天--§7§l阴天"}]}
execute if score daytime day matches 24000.. if score rand day matches 201..300 run tellraw @a {"rawtext":[{"text":"§l[§6玄黄日报§r§l]§r 新的一天开始了，今天是§a§l"},{"score":{"name":"day","objective":"day"}},{"text":"§r天--§7§l多云"}]}
execute if score daytime day matches 24000.. if score rand day matches 301..400 run tellraw @a {"rawtext":[{"text":"§l[§6玄黄日报§r§l]§r 新的一天开始了，今天是§a§l"},{"score":{"name":"day","objective":"day"}},{"text":"§r天--§8§l迷雾§r,视野受阻，移速下降"}]}
execute if score daytime day matches 24000.. if score rand day matches 401..500 run tellraw @a {"rawtext":[{"text":"§l[§6玄黄日报§r§l]§r 新的一天开始了，今天是§a§l"},{"score":{"name":"day","objective":"day"}},{"text":"§r天--§9§l雨天§r,视野受阻，移速下降"}]}
execute if score daytime day matches 24000.. if score rand day matches 501..550 run tellraw @a {"rawtext":[{"text":"§l[§6玄黄日报§r§l]§r 新的一天开始了，今天是§a§l"},{"score":{"name":"day","objective":"day"}},{"text":"§r天--§1§l雷阵雨§r,视野受阻，移速下降，并有雷电袭击"}]}
execute if score daytime day matches 24000.. if score rand day matches 551..600 run tellraw @a {"rawtext":[{"text":"§l[§6玄黄日报§r§l]§r 新的一天开始了，今天是§a§l"},{"score":{"name":"day","objective":"day"}},{"text":"§r天--§c§l血月§r,晚上怪物属性x1.5，掉宝率x1.5，怪物获得速度加成"}]}
execute if score daytime day matches 24000.. if score rand day matches 601..700 run tellraw @a {"rawtext":[{"text":"§l[§6玄黄日报§r§l]§r 新的一天开始了，今天是§a§l"},{"score":{"name":"day","objective":"day"}},{"text":"§r天--§0§l轻度仙凡瘴§r,回复减慢"}]}
execute if score daytime day matches 24000.. if score rand day matches 701..750 run tellraw @a {"rawtext":[{"text":"§l[§6玄黄日报§r§l]§r 新的一天开始了，今天是§a§l"},{"score":{"name":"day","objective":"day"}},{"text":"§r天--§3§l灵力雨，回复加快，移速加快"}]}
execute if score daytime day matches 24000.. if score rand day matches 751..1000 run tellraw @a {"rawtext":[{"text":"§l[§6玄黄日报§r§l]§r 新的一天开始了，今天是§a§l"},{"score":{"name":"day","objective":"day"}},{"text":"§r天--§a§l晴天"}]}

execute if score rand day matches 301..550 run fog @a push minecraft:fog_basalt_deltas day
execute if score rand day matches 551..600 run fog @a push minecraft:fog_crimson_forest day
# 特殊天气持续效果：雾雨减速，灵力雨加速，雷阵雨周期性召雷。
# 雷击伤害通过生成 lightning_bolt 并写入其 atk，由自定义战斗系统继续处理。
execute if score rand day matches 301..550 run effect @a[m=a] slowness 3 0 true
execute if score rand day matches 701..750 run effect @a[m=a] speed 3 0 true
execute if score daytime day matches 24000.. if score rand day matches 401..500 run weather rain 24000
execute if score daytime day matches 24000.. if score rand day matches 501..550 run weather thunder 24000
execute if score rand day matches 501..550 run scoreboard players add linght day 1
execute if score rand day matches 501..550 if score linght day matches 120.. at @r[m=a] run summon lightning_bolt ~ ~ ~
execute if score rand day matches 501..550 if score linght day matches 120.. as @e[type=lightning_bolt] run scoreboard players operation @s temp = @p hp2hp2
execute if score rand day matches 501..550 if score linght day matches 120.. as @e[type=lightning_bolt] if score @s temp matches 100..1000 run scoreboard players random @s atk 50 1000
execute if score rand day matches 501..550 if score linght day matches 120.. as @e[type=lightning_bolt] if score @s atk matches 1000..10000 run scoreboard players random @s atk 500 10000
execute if score rand day matches 501..550 if score linght day matches 120.. as @e[type=lightning_bolt] if score @s atk matches 10000..100000 run scoreboard players random @s atk 5000 100000
execute if score daytime day matches 13000 run tellraw @a {"rawtext":[{"text":"§l[§6玄黄晚报§r§l]§r 夜晚开始了"}]}
execute if score daytime day matches 24000.. run scoreboard players set daytime day 0
execute if score linght day matches 120.. run scoreboard players set linght day 0

