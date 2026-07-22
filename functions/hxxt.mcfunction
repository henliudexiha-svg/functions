# 战斗与受击核心。
# 约定：atk/atkatk 是基础/最终攻击，zs/zszs 是真伤，sskx 是本次应受伤害。
# temp/tempa 在暴击结算中临时保存暴击率和暴击伤害；shxs 是伤害吸收。
# 大致流程：
# 1. 识别玩家是否用 0 号热键栏发起攻击。
# 2. 维护武器显示和特殊弹体飞行。
# 3. 用头盔槽临时标记受击实体，把攻击者属性复制到受击者。
# 4. 统一计算暴击、闪避、防御、伤害吸收、扣血、吸血和显示。
# banitem
execute if score "tick" tick matches 19 run clear @a[tag=!op] bamboo 0 



#攻击
# 0 号热键栏是自定义攻击入口；玩家把锁定物品切到主手时，打上攻击标签参与本 tick 结算。
# 原版物品只作为“输入按钮”和“显示模型”，真正伤害全部走 scoreboard。
execute as @a run replaceitem entity @s slot.hotbar 0 keep minecraft:barrier 1 1 {"item_lock":{"mode":"lock_in_slot"}}
execute as @a[hasitem=[{item=minecraft:barrier,data=1,location=slot.hotbar,slot=0},{item=minecraft:barrier,data=1,location=slot.weapon.mainhand}]] run tag @s add "攻击"
execute as @a[hasitem=[{item=minecraft:barrier,data=1,location=slot.hotbar,slot=0},{item=minecraft:barrier,data=1,location=slot.weapon.mainhand}]] run tag @s add "gj"
#wqlx 武器类型 0,7-12=剑 1..6=斧头 13钓鱼竿
# 按 wqlx 把 0 号热键栏替换成展示用武器；缴械时强制回到屏障。
execute as @a[tag=!tpsj,hasitem=[{item=ender_pearl,location=slot.hotbar,slot=0},{item=ender_pearl,location=slot.weapon.mainhand,slot=0}]] run replaceitem entity @s slot.hotbar 0 minecraft:barrier 1 1 {"item_lock":{"mode":"lock_in_slot"}} 
execute as @a run scoreboard players add @s wqlx 0 
execute if entity @a[scores={wqjx=1..}] as @a[scores={wqjx=1..}] run scoreboard players set @s wqlx 99
execute as @a[hasitem=[{item=barrier,location=slot.hotbar,slot=0},{item=barrier,location=slot.weapon.mainhand,slot=0}] ,scores={wqlx=0}] run replaceitem entity @s slot.hotbar 0 minecraft:golden_sword 1 9999 {"item_lock":{"mode":"lock_in_slot"}}
execute as @a[hasitem=[{item=barrier,location=slot.hotbar,slot=0},{item=barrier,location=slot.weapon.mainhand,slot=0}] ,scores={wqlx=1}] run replaceitem entity @s slot.hotbar 0 minecraft:wooden_axe 1 9999 {"item_lock":{"mode":"lock_in_slot"}}
execute as @a[hasitem=[{item=barrier,location=slot.hotbar,slot=0},{item=barrier,location=slot.weapon.mainhand,slot=0}] ,scores={wqlx=2}] run replaceitem entity @s slot.hotbar 0 minecraft:stone_axe 1 9999 {"item_lock":{"mode":"lock_in_slot"}}
execute as @a[hasitem=[{item=barrier,location=slot.hotbar,slot=0},{item=barrier,location=slot.weapon.mainhand,slot=0}] ,scores={wqlx=3}] run replaceitem entity @s slot.hotbar 0 minecraft:iron_axe 1 9999 {"item_lock":{"mode":"lock_in_slot"}}
execute as @a[hasitem=[{item=barrier,location=slot.hotbar,slot=0},{item=barrier,location=slot.weapon.mainhand,slot=0}] ,scores={wqlx=4}] run replaceitem entity @s slot.hotbar 0 minecraft:golden_axe 1 9999 {"item_lock":{"mode":"lock_in_slot"}}
execute as @a[hasitem=[{item=barrier,location=slot.hotbar,slot=0},{item=barrier,location=slot.weapon.mainhand,slot=0}] ,scores={wqlx=5}] run replaceitem entity @s slot.hotbar 0 minecraft:diamond_axe 1 9999 {"item_lock":{"mode":"lock_in_slot"}}
execute as @a[hasitem=[{item=barrier,location=slot.hotbar,slot=0},{item=barrier,location=slot.weapon.mainhand,slot=0}] ,scores={wqlx=6}] run replaceitem entity @s slot.hotbar 0 minecraft:netherite_axe 1 9999 {"item_lock":{"mode":"lock_in_slot"}}
execute as @a[hasitem=[{item=barrier,location=slot.hotbar,slot=0},{item=barrier,location=slot.weapon.mainhand,slot=0}] ,scores={wqlx=7}] run replaceitem entity @s slot.hotbar 0 minecraft:wooden_sword 1 9999 {"item_lock":{"mode":"lock_in_slot"}}
execute as @a[hasitem=[{item=barrier,location=slot.hotbar,slot=0},{item=barrier,location=slot.weapon.mainhand,slot=0}] ,scores={wqlx=8}] run replaceitem entity @s slot.hotbar 0 minecraft:stone_sword 1 9999 {"item_lock":{"mode":"lock_in_slot"}}
execute as @a[hasitem=[{item=barrier,location=slot.hotbar,slot=0},{item=barrier,location=slot.weapon.mainhand,slot=0}] ,scores={wqlx=9}] run replaceitem entity @s slot.hotbar 0 minecraft:iron_sword 1 9999 {"item_lock":{"mode":"lock_in_slot"}}
execute as @a[hasitem=[{item=barrier,location=slot.hotbar,slot=0},{item=barrier,location=slot.weapon.mainhand,slot=0}] ,scores={wqlx=10}] run replaceitem entity @s slot.hotbar 0 minecraft:golden_sword 1 9999 {"item_lock":{"mode":"lock_in_slot"}}
execute as @a[hasitem=[{item=barrier,location=slot.hotbar,slot=0},{item=barrier,location=slot.weapon.mainhand,slot=0}] ,scores={wqlx=11}] run replaceitem entity @s slot.hotbar 0 minecraft:diamond_sword 1 9999 {"item_lock":{"mode":"lock_in_slot"}}
execute as @a[hasitem=[{item=barrier,location=slot.hotbar,slot=0},{item=barrier,location=slot.weapon.mainhand,slot=0}] ,scores={wqlx=12}] run replaceitem entity @s slot.hotbar 0 minecraft:netherite_sword 1 9999 {"item_lock":{"mode":"lock_in_slot"}}
execute as @a[hasitem=[{item=barrier,location=slot.hotbar,slot=0},{item=barrier,location=slot.weapon.mainhand,slot=0}] ,scores={wqlx=13},tag=!tpsj] run replaceitem entity @s slot.hotbar 0 minecraft:fishing_rod 1 9999 {"item_lock":{"mode":"lock_in_slot"}}
execute as @a[tag=tpsj] run replaceitem entity @s slot.hotbar 0 ender_pearl 2 2 {"item_lock":{"mode":"lock_in_slot"}}
execute if entity @a[scores={wqjx=1..}] as @a[tag=!tpsj,scores={wqjx=1..}] run replaceitem entity @s slot.hotbar 0 barrier 1 0 {"item_lock":{"mode":"lock_in_slot"}}
execute if score "tick" tick matches 19 as @a[hasitem=[{item=deny,location=slot.weapon.mainhand,slot=0}],scores={wqlx=99}] run tellraw @s {"rawtext":[{"text":"异常状态：缴械 "},{"score":{"name":"*","objective":"wqjx"}}]}
execute if score "tick" tick matches 19 as @a[hasitem=[{item=fishing_rod,location=slot.hotbar,slot=0},{item=fishing_rod,location=slot.weapon.mainhand,slot=0}]] unless score @s wqlx matches 13 run replaceitem entity @s slot.hotbar 0 minecraft:barrier 1 0 {"item_lock":{"mode":"lock_in_slot"}}
# 灵力枪/鱼竿枪使用带“标记”标签的船作为弹体，tygcd 是飞行寿命。
# dyq.mcfunction 负责生成弹体并写入攻击属性；这里负责推进、碰撞、命中和清理。
execute if entity @e[type=minecraft:boat,tag=标记] as @e[type=minecraft:boat,tag=标记] run scoreboard players add @s tygcd -1
execute if entity @e[type=minecraft:boat,tag=标记] as @e[tag=tyg] at @s at @a[rm=0.1] if score @s tempb = @p uuid run tag @p add 攻击
execute if entity @e[type=minecraft:boat,tag=标记] as @e[type=minecraft:boat,tag=标记,scores={tygcd=1..}] at @s run tp @s ^^^-0.8
#鱼竿枪粒子
execute if entity @e[type=minecraft:boat,tag=标记] as @e[type=minecraft:boat,tag=标记,scores={tygcd=1..}] at @s if score @s tyglx matches 1 positioned ~~-99~ run particle minecraft:endrod ~~~  
execute if entity @e[type=minecraft:boat,tag=标记] as @e[type=minecraft:boat,tag=标记,scores={tygcd=1..}] at @s if score @s tyglx matches 2 positioned ~~-99~ run particle minecraft:basic_crit_particle ~~~





# 弹体命中：把弹体保存的攻击/暴击/暴伤复制到最近可战斗实体，并用 damage 触发后续受击检测。
execute if entity @e[type=minecraft:boat,tag=标记] as @e[type=minecraft:boat,tag=标记,scores={tygcd=1..}] at @s positioned ~~-99.5~ unless score @s uuid = @p[r=2] uuid run scoreboard players operation @e[family=!inanimate,type=!item,r=1.5,scores={hp=1..},c=1] sskx = @s atk
execute if entity @e[type=minecraft:boat,tag=标记] as @e[type=minecraft:boat,tag=标记,scores={tygcd=1..}] at @s positioned ~~-99.5~ unless score @s uuid = @p[r=2] uuid run scoreboard players operation @e[family=!inanimate,type=!item,r=1.5,scores={hp=1..},c=1] hp -= @s zszs
execute if entity @e[type=minecraft:boat,tag=标记] as @e[type=minecraft:boat,tag=标记,scores={tygcd=1..}] at @s positioned ~~-99.5~ unless score @s uuid = @p[r=2] uuid run scoreboard players operation @e[family=!inanimate,type=!item,r=1.5,scores={hp=1..},c=1] temp = @s bjbj
execute if entity @e[type=minecraft:boat,tag=标记] as @e[type=minecraft:boat,tag=标记,scores={tygcd=1..}] at @s positioned ~~-99.5~ unless score @s uuid = @p[r=2] uuid run scoreboard players operation @e[family=!inanimate,type=!item,r=1.5,scores={hp=1..},c=1] tempa = @s bsbs
execute if entity @e[type=minecraft:boat,tag=标记] as @e[type=minecraft:boat,tag=标记,scores={tygcd=1..}] at @s positioned ~~-99.5~ unless score @s uuid = @p[r=2] uuid run damage @e[family=!inanimate,type=!item,r=1.5,scores={hp=1..},c=1] 10 wither  

execute if entity @e[type=minecraft:boat,tag=标记] as @e[type=minecraft:boat,tag=标记,scores={tygcd=1..}] at @s positioned ~~-99.5~ unless block ~~~ air run kill @s 
execute if entity @e[type=minecraft:boat,tag=标记] as @e[type=minecraft:boat,tag=标记,scores={tygcd=..0}] run kill @s 
execute if entity @a[tag=!tpsj] run kill @e[type=fishing_hook]


#受击检测 atkatk 用于玩家 atk 用于怪物
# 先给所有可战斗实体套抗性，避免原版伤害干扰自定义血量。
# apple:data=9999 是临时“被打中”标记；后面会替换回 gold:tk。
effect @e[type=!player] resistance infinite 10 true
effect @e fire_resistance infinite 10 true 
effect @a[scores={jq=1..}] resistance infinite 10 true
execute as @e[family=!inanimate,type=!item,tag=!wy] run replaceitem entity @s slot.armor.head 0  keep minecraft:apple 1 9999 {"item_lock":{"mode":"lock_in_slot"}}

execute as @e[family=mob,hasitem={item=apple,data=9999,location=slot.armor.head}] at @s run scoreboard players operation @s sskx = @a[tag="攻击",c=1,r=10] atkatk
execute as @e[family=mob,hasitem={item=apple,data=9999,location=slot.armor.head}] at @s run scoreboard players operation @s hp -= @a[tag="攻击",c=1,r=10] zszs
execute as @e[family=mob,hasitem={item=apple,data=9999,location=slot.armor.head}] at @s run scoreboard players operation @s temp = @a[tag="攻击",c=1,r=10] bjbj
execute as @e[family=mob,hasitem={item=apple,data=9999,location=slot.armor.head}] at @s run scoreboard players operation @s tempa = @a[tag="攻击",c=1,r=10] bsbs
execute as @a[hasitem={item=apple,data=9999,location=slot.armor.head}] at @s if entity @a[r=6,tag="攻击",rm=0.5] run tag @s add "玩家攻击"
#上面是怪物被玩家攻击,下面是玩家被玩家攻击,玩家被怪物攻击
# 受击实体把攻击者的伤害、真伤、暴击率、暴伤复制到自身，后续统一结算。
execute as @a[tag="玩家攻击"] at @s run scoreboard players operation @s sskx = @a[rm=0.5,c=1] atkatk
execute as @a[tag="玩家攻击"] at @s run scoreboard players operation @s hp -= @a[rm=0.5,c=1] zszs
execute as @a[tag="玩家攻击"] at @s run scoreboard players operation @s temp = @a[rm=0.5,c=1] bjbj
execute as @a[tag="玩家攻击"] at @s run scoreboard players operation @s tempa = @a[rm=0.5,c=1] bsbs
execute as @a[tag=!"玩家攻击",hasitem={item=apple,data=9999,location=slot.armor.head}] at @s run scoreboard players operation @s sskx = @e[rm=0.5,c=1,type=!minecraft:player] atk
execute as @a[tag=!"玩家攻击",hasitem={item=apple,data=9999,location=slot.armor.head}] at @s run scoreboard players operation @s hp -= @e[rm=0.5,c=1,type=!minecraft:player] zs
execute as @a[tag=!"玩家攻击",hasitem={item=apple,data=9999,location=slot.armor.head}] at @s run scoreboard players operation @s temp = @e[rm=0.5,c=1,type=!minecraft:player] bj
execute as @a[tag=!"玩家攻击",hasitem={item=apple,data=9999,location=slot.armor.head}] at @s run scoreboard players operation @s tempa = @e[rm=0.5,c=1,type=!minecraft:player] bs
scoreboard players set "jzrs" jzrs 1
# jzrs 近似记录本次命中人数，用来放大群体命中时的吸血收益，但最多按 5 处理。
execute if entity @a[tag="攻击"] as @e[hasitem={item=apple,data=9999,location=slot.armor.head}] run scoreboard players add "jzrs" jzrs 1
execute if entity @a[tag="攻击"] if entity @e[hasitem={item=apple,data=9999,location=slot.armor.head}] run scoreboard players add "jzrs" jzrs -1
execute if score "jzrs" jzrs matches 6.. run scoreboard players set "jzrs" jzrs 5   
execute as @e[family=!inanimate,type=!item,tag=!wy] run replaceitem entity @s slot.armor.head 0 gold:tk  1 9999 {"item_lock":{"mode":"lock_in_slot"}}

#暴击系统
# rand-temp <= 0 时触发暴击，把暴伤比例加入本次伤害 sskx。
execute as @e[family=!inanimate,type=!item,scores={temp=1..}] run scoreboard players random @s rand 1 100
execute as @e[family=!inanimate,type=!item,scores={temp=1..}] run scoreboard players operation @s rand -= @s temp
execute as @e[family=!inanimate,type=!item,scores={rand=..0}] run scoreboard players operation @s temp = @s sskx
execute as @e[family=!inanimate,type=!item,scores={rand=..0}] run scoreboard players operation @s temp *= @s tempa
execute as @e[family=!inanimate,type=!item,scores={rand=..0}] run scoreboard players operation @s temp /= "100" sum
execute as @e[family=!inanimate,type=!item,scores={rand=..0}] run scoreboard players operation @s sskx += @s temp
#闪避检测
# 闪避与命中对冲：目标闪避率降低 rand，攻击者命中率提高 rand。
execute as @e[family=!inanimate,type=!item,scores={sskx=1..}] at @s run scoreboard players random @s rand 1 100 
execute as @e[family=!inanimate,type=!item,scores={sskx=1..}] at @s run scoreboard players operation @s rand -= @s sbsb
execute as @e[family=!inanimate,type=!item,scores={sskx=1..}] at @s run scoreboard players operation @s rand += @a[rm=0.5,c=1,r=10,scores={mzmz=1..}] mzmz
execute as @e[family=!inanimate,type=!item,scores={rand=..0}] at @s run tellraw @s {"rawtext":[{"text":"miss"}]}
execute as @e[family=!inanimate,type=!item,scores={rand=..0}] at @s run scoreboard players set @s sskx 0
execute as @e[family=!inanimate,type=!item,scores={rand=..0}] at @s run scoreboard players set @s rand 1

#扣血 shxs伤害吸收
# 防御、伤害吸收、攻击减免和跳劈加成都在真正扣 hp 前完成。
execute as @e[family=!inanimate,type=!item] run scoreboard players add @s shxs 0
execute as @e[family=!inanimate,type=!item] if score @s shxs matches ..-1 run scoreboard players add @s shxs 0
execute as @e[family=!inanimate,type=!item] run scoreboard players operation @s sskx -= @s fyfy
execute as @e[family=!inanimate,type=!item] if score @s sskx matches ..0 run scoreboard players set @s sskx 0
execute as @e[family=!inanimate,type=!item] if score @s sskx matches 1.. if score @s "shxs" >= @s "sskx" run scoreboard players operation @s temp = @s sskx
execute as @e[family=!inanimate,type=!item] if score @s sskx matches 1.. if score @s "shxs" >= @s "sskx" run scoreboard players set @s sskx 1
execute as @e[family=!inanimate,type=!item] if score @s sskx matches 1.. if score @s "shxs" >= @s "sskx" run scoreboard players operation @s shxs -= @s temp
execute as @e[family=!inanimate,type=!item] if score @s sskx matches 1.. if score @s "shxs" < @s "sskx" run scoreboard players operation @s temp = @s sskx
execute as @e[family=!inanimate,type=!item] if score @s sskx matches 1.. if score @s "shxs" < @s "sskx" run scoreboard players operation @s sskx -= @s shxs
execute as @e[family=!inanimate,type=!item] if score @s sskx matches 1.. if score @s "shxs" < @s "temp" run scoreboard players set @s shxs 0
execute as @e[family=!inanimate,type=!item] if score @s sskx matches 1.. if score @s "atkjm" matches 1..99 run scoreboard players operation @s "sskx" *= @s "atkjm"
execute as @e[family=!inanimate,type=!item] if score @s sskx matches 1.. if score @s "atkjm" matches 1..99 run scoreboard players operation @s "sskx" /= "100" sum  
#完美跳劈检测
# critical_hit 附近命中时额外 1.5 倍伤害，放在防御和吸收之后、真正扣血之前。
execute as @e[family=!inanimate,type=!item] if score @s sskx matches 1.. at @s if entity @p[tag=critical_hit,r=5]  run scoreboard players operation @s "sskx" *= "3" "sum"
execute as @e[family=!inanimate,type=!item] if score @s sskx matches 1.. at @s if entity @p[tag=critical_hit,r=5]  run scoreboard players operation @s "sskx" /= "2" "sum"
execute as @e[family=!inanimate,type=!item] at @s if score @s sskx matches 1.. run scoreboard players operation @a[c=1,rm=0.1,r=10,tag=攻击] temp = @s "sskx"
execute as @e[family=!inanimate,type=!item] at @s if score @s sskx matches 1.. run execute if entity @e[type=minecraft:boat,tag=标记] as @e[type=minecraft:boat,tag=标记,scores={tygcd=1..}] at @s positioned ~~-99.5~ run scoreboard players operation @s temp = @e[scores={sskx=1..},c=1] temp 
execute as @e[family=!inanimate,type=!item] if score @s sskx matches 1.. run scoreboard players operation @s "hp" -= @s "sskx"
execute as @e[family=!inanimate,type=!item] if score @s sskx matches 1.. run tellraw @s {"rawtext":[{"score":{"name":"*","objective":"hp"}},{"text":"§4♥§f (-"},{"score":{"name":"*","objective":"sskx"}},{"text":"§f)"}]}



execute as @a[scores={wqlx=13}] at @s at @e[tag=标记,type=boat,rm=0.1] if score @s uuid = @e[tag=标记,type=boat,c=1] uuid run scoreboard players operation @s temp = @e[c=1] temp
execute if entity @e[type=minecraft:boat,tag=标记] as @e[type=minecraft:boat,tag=标记,scores={tygcd=1..}] at @s positioned ~~-99.5~ unless score @s uuid = @p[r=2] uuid if entity @e[r=2,c=1,scores={hp=1..}] run tag @e[r=2,c=1] add tyg
scoreboard players reset * tempb
execute if entity @e[type=minecraft:boat,tag=标记] as @e[type=minecraft:boat,tag=标记,scores={tygcd=1..}] at @s positioned ~~-99.5~ unless score @s uuid = @p[r=2] uuid if entity @e[r=2,c=1,scores={hp=1..}] run scoreboard players operation @e[r=2,c=1] tempb = @s uuid
execute if entity @e[type=minecraft:boat,tag=标记] as @e[type=minecraft:boat,tag=标记,scores={tygcd=1..}] at @s positioned ~~-99.5~ unless score @s uuid = @p[r=2] uuid if entity @e[r=1.5,c=1,scores={hp=1..}] run kill @s 

#扣血显示
# temp 保存本次最终伤害，写给攻击者的 sjshxs 供 xqcd 战斗面板显示。
execute as @a[tag="攻击",scores={tick=1}] run scoreboard players set @s sjshxs 0
execute as @a[tag="攻击",scores={tick=1}] run scoreboard players operation @s sjshxs = @s temp
execute as @a[tag="攻击",scores={tick=1}] if score @s sjshxs matches 0 run scoreboard players set @s sjshxs 1 
#吸血系统
# 吸血按最终伤害和命中人数 jzrs 计算，显示数值写入 xxxs。
execute as @a[tag="攻击",scores={tick=1}] run scoreboard players operation @s tempa = @s xx
execute as @a[tag="攻击",scores={tick=1}] run scoreboard players operation @s tempb = @s xxgf
execute as @a[tag="攻击",scores={tick=1}] run scoreboard players operation @s tempb /= @s gfrs
execute as @a[tag="攻击",scores={tick=1}] run scoreboard players operation @s tempa += @s tempb
execute as @a[tag="攻击",scores={tick=1}] run scoreboard players operation @s temp *= @s tempa
execute as @a[tag="攻击",scores={tick=1}] run scoreboard players operation @s temp /= "100" sum 
execute as @a[tag="攻击",scores={tick=1}] run scoreboard players operation @s temp *= "jzrs" jzrs
execute as @a[tag="攻击",scores={tick=1}] run scoreboard players operation @s hp += @s temp
##吸血显示
execute as @a[tag="攻击",scores={tick=1}] run scoreboard players operation @s xxxs = @s temp
scoreboard players add @a[tag="攻击",scores={tick=1}] ticka 20 
scoreboard players operation @a[tag="攻击",scores={tick=1}] ticka < "50" sum
scoreboard players set @a[scores={xqcd=0},tag="攻击"] xqcd 2
execute as @a run scoreboard players operation @s hp < @s hp2hp2
scoreboard players reset * sskx 
scoreboard players reset * temp
# 清理本 tick 临时标签和伤害缓存，避免下个 tick 重复结算。
# weakness 用来限制连续攻击速度；tick 字段用于让一次攻击只在短窗口内结算一次。
tag @a remove "玩家攻击"
effect @a[tag="攻击"] weakness 1 30 true
effect @a[scores={ticka=1..10,wqlx=7..12}] weakness 0 31 true
effect @a weakness infinite 1 true
execute as @a[tag=攻击] run scoreboard players add @s tick 1 
execute as @a[tag=攻击,scores={tick=2..}] run scoreboard players set @s tick 0
execute as @a[tag=攻击,scores={tick=1..}] run tag @s remove 攻击
