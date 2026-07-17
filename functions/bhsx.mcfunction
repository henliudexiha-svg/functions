execute as @a run scoreboard players operation @s ls1 -= @s ls
scoreboard players set "-1" sum -1
execute as @a run scoreboard players operation @s ls1 *= "-1" sum
execute as @a[scores={ls1=..-1}] at @s run playsound random.anvil_land @s ~ ~ ~ 1 1.5
execute as @a[scores={ls1=1..}] at @s run playsound note.chime @s ~ ~ ~ 1 1.3
execute as @a[scores={ls1=1..}] run tellraw @s {"rawtext":[{"text":"§6灵石§e"},{"score":{"name":"@s","objective":"ls"}},{"text":"§r+"},{"score":{"name":"@s","objective":"ls1"}}]}
execute as @a run scoreboard players operation @s ls1 = @s ls


execute as @a run scoreboard players operation @s xw1 -= @s jy
execute as @a run scoreboard players operation @s xw1 *= "-1" sum
execute as @a[scores={xw1=1..}] at @s run playsound note.pling @s ~ ~ ~ 0.7 1.8
execute as @a[scores={xw1=1..}] run tellraw @s {"rawtext":[{"text":"§b修为+§r"},{"score":{"name":"@s","objective":"xw1"}}]}
execute as @a run scoreboard players operation @s xw1 = @s jy