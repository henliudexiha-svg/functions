


execute as @a at @s if entity @e[type=npc,r=3] run tag @s add jqnpc
execute as @a at @s unless entity @e[type=npc,r=3] run tag @s remove jqnpc
execute as @a[tag=jqnpc] run replaceitem entity @s slot.hotbar 8 minecraft:experience_bottle 6 1 {"item_lock": { "mode": "lock_in_slot" } }
execute as @a[tag=jqnpc] run scoreboard players reset @s cd
execute as @a[tag=jqnpc] run scoreboard players set @s xqcd 0
execute as @a at @s if entity @e[tag=守卫,r=3] run title @s actionbar 使用经验瓶进入场景
execute as @a at @s if entity @e[r=3,tag=守卫] at @e[type=minecraft:xp_bottle,r=3] run tp @p 290.64 58.00 216.70
kill @e[type=minecraft:xp_bottle]