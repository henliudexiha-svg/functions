# 主循环函数，由 tick.json 每 tick 调用。
# 用 "tick" 和 "10" 两个虚拟玩家做短周期计时，分散执行高频系统。
# 主要调度：日期天气、怪物属性、战斗受击、突破、属性面板、丹药、死亡、任务剧情。
# gw：怪物属性和掉落初始化。
# 执行顺序很重要：
# 1. 先推进计时和日期，再刷新怪物属性。
# 2. 再跑 hxxt 处理本 tick 攻击/受击，把伤害写入 hp。
# 3. 再处理突破、属性校准、最终属性刷新和面板显示。
# 4. 最后清理计时器，避免下一轮重复触发。
scoreboard players add "tick" tick 1
scoreboard players add "10" tick 1 
# execute if score "tick" tick matches 1 run scoreboard players add daytime day 1
 execute if score "tick" tick matches 1 run function day


function gw 
#攻击受击计算-hhxt核心系统
function hxxt
execute if entity @a[tag=tpsj] run function tpsj
# tp 表示已经通过突破试炼，或低境界直接突破；属性校准表示需要重新套用境界/功法/奇物属性。
execute if score "10" tick matches 5 if entity @a[tag=tp] run function djsx
execute if score "10" tick matches 5 if entity @a[tag="属性校准"] run function djsx
# sxjs 每秒附近刷新最终属性，供战斗、回复、面板读取。
execute if score "tick" tick matches 19 run function sxjs



function xqcd
# 属性面板与战斗面板显示；ticka 用来短暂显示本次攻击和吸血数值。
execute as @a[scores={ticka=1..}] run scoreboard players add @s ticka -1



#丹药
# dy 既处理手持丹药使用，也处理 xwa/lsa/yja 这类待结算奖励。
execute if score "10" tick matches 10.. run function dy
#死亡处理
execute if entity @a[scores={hp=..0}] run function swcl







#回血回蓝
# 每 5 个主循环周期触发自然恢复，并把 hp/ll 限制在最终上限内。
execute if score "tick" tick matches 19 run scoreboard players add "5s" tick 1
execute if score "5s" tick matches 5 as @a run scoreboard players operation @s hp += @s hxhx
execute if score "5s" tick matches 5 as @a run scoreboard players operation @s ll += @s hlhl
execute if score "5s" tick matches 5 as @a run scoreboard players operation @s ll < @s ll2ll2
execute if score "5s" tick matches 5 as @a run scoreboard players operation @s hp < @s hp2hp2
#丹药回血回蓝
execute if score "tick" tick matches 19 as @a[scores={kshxt=1..}] run scoreboard players operation @s hp += @s kshx
execute if score "tick" tick matches 19 as @a[scores={kshlt=1..}] run scoreboard players operation @s ll += @s kshl
execute if score "tick" tick matches 19 as @a[scores={kshlt=1..}] run scoreboard players operation @s ll < @s ll2ll2
execute if score "tick" tick matches 19 as @a[scores={kshxt=1..}] run scoreboard players operation @s hp < @s hp2hp2
execute if score "tick" tick matches 19 as @a[scores={kshxt=1..}] run scoreboard players add @s kshxt -1
execute if score "tick" tick matches 19 as @a[scores={kshlt=1..}] run scoreboard players add @s kshlt -1
execute if score "tick" tick matches 19 as @a[scores={ksfyt=1..}] run scoreboard players add @s ksfyt -1
execute if score "tick" tick matches 19 as @a[scores={ksatkt=1..}] run scoreboard players add @s ksatkt -1
execute if score "tick" tick matches 19 as @a[scores={ksfyt=0,ksfy=1..}] run scoreboard players set @s ksfyt 0
execute if score "tick" tick matches 19 as @a[scores={ksatkt=0,ksatk=1..}] run scoreboard players set @s ksatkt 0
execute if score "tick" tick matches 19 as @a[scores={kshxt=0,kshx=1..}] run scoreboard players set @s kshx 0
execute if score "tick" tick matches 19 as @a[scores={kshlt=0,kshl=1..}] run scoreboard players set @s kshl 0
#怪物的回血回蓝
execute if score "tick" tick matches 19 as @e[family=mob,scores={hp=1..,hx=1..,hp2=1..}] run scoreboard players operation @s hp += @s hx
execute if score "tick" tick matches 19 as @e[family=mob,scores={hp=1..,hx=1..,hp2=1..}] run scoreboard players operation @s hp < @s hp2

# 天气会改变恢复节奏：仙凡瘴减慢回复，灵力雨加快回复。
execute if score "tick" tick matches 19 if score "5s" tick matches 5.. unless score rand day matches 601..750  run scoreboard players set "5s" tick 1
execute if score "tick" tick matches 19 if score "5s" tick matches 10.. if score rand day matches 601..700 run scoreboard players set "5s" tick 1
execute if score "tick" tick matches 19 if score "5s" tick matches 3.. if score rand day matches 701..750 run scoreboard players set "5s" tick 1









# 剧情与任务轮询：只在固定 tick 检查，减少每 tick 压力。
execute if score "tick" tick matches 5 if entity @a[tag=jq] run function jq/jq
execute if score "tick" tick matches 7 if entity @a[tag=rwcx] as @a[tag=rwcx] run function rw/rw
execute if score "tick" tick matches 8 as @a[hasitem={item=cookie,data=10,quantity=1..50,location=slot.weapon.mainhand}] run replaceitem entity @s slot.weapon.mainhand 0 cookie 64 10 {"item_lock":{"mode":"lock_in_inventory"}}
#限制经验1.5倍
# 防止当前修为 jy 超过下一境界需求 jy2 的 1.5 倍，避免一次性跳太多进度。
execute if score "10" tick matches 10 as @a run scoreboard players operation @s tempb = @s jy2
execute if score "10" tick matches 10 as @a run scoreboard players operation @s tempb *= "3" sum
execute if score "10" tick matches 10 as @a run scoreboard players operation @s tempb /= "2" sum
execute if score "10" tick matches 10 as @a run scoreboard players operation @s jy < @s tempb
execute if score "10" tick matches 10 as @a[rx=88] run replaceitem entity @s slot.inventory 26 ominous_bottle 1 1 {"item_lock":{"mode":"lock_in_slot"}}
execute if score "10" tick matches 10 as @a[rxm=89] run replaceitem entity @s slot.inventory 26 air 
# wqjx 是缴械倒计时，由 hxxt 读取并限制武器显示/攻击。
execute if score "tick" tick matches 19 if entity @a[scores={wqjx=1..}] as @a[scores={wqjx=1..}] run scoreboard players add @s wqjx -1
#rw
# execute if score "10" tick matches 2 as @a[scores={rw=2,rwa=3},hasitem={item=element_1}] run tag @s add rw 
# execute if score "10" tick matches 2 as @a[scores={rw=2,rwa=3},hasitem={item=element_1}] run tellraw @s {"rawtext":[{"text":"§a§l任务§r§f: §a§l任务§r§f完成！请提交任务"}]}
# execute if score "10" tick matches 2 as @a[scores={rw=2,rwa=3},hasitem={item=element_1}] run clear @s element_1 0 1
#wy
# 剧情实体位移；wy2 表示本 tick 有角色需要自动移动。
execute if entity @e[tag=wy2] run function wy
execute as @e[tag=wy] at @s run tp @s ~~~~~











#xz
# 特殊场景机关与持续实体逻辑。
execute if entity @e[tag=yuanhu] as @e[tag=yuanhu] at @s facing entity @e[tag=yuanxing,c=1] feet run tp ^0.34^^0.03
execute if entity @a[tag=jq9] run kill @e[type=minecraft:arrow,x=142,y=58,z=119,r=100,tag=!a]
#cyy
execute if score "cyy" day matches 1.. run function ld/cyy




#功法
# 功法修炼期间播放粒子，并交给 gf 处理读书进度和结算。
execute if score "10" tick matches 3..6 at @a[tag=gf,scores={gftime=1..}] run particle minecraft:lava_particle ~ ~ ~ 
execute if score "tick" tick matches 3 run function gf




# 计时器回绕，避免分数无限增长。
execute if score tick tick matches 20.. run scoreboard players set tick tick 0
execute if score "10" tick matches 10.. run scoreboard players set "10" tick 0


# 雪球菜单
function cd

#灵力枪
function dyq

#npc交流
function jqnpc

function bhsx

function sdgm

function cs