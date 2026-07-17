# 一些药品和药物-丹药
# 使用条件统一依赖手持物品、rxm=89（使用动作）和境界限制；触发后清除 1 个物品。
# 本文件由 xh.mcfunction 每 10 个短周期调用一次，不是每 tick 都执行。
# hp/shxs/jy 是直接写入当前值；最终上限裁剪由 xh/sxjs 后续处理。
# 普通金苹果：低中境界修为、回血和护盾补给。
execute  as @a[hasitem={item=golden_apple,location=slot.weapon.mainhand,data=0},rxm=89,scores={dj=0..13}] run scoreboard players add @s jy 10
execute  as @a[hasitem={item=golden_apple,location=slot.weapon.mainhand,data=0},rxm=89,scores={dj=0..13}] run scoreboard players add @s hp 100
execute  as @a[hasitem={item=golden_apple,location=slot.weapon.mainhand,data=0},rxm=89,scores={dj=0..13}] run scoreboard players add @s shxs 200
execute  as @a[hasitem={item=golden_apple,location=slot.weapon.mainhand,data=0},rxm=89,scores={dj=0..13}] at @s run playsound random.eat @s ~~~ 1 0.8 1
execute  as @a[hasitem={item=golden_apple,location=slot.weapon.mainhand,data=0},rxm=89,scores={dj=0..13}] run effect @s slowness 1 2 true
execute  as @a[hasitem={item=golden_apple,location=slot.weapon.mainhand,data=0},rxm=89,scores={dj=0..13}] run effect @s speed 120 0 true
execute  as @a[hasitem={item=golden_apple,location=slot.weapon.mainhand,data=0},rxm=89,scores={dj=0..13}] run clear @s golden_apple 0 1 

# 附魔金苹果：高额修为、回血和伤害吸收，并给长期速度效果。
execute  as @a[hasitem={item=enchanted_golden_apple,location=slot.weapon.mainhand,data=0},rxm=89] run scoreboard players add @s jy 1000
execute  as @a[hasitem={item=enchanted_golden_apple,location=slot.weapon.mainhand,data=0},rxm=89] run scoreboard players add @s hp 10000
execute  as @a[hasitem={item=enchanted_golden_apple,location=slot.weapon.mainhand,data=0},rxm=89] run scoreboard players add @s shxs 5000
execute  as @a[hasitem={item=enchanted_golden_apple,location=slot.weapon.mainhand,data=0},rxm=89] at @s run playsound random.eat @s ~~~ 1 0.8 1
execute  as @a[hasitem={item=enchanted_golden_apple,location=slot.weapon.mainhand,data=0},rxm=89] run effect @s slowness 1 2 true
execute  as @a[hasitem={item=enchanted_golden_apple,location=slot.weapon.mainhand,data=0},rxm=89] run effect @s speed infinite 1 true 
execute  as @a[hasitem={item=enchanted_golden_apple,location=slot.weapon.mainhand,data=0},rxm=89] run clear @s enchanted_golden_apple 0 1
#练气丹
# 练气丹本身不直接加修为；它在修为已经超过需求时，给玩家 tpsj 标签进入突破流程。
execute  as @a[hasitem={item=minecraft:fire_charge,location=slot.weapon.mainhand,data=10},rxm=89,scores={dj=..3}] if score @s "jy" > @s "jy2" run tag @s add tpsj
execute  as @a[hasitem={item=minecraft:fire_charge,location=slot.weapon.mainhand,data=10},rxm=89,scores={dj=..3}] if score @s "jy" > @s "jy2" at @s run playsound random.eat @s ~~~ 1 0.8 1
execute  as @a[hasitem={item=minecraft:fire_charge,location=slot.weapon.mainhand,data=10},rxm=89,scores={dj=..3}] if score @s "jy" > @s "jy2" run effect @s slowness 1 2 true
execute  as @a[hasitem={item=minecraft:fire_charge,location=slot.weapon.mainhand,data=10},rxm=89,scores={dj=..3}] if score @s "jy" > @s "jy2" run clear @s minecraft:fire_charge 10 1 

























# 显示与资源结算
# xwa/lsa/yja 是待结算增量：先显示标题和音效，再写入修为、灵石、耀金。
# 当 zq 未满 100 时，xwa 会先折算为祛除瘴气；zq 满后才真正转化为修为。
execute as @a[scores={xwa=1..,zq=100..}] run titleraw @s title {"rawtext":[{"text":"\n\n\n\n                §e§l修为+"},{"score":{"name":"*","objective":"xwa"}}]}
execute as @a[scores={xwa=1..,zq=..99}] run scoreboard players operation @s xwa /= "10" sum

execute as @a[scores={xwa=1..,zq=..99}] run titleraw @s title {"rawtext":[{"text":"\n\n\n\n                §e§l瘴气-"},{"score":{"name":"*","objective":"xwa"}}]}
execute as @a[scores={xwa=1..,zq=..99}] run scoreboard players operation @s zq += @s xwa
execute as @a[scores={xwa=1..}] at @s run playsound item.trident.thunder @s ~~~ 5 2 5
execute as @a[scores={xwa=1..,zq=100..}] run scoreboard players operation @s jy += @s xwa
execute as @a[scores={xwa=1..}] run scoreboard players set @s xwa 0

execute as @a[scores={lsa=1..}] run titleraw @s title {"rawtext":[{"text":"\n\n\n\n                §b§l灵石+"},{"score":{"name":"*","objective":"lsa"}}]}
execute as @a[scores={lsa=1..}] at @s run playsound item.trident.thunder @s ~~~ 5 2 5
execute as @a[scores={lsa=1..}] run scoreboard players operation @s ls += @s lsa
execute as @a[scores={lsa=1..}] run scoreboard players set @s lsa 0


# 耀金奖励同样走 yja 暂存，方便任务/掉落先写增量，再统一显示和结算。
execute as @a[scores={yja=1..}] run titleraw @s title {"rawtext":[{"text":"\n\n\n\n                §e§l耀金+"},{"score":{"name":"*","objective":"yja"}}]}
execute as @a[scores={yja=1..}] at @s run playsound item.trident.thunder @s ~~~ 5 2 5
execute as @a[scores={yja=1..}] run scoreboard players operation @s yj += @s yja
execute as @a[scores={yja=1..}] run scoreboard players set @s yja 0
