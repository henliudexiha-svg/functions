execute as @a[scores={cs=1},hasitem={item=gold:hz_x}] run scoreboard players add @s ls 1
execute as @a[scores={cs=1},hasitem={item=gold:hz_x}] run clear @s gold:hz_x 0 1
execute as @a[scores={cs=1}] run scoreboard players reset @s cs