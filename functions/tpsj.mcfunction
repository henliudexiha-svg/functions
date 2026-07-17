# 突破试炼系统。
# tpzt：状态机，1 初始化，2/3 光标往返；tp 是剩余雷劫次数。
# tprand 是判定点，tptick 是玩家通过末影珍珠命中的当前位置，tpsh 是本轮雷劫伤害。
# 进入条件：dy/awa/任务等给玩家 tag=tpsj，xh.mcfunction 每 tick 检测后调用本文件。
# 退出条件：低境界直接给 tp；高境界雷劫次数 tp 归零后给 tp，再由 djsx.mcfunction 真正升境界。
execute as @a[tag=tpsj] run scoreboard players add @s tpzt 0
execute if entity @a[tag=tpsj] as @a[scores={tpzt=0},tag=tpsj] run scoreboard players add @s tpzt 1
#突破次数-dj前3直接突破
# dj=0..3 不走判定条，直接添加 tp 标签完成突破。
execute if entity @a[tag=tpsj] as @a[scores={tpzt=1,dj=0..3},tag=tpsj] run tag @s add tp
execute if entity @a[tag=tpsj] as @a[scores={tpzt=1,dj=0..3},tag=tpsj] run tag @s remove tpsj

execute if entity @a[tag=tpsj] as @a[scores={tpzt=1,dj=4},tag=tpsj] run scoreboard players set @s tp 5
execute if entity @a[tag=tpsj] as @a[scores={tpzt=1,dj=4},tag=tpsj] run scoreboard players random @s tpqd 3 5
#tpph-突破平衡
# dj=4 突破筑基时初始化 5 次雷劫；tpqd 是随机强度，tpph 用于平衡伤害分母。
execute if entity @a[tag=tpsj] as @a[scores={tpzt=1,dj=4},tag=tpsj] run scoreboard players set @s tpph 2
execute if entity @a[tag=tpsj] as @a[scores={tpzt=1},tag=tpsj] run scoreboard players set @s tptime 20
execute if entity @a[tag=tpsj] as @a[scores={tpzt=1},tag=tpsj] run scoreboard players random @s tprand 0 50
execute if entity @a[tag=tpsj] as @a[scores={tpzt=1},tag=tpsj] run scoreboard players set @s tptick 0
execute if entity @a[tag=tpsj] as @a[scores={tpzt=2},tag=tpsj] run scoreboard players add @s tptick 2
execute if entity @a[tag=tpsj] as @a[scores={tpzt=2,tptick=50..},tag=tpsj] run scoreboard players set @s tpzt 3
execute if entity @a[tag=tpsj] as @a[scores={tpzt=3},tag=tpsj] run scoreboard players add @s tptick -1
execute if entity @a[tag=tpsj] as @a[scores={tpzt=3,tptick=..0},tag=tpsj] run scoreboard players set @s tpzt 2
# tpzt=2 时判定光标正向移动，tpzt=3 时反向移动，xqcd=3 会把它显示成判定条。
#初始伤害为10
# 基础雷劫伤害按境界平方、雷劫强度和剩余次数缩放。
execute if entity @a[tag=tpsj] as @a[scores={tpzt=1},tag=tpsj] run scoreboard players add @s tpzt 1
execute if entity @a[tag=tpsj] as @a[tag=tp,tag=tpsj] run tag @s remove tpsj
execute if entity @a[tag=tpsj,tag=!tpsja] as @a[tag=tpsj] run scoreboard players operation @s tpsh = "10" sum
execute if entity @a[tag=tpsj,tag=!tpsja] as @a[tag=tpsj] run scoreboard players operation @s tpsh *= @s dj  
execute if entity @a[tag=tpsj,tag=!tpsja] as @a[tag=tpsj] run scoreboard players operation @s tpsh *= @s dj 
execute if entity @a[tag=tpsj,tag=!tpsja] as @a[tag=tpsj] run scoreboard players operation @s tpsh *= @s tpqd
execute if entity @a[tag=tpsj,tag=!tpsja] as @a[tag=tpsj] run scoreboard players operation @s tpsh /= @s tpph
execute if entity @a[tag=tpsj,tag=!tpsja] as @a[tag=tpsj] run scoreboard players operation @s tpsh /= @s tp
execute if entity @a[tag=tpsj,tag=!tpsja] as @a[tag=tpsj] run effect @s fire_resistance 21 3 true 
execute if entity @a[tag=tpsj,tag=!tpsja] as @a[tag=tpsj] run tag @s add tpsja
execute if entity @a[tag=tpsj,scores={tp=1..}] run particle minecraft:lava_particle ~~~
# 玩家丢出的末影珍珠命中判定条：越接近 tprand 伤害越低，偏离过多会加倍。
execute if entity @a[tag=tpsj] if entity @e[type=minecraft:ender_pearl] as @a[tag=tpsj] at @s if entity @e[r=3.5,type=minecraft:ender_pearl] run scoreboard players operation @s tprand -= @s tptick
execute if entity @a[tag=tpsj] if entity @e[type=minecraft:ender_pearl] as @a[tag=tpsj,scores={tprand=1..}] at @s if entity @e[r=3.5,type=minecraft:ender_pearl] run scoreboard players operation @s tprand *= "-1" sum
execute if entity @a[tag=tpsj] if entity @e[type=minecraft:ender_pearl] as @a[tag=tpsj,scores={tprand=0}]  run scoreboard players operation @s tpsh /= "5" sum
execute if entity @a[tag=tpsj] if entity @e[type=minecraft:ender_pearl] as @a[tag=tpsj,scores={tprand=0}]  run tellraw @s {"rawtext":[{"text":"全是灵力沸腾，完美减伤"}]}
execute if entity @a[tag=tpsj] if entity @e[type=minecraft:ender_pearl] as @a[tag=tpsj,scores={tprand=-2..-1}] run scoreboard players operation @s tpsh /= "2" sum
execute if entity @a[tag=tpsj] if entity @e[type=minecraft:ender_pearl] as @a[tag=tpsj,scores={tprand=-2..-1}]  run tellraw @s {"rawtext":[{"text":"气沉丹田，减伤"}]}
execute if entity @a[tag=tpsj] if entity @e[type=minecraft:ender_pearl] as @a[tag=tpsj,scores={tprand=..-30}] run scoreboard players operation @s tpsh *= "2" sum
execute if entity @a[tag=tpsj] if entity @e[type=minecraft:ender_pearl] as @a[tag=tpsj,scores={tprand=..-30}] run tellraw @s {"rawtext":[{"text":"灵力虚浮，走火入魔"}]}
execute if entity @a[tag=tpsj] if entity @e[type=minecraft:ender_pearl] as @a[tag=tpsj] at @s if entity @e[r=3.5,type=minecraft:ender_pearl] run scoreboard players set @s tptime -1
execute if entity @a[tag=tpsj] if entity @e[type=minecraft:ender_pearl] as @a[tag=tpsj] at @s if entity @e[r=3.5,type=minecraft:ender_pearl] run tag @s remove tpsja
kill @e[type=minecraft:ender_pearl]

# 倒计时结束或命中后结算本轮雷劫，次数归零时给 tp 标签进入真正突破。
# 雷劫伤害写入 sskx，并召唤 lightning_bolt 做演出；死亡由 swcl.mcfunction 处理。
execute if entity @a[tag=tpsj,scores={tptime=..0}] as @a[tag=tpsj] run scoreboard players operation @s sskx += @s tpsh
execute if entity @a[tag=tpsj,scores={tptime=..0}] as @a[tag=tpsj] at @s run summon minecraft:lightning_bolt ~~~  
execute if entity @a[tag=tpsj,scores={tptime=..0}] as @a[tag=tpsj] run scoreboard players set @s tpsh 0
execute if entity @a[tag=tpsj,scores={tptime=..0}] as @a[tag=tpsj] run scoreboard players add @s tp -1
execute if entity @a[tag=tpsj,scores={tptime=..0,tp=..0}] as @a[tag=tpsj] run tag @s add tp
execute if entity @a[tag=tpsj,scores={tptime=..0,tp=..0}] as @a[tag=tpsj] run scoreboard players set @s xqcd 1
execute if entity @a[tag=tpsj,scores={tptime=..0}] as @a[tag=tpsj] run scoreboard players random @s tprand 0 50
execute if entity @a[tag=tpsj,scores={tptime=..0}] as @a[tag=tpsj] run scoreboard players set @s tptime 20
execute if score "tick" tick matches 19 if entity @a[tag=tpsj,scores={tptime=1..}] as @a[tag=tpsj] run scoreboard players add @s tptime -1

# 试炼进行时强制显示突破面板。
execute if entity @a[tag=tpsj,scores={tptime=1..}] as @a[tag=tpsj] run scoreboard players set @s xqcd 3 
