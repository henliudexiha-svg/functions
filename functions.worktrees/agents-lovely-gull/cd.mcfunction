

#雪球加分
execute at @e[type=snowball] run scoreboard players add @p cd 1
execute at @e[type=snowball] run playsound random.orb @p ~~~ 5 0.9
scoreboard players set @a[scores={cd=5..}] cd 1
kill @e[type=minecraft:snowball]


#显示
execute as @a[scores={cd=1..5}] at @s run titleraw @s actionbar {"rawtext":[{"text":"  §d༺§c✿§f回档§b༒§f修仙§c✿§d༻\n§e====================\n"},{"translate":"%%2『返回主城』","with":{"rawtext":[{"selector":"@s[scores={cd=1}]"},{"text":"   §g➮§c"},{"text":"§r     "}]}},{"translate":"\n%%2『自刎归天』","with":{"rawtext":[{"selector":"@s[scores={cd=2}]"},{"text":"   §g➭§c"},{"text":"§r     "}]}},{"translate":"\n%%2『个人信息』","with":{"rawtext":[{"selector":"@s[scores={cd=3}]"},{"text":"   §g➭§c"},{"text":"§r     "}]}},{"text":"\n§r§e====================\n§a抬头确认   低头取消"}]}

#返回主城
execute as @a[scores={cd=1},rx=-85] run tp @s 171.10 59.00 263.87
execute as @a[scores={cd=1},rx=-85] run title @s actionbar 已关闭菜单
execute as @a[scores={cd=1},rx=-85] run scoreboard players reset @s cd

#原地去世
execute as @a[scores={cd=2},rx=-85] run scoreboard players set @s hp 0
execute as @a[scores={cd=2},rx=-85] run title @s actionbar 已关闭菜单
execute as @a[scores={cd=2},rx=-85] run scoreboard players reset @s cd

#个人信息
execute as @a[scores={cd=3},rx=-85] run scoreboard players set @s xqcd 1
execute as @a[scores={cd=3},rx=-85] run scoreboard players reset @s cd

#雪球固定在9号物品栏，jqnpc为检测npc，详情看jqnpc.mcfunction
execute as @a[tag=!jqnpc] run replaceitem entity @s slot.hotbar 8 minecraft:snowball 6 1 {"item_lock": { "mode": "lock_in_slot" } }


execute as @a[scores={cd=1..},rxm=85] run title @s actionbar 菜单已关闭
execute as @a[scores={cd=1..},rxm=85] run scoreboard players reset @s cd