execute as @a[scores={cs=1},hasitem={item=gold:hz_x}] run scoreboard players add @s ls 1
execute as @a[scores={cs=1},hasitem={item=gold:hz_x}] run clear @s gold:hz_x 0 1
execute as @a[scores={cs=1},tag=自动出售] run scoreboard players add @s cs 1

execute as @a[scores={cs=2},hasitem={item=minecraft:rabbit_foot,data=0}] run scoreboard players add @s ls 2
execute as @a[scores={cs=2},hasitem={item=minecraft:rabbit_foot,data=0}] run clear @s minecraft:rabbit_foot 0 1
execute as @a[scores={cs=2},tag=自动出售] run scoreboard players add @s cs 1

execute as @a[scores={cs=3},hasitem={item=minecraft:armadillo_scute,data=0}] run scoreboard players add @s ls 3
execute as @a[scores={cs=3},hasitem={item=minecraft:armadillo_scute,data=0}] run clear @s minecraft:armadillo_scute 0 1
execute as @a[scores={cs=3},tag=自动出售] run scoreboard players add @s cs 1

execute as @a[scores={cs=4},hasitem={item=minecraft:fermented_spider_eye,data=0}] run scoreboard players add @s ls 40
execute as @a[scores={cs=4},hasitem={item=minecraft:fermented_spider_eye,data=0}] run clear @s minecraft:fermented_spider_eye 0 1
execute as @a[scores={cs=4},tag=自动出售] run scoreboard players add @s cs 1

execute as @a[scores={cs=5},hasitem={item=minecraft:phantom_membrane,data=0}] run scoreboard players add @s ls 100
execute as @a[scores={cs=5},hasitem={item=minecraft:phantom_membrane,data=0}] run clear @s minecraft:phantom_membrane 0 1
execute as @a[scores={cs=5},tag=自动出售] run scoreboard players add @s cs 1

execute as @a[scores={cs=6},hasitem={item=minecraft:emerald,data=1001}] run scoreboard players add @s ls 1000
execute as @a[scores={cs=6},hasitem={item=minecraft:emerald,data=1001}] run clear @s minecraft:emerald 1001 1
execute as @a[scores={cs=6},tag=自动出售] run scoreboard players add @s cs 1

execute as @a[scores={cs=7},hasitem={item=minecraft:turtle_scute,data=1001}] run scoreboard players add @s ls 70
execute as @a[scores={cs=7},hasitem={item=minecraft:turtle_scute,data=1001}] run clear @s minecraft:turtle_scute 1001 1
execute as @a[scores={cs=7},tag=自动出售] run scoreboard players add @s cs 1

execute as @a[scores={cs=8},hasitem={item=minecraft:slime_ball,data=1001}] run scoreboard players add @s ls 40
execute as @a[scores={cs=8},hasitem={item=minecraft:slime_ball,data=1001}] run clear @s minecraft:slime_ball 1001 1
execute as @a[scores={cs=8},tag=自动出售] run scoreboard players add @s cs 1
























































































scoreboard players reset @a cs