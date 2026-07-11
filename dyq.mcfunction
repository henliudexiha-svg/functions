# 鱼竿类特殊武器处理。
# 触发方式：玩家武器类型 wqlx=13，并产生 fishing_hook 后，本函数把钩子转换成自定义技能效果。
# 限制：突破试炼 tag=tpsj 期间不触发，避免和雷劫/突破面板逻辑冲突。
# 共用机制：部分技能会召唤 boat 作为弹体，写入 tyglx/tygcd/atk/bj/bs/mz/uuid，再交给 hxxt.mcfunction 飞行和伤害结算。

# 灵力枪：需要 slot.inventory 0 放 archer_pottery_sherd:data=10，消耗 7 点灵力。
# 灵力不足时直接清除 fishing_hook；灵力足够时生成 tyglx=1 的弹体，并继承玩家最终攻击、暴击、命中和 uuid。
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s if entity @p[scores={wqlx=13,ll=..6},tag=!tpsj,hasitem={item=minecraft:archer_pottery_sherd,data=10,location=slot.inventory,slot=0}]  run  kill @s

execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13,ll=7..},tag=!tpsj,hasitem={item=minecraft:archer_pottery_sherd,data=10,location=slot.inventory,slot=0}] at @s positioned ~~100.6~ run summon boat
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13,ll=7..},tag=!tpsj,hasitem={item=minecraft:archer_pottery_sherd,data=10,location=slot.inventory,slot=0}] at @s run playsound mob.zombie.woodbreak @s ~ ~ ~ 9 7 25
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13,ll=7..},tag=!tpsj,hasitem={item=minecraft:archer_pottery_sherd,data=10,location=slot.inventory,slot=0}] at @s run camerashake add @a[r=30] 0.2 0.1 positional
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13,ll=7..},tag=!tpsj,hasitem={item=minecraft:archer_pottery_sherd,data=10,location=slot.inventory,slot=0}] at @s positioned ~~100.6~ run scoreboard players set @e[r=2,c=1,type=boat,tag=!标记] tyglx 1
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13,ll=7..},tag=!tpsj,hasitem={item=minecraft:archer_pottery_sherd,data=10,location=slot.inventory,slot=0}] at @s positioned ~~100.6~ run scoreboard players set @e[r=2,c=1,type=boat,tag=!标记] tygcd 25
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13,ll=7..},tag=!tpsj,hasitem={item=minecraft:archer_pottery_sherd,data=10,location=slot.inventory,slot=0}] at @s positioned ~~100.6~ run scoreboard players operation @e[r=2,c=1,type=boat,tag=!标记] atk = @s atkatk
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13,ll=7..},tag=!tpsj,hasitem={item=minecraft:archer_pottery_sherd,data=10,location=slot.inventory,slot=0}] at @s positioned ~~100.6~ run scoreboard players operation @e[r=2,c=1,type=boat,tag=!标记] bs = @s bsbs
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13,ll=7..},tag=!tpsj,hasitem={item=minecraft:archer_pottery_sherd,data=10,location=slot.inventory,slot=0}] at @s positioned ~~100.6~ run scoreboard players operation @e[r=2,c=1,type=boat,tag=!标记] bj = @s bjbj
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13,ll=7..},tag=!tpsj,hasitem={item=minecraft:archer_pottery_sherd,data=10,location=slot.inventory,slot=0}] at @s positioned ~~100.6~ run scoreboard players operation @e[r=2,c=1,type=boat,tag=!标记] mz = @s mzmz
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13,ll=7..},tag=!tpsj,hasitem={item=minecraft:archer_pottery_sherd,data=10,location=slot.inventory,slot=0}] at @s positioned ~~100.6~ run scoreboard players operation @e[r=2,c=1,type=boat,tag=!标记] zs = @s zs
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13,ll=7..},tag=!tpsj,hasitem={item=minecraft:archer_pottery_sherd,data=10,location=slot.inventory,slot=0}] at @s positioned ~~100.6~ run scoreboard players operation @e[r=2,c=1,type=boat,tag=!标记] uuid = @s uuid
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13,ll=7..},tag=!tpsj,hasitem={item=minecraft:archer_pottery_sherd,data=10,location=slot.inventory,slot=0}] at @s positioned ~~100.6~ run tp @e[tag=!标记,type=boat,c=1] ^^^0.2 facing ~~~
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13,ll=7..},tag=!tpsj,hasitem={item=minecraft:archer_pottery_sherd,data=10,location=slot.inventory,slot=0}] at @s positioned ~~100.6~ run tag @e[r=2,type=boat] add 标记
execute if entity @a[scores={wqlx=13},tag=!tpsj] at @e[type=fishing_hook] as @p if entity @s[scores={wqlx=13,ll=7..},tag=!tpsj,hasitem={item=minecraft:archer_pottery_sherd,data=10,location=slot.inventory,slot=0}] run scoreboard players add @s ll -7
# 燧发枪：需要 slot.inventory 0 放 amethyst_cluster，并消耗 iron_nugget:data=10 作为弹药。
# 弹体固定 atk=30，继承玩家命中和 uuid；缺少弹药时只清除 fishing_hook。
# tyglx=2 会让 hxxt.mcfunction 显示另一种飞行粒子。
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s if entity @p[scores={wqlx=13},tag=!tpsj,hasitem=[{item=minecraft:amethyst_cluster,location=slot.inventory,slot=0},{item=iron_nugget,data=10,quantity=0}]]  run  kill @s

execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13},tag=!tpsj,hasitem=[{item=minecraft:amethyst_cluster,location=slot.inventory,slot=0},{item=iron_nugget,data=10,quantity=1..}]] at @s positioned ~~100.6~ run summon boat
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13},tag=!tpsj,hasitem=[{item=minecraft:amethyst_cluster,location=slot.inventory,slot=0},{item=iron_nugget,data=10,quantity=1..}]] at @s run playsound mob.zombie.woodbreak @a[r=30] ~ ~ ~ 9 7 25
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13},tag=!tpsj,hasitem=[{item=minecraft:amethyst_cluster,location=slot.inventory,slot=0},{item=iron_nugget,data=10,quantity=1..}]] at @s run camerashake add @s 0.3 0.2 positional
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13},tag=!tpsj,hasitem=[{item=minecraft:amethyst_cluster,location=slot.inventory,slot=0},{item=iron_nugget,data=10,quantity=1..}]] at @s positioned ~~100.6~ run scoreboard players set @e[r=2,c=1,type=boat,tag=!标记] tyglx 2
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13},tag=!tpsj,hasitem=[{item=minecraft:amethyst_cluster,location=slot.inventory,slot=0},{item=iron_nugget,data=10,quantity=1..}]] at @s positioned ~~100.6~ run scoreboard players set @e[r=2,c=1,type=boat,tag=!标记] tygcd 25
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13},tag=!tpsj,hasitem=[{item=minecraft:amethyst_cluster,location=slot.inventory,slot=0},{item=iron_nugget,data=10,quantity=1..}]] at @s positioned ~~100.6~ run scoreboard players  set  @e[r=2,c=1,type=boat,tag=!标记] atk 30
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13},tag=!tpsj,hasitem=[{item=minecraft:amethyst_cluster,location=slot.inventory,slot=0},{item=iron_nugget,data=10,quantity=1..}]] at @s positioned ~~100.6~ run scoreboard players operation @e[r=2,c=1,type=boat,tag=!标记] mz = @s mzmz
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13},tag=!tpsj,hasitem=[{item=minecraft:amethyst_cluster,location=slot.inventory,slot=0},{item=iron_nugget,data=10,quantity=1..}]] at @s positioned ~~100.6~ run scoreboard players operation @e[r=2,c=1,type=boat,tag=!标记] uuid = @s uuid
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13},tag=!tpsj,hasitem=[{item=minecraft:amethyst_cluster,location=slot.inventory,slot=0},{item=iron_nugget,data=10,quantity=1..}]] at @s positioned ~~100.6~ run tp @e[tag=!标记,type=boat,c=1] ^^^0.2 facing ~~~
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13},tag=!tpsj,hasitem=[{item=minecraft:amethyst_cluster,location=slot.inventory,slot=0},{item=iron_nugget,data=10,quantity=1..}]] at @s positioned ~~100.6~ run tag @e[r=2,type=boat] add 标记
execute if entity @a[scores={wqlx=13},tag=!tpsj] at @e[type=fishing_hook] as @p if entity @s[scores={wqlx=13},tag=!tpsj,hasitem=[{item=minecraft:amethyst_cluster,location=slot.inventory,slot=0},{item=iron_nugget,data=10,quantity=1..}]] run clear @s iron_nugget 10 1 


# 灵力弯刀：需要 slot.inventory 0 放 flow_pottery_sherd:data=10，消耗 10 点灵力。
# 这个技能不是弹体伤害，而是在玩家视线前方做近距离范围检测；命中实体后给玩家添加“攻击”标签，让 hxxt 继续结算吸血和显示。
# 临时 tag=sb 用于排除施法者自身，防止技能打到自己。
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s if entity @p[scores={wqlx=13,ll=..9},tag=!tpsj,hasitem={item=minecraft:flow_pottery_sherd,data=10,location=slot.inventory,slot=0}] run  kill @s
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s if entity @p[scores={wqlx=13,ll=10..},tag=!tpsj,hasitem={item=minecraft:flow_pottery_sherd,data=10,location=slot.inventory,slot=0}] as @p at @s run tag @s add "sb"
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s if entity @p[scores={wqlx=13,ll=10..},tag=!tpsj,hasitem={item=minecraft:flow_pottery_sherd,data=10,location=slot.inventory,slot=0}] as @e[type=minecraft:boat,tag=a] at @s run tp @s ~~~~97
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s if entity @p[scores={wqlx=13,ll=10..},tag=!tpsj,hasitem={item=minecraft:flow_pottery_sherd,data=10,location=slot.inventory,slot=0}] as @e[type=minecraft:boat,tag=a] at @s run tp @e[tag=b,type=minecraft:boat] ^^^2 facing @s 
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s if entity @p[scores={wqlx=13,ll=10..},tag=!tpsj,hasitem={item=minecraft:flow_pottery_sherd,data=10,location=slot.inventory,slot=0}] as @p at @s positioned ^^^-5 rotated as @e[tag=c] positioned ^^^0.25 rotated as @e[tag=c] positioned ^^^0.5 rotated as @e[tag=c] positioned ^^^1 rotated as @e[tag=c] positioned ^^^2 rotated as @e[tag=c] positioned ^^^4 rotated as @e[tag=c] positioned ^^^0.25 rotated as @e[tag=c] positioned ^^^4 facing entity @s eyes positioned as @s positioned ^^^3 positioned ~~1~ run particle minecraft:basic_crit_particle ~~~
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s if entity @p[scores={wqlx=13,ll=10..},tag=!tpsj,hasitem={item=minecraft:flow_pottery_sherd,data=10,location=slot.inventory,slot=0}] as @p at @s run playsound sweep @a[r=6] ~ ~ ~ 1.0 1 0
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13,ll=10..},tag=!tpsj,hasitem={item=minecraft:flow_pottery_sherd,data=10,location=slot.inventory,slot=0}] at @s run camerashake add @s 0.2 0.1 positional
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13,ll=10..},tag=!tpsj,hasitem={item=minecraft:flow_pottery_sherd,data=10,location=slot.inventory,slot=0}] at @s run playsound mob.snowgolem.hurt @a[r=50] ~~~ 1 4
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s if entity @p[scores={wqlx=13,ll=10..},tag=!tpsj,hasitem={item=minecraft:flow_pottery_sherd,data=10,location=slot.inventory,slot=0}] as @p at @s anchored eyes positioned ^^^2 run damage @e[scores={hp=1..},r=3,tag=!sb] 1
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13,ll=10..},tag=!tpsj,hasitem={item=minecraft:flow_pottery_sherd,data=10,location=slot.inventory,slot=0}] at @s anchored eyes positioned ^^^2 if entity @e[scores={hp=1..},r=3,tag=!sb] run tag @s add "攻击"
execute if entity @a[scores={wqlx=13},tag=!tpsj] as @e[type=fishing_hook] at @s as @p if entity @s[scores={wqlx=13,ll=10..},tag=!tpsj,hasitem={item=minecraft:flow_pottery_sherd,data=10,location=slot.inventory,slot=0}] at @s run scoreboard players remove @s ll 10 

execute if entity @a[scores={wqlx=13},tag=!tpsj] as @a[scores={wqlx=13},tag=!tpsj,hasitem={item=minecraft:flow_pottery_sherd,data=10,location=slot.inventory,slot=0}] run tag @s remove sb




























# 所有鱼竿技能都不保留原版鱼钩，避免原版拖拽和自定义攻击重复发生。
kill @e[type=minecraft:fishing_hook]
