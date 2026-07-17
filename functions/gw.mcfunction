
# 怪物属性与掉落。
# tag=!ss 表示还未初始化的怪物；死亡时使用 gwrand 决定结构掉落。
# 本文件由 xh.mcfunction 高频调用，所以每种怪物初始化后都应该通过 ss 或 hp 条件避免重复重写。
# 掉落不是用原版 loot table，而是在死亡位置 structure load 对应物品结构。
#蠹蠹虫
execute as @e[family=mob,name="§7§l蠹蠹虫",tag=!ss] run scoreboard players set @s hp 70
execute as @e[family=mob,name="§7§l蠹蠹虫",tag=!ss] run scoreboard players set @s atk 5
execute as @e[family=mob,name="§7§l蠹蠹虫",scores={hp=..0}] at @s if score @s gwrand matches 1..4000 run structure load "ddcr" ~ ~0.5 ~
execute as @e[family=mob,name="§7§l蠹蠹虫",scores={hp=..0}] at @s if score @s gwrand matches 3000..6000 run structure load "ddcnj" ~ ~0.5 ~
execute as @e[family=mob,name="§r§j百年§7§l蠹蠹虫",tag=!ss] run scoreboard players set @s hp 500
execute as @e[family=mob,name="§r§j百年§7§l蠹蠹虫",tag=!ss] run scoreboard players set @s atk 20
execute as @e[family=mob,name="§r§j百年§7§l蠹蠹虫",scores={hp=..0}] at @s if score @s gwrand matches 1..6000 run structure load "bnddcr" ~ ~0.5 ~
execute as @e[family=mob,name="§r§j百年§7§l蠹蠹虫",scores={hp=..0}] at @s if score @s gwrand matches 2500..4000 run structure load "bnddcnj" ~ ~0.5 ~
execute as @e[family=mob,name="§r§j百年§7§l蠹蠹虫",scores={hp=..0}] at @s if score @s gwrand matches 1..20 run structure load "bnddcys" ~ ~0.5 ~


execute as @e[family=mob,name="§a树精",tag=!ss] run scoreboard players set @s hp 360
execute as @e[family=mob,name="§a树精",tag=!ss] run scoreboard players set @s hp2 360
execute as @e[family=mob,name="§a树精",tag=!ss] run scoreboard players set @s fyfy 3
execute as @e[family=mob,name="§a树精",tag=!ss] run scoreboard players set @s atk 15
execute as @e[family=mob,name="§a树精",tag=!ss] run scoreboard players set @s hx 4
execute as @e[family=mob,name="§a树精",scores={hp=..0}] at @s if score @s gwrand matches 1..6000 run structure load "sjdlw1" ~ ~0.5 ~
execute as @e[family=mob,name="§a树精",scores={hp=..0}] at @s if score @s gwrand matches 3500..5000 run structure load "sjdlw2" ~ ~0.5 ~
execute as @e[family=mob,name="§a树精",scores={hp=..0}] at @s if score @s gwrand matches 1..15 run structure load "sjdlw3" ~ ~0.5 ~










































#村长的弟弟
execute as @e[family=mob,name="村长的弟弟",tag=!ss] run scoreboard players set @s hp 250
execute as @e[family=mob,name="村长的弟弟",tag=!ss] run scoreboard players set @s atk 13
execute as @e[family=mob,name="村长的弟弟",tag=!ss] run scoreboard players set @s fyfy 4
execute as @e[family=mob,name="村长的弟弟",scores={hp=..0}] at @s if score @s gwrand matches 1.. run structure load "1/czdditem" ~ ~0.5 ~
#琉璃鱼
execute as @e[family=mob,name="§3§l琉璃鱼",tag=!ss] run scoreboard players set @s hp 500
execute as @e[family=mob,name="§3§l琉璃鱼",tag=!ss] run scoreboard players set @s hp2 500
execute as @e[family=mob,name="§3§l琉璃鱼",tag=!ss] run scoreboard players set @s atk 10
execute as @e[family=mob,name="§3§l琉璃鱼",tag=!ss] run scoreboard players set @s hx 2
execute as @e[family=mob,name="§3§l琉璃鱼",scores={hp=..0}] at @s if score @s gwrand matches 1..3000 run structure load "2/lly/llz" ~ ~0.5 ~
execute as @e[family=mob,name="§3§l琉璃鱼",scores={hp=..0}] at @s if score @s gwrand matches 2000..5500 run structure load "2/lly/llyr" ~ ~0.5 ~
execute as @e[family=mob,name="§l玲珑§3琉璃鱼",tag=!ss] run scoreboard players set @s hp 750
execute as @e[family=mob,name="§l玲珑§3琉璃鱼",tag=!ss] run scoreboard players set @s hp2 750
execute as @e[family=mob,name="§l玲珑§3琉璃鱼",tag=!ss] run scoreboard players set @s fyfy 20
execute as @e[family=mob,name="§l玲珑§3琉璃鱼",tag=!ss] run scoreboard players set @s atk 30
execute as @e[family=mob,name="§l玲珑§3琉璃鱼",tag=!ss] run scoreboard players set @s hx 5
execute as @e[family=mob,name="§l玲珑§3琉璃鱼",scores={hp=..0}] at @s if score @s gwrand matches 1..6000 run structure load "2/lly/llz" ~ ~0.5 ~
execute as @e[family=mob,name="§l玲珑§3琉璃鱼",scores={hp=..0}] at @s if score @s gwrand matches 1..10000 run structure load "2/lly/llyr" ~ ~0.5 ~
execute as @e[family=mob,name="§l玲珑§3琉璃鱼",scores={hp=..0}] at @s if score @s gwrand matches 5000..7000 run structure load "2/lly/llyr" ~ ~0.5 ~
execute as @e[family=mob,name="§l玲珑§3琉璃鱼",scores={hp=..0}] at @s if score @s gwrand matches 1..500 run structure load "2/lly/llllz" ~ ~0.5 ~









# 夜晚会把新生成怪物的生命、攻击、防御和掉落随机值提高 1.5 倍。
# 这里的 daytime>=13000 代表夜晚；血月等天气效果另由 day/xh 控制。
execute if score daytime day matches 13000.. as @e[family=mob,scores={hp=1..},tag=!ss] run scoreboard players operation @s hp *= "3" sum 
execute if score daytime day matches 13000.. as @e[family=mob,scores={hp=1..},tag=!ss] run scoreboard players operation @s hp /= "2" sum
execute if score daytime day matches 13000.. as @e[family=mob,scores={hp=1..},tag=!ss] run scoreboard players operation @s hp2 *= "3" sum 
execute if score daytime day matches 13000.. as @e[family=mob,scores={hp=1..},tag=!ss] run scoreboard players operation @s hp2 /= "2" sum
execute if score daytime day matches 13000.. as @e[family=mob,scores={hp=1..},tag=!ss] run scoreboard players operation @s atk *= "3" sum 
execute if score daytime day matches 13000.. as @e[family=mob,scores={hp=1..},tag=!ss] run scoreboard players operation @s atk /= "2" sum
execute if score daytime day matches 13000.. as @e[family=mob,scores={hp=1..},tag=!ss] run scoreboard players operation @s fy *= "3" sum 
execute if score daytime day matches 13000.. as @e[family=mob,scores={hp=1..},tag=!ss] run scoreboard players operation @s fy /= "2" sum
execute as @e[family=mob,scores={hp=1..},tag=!ss] run scoreboard players random @s gwrand 1 10000
# gwrand 也会在夜晚放大，等价于提高部分掉落判定区间的命中概率。
execute if score daytime day matches 13000.. as @e[family=mob,scores={hp=1..},tag=!ss] run scoreboard players operation @s gwrand /= "3" sum 
execute if score daytime day matches 13000.. as @e[family=mob,scores={hp=1..},tag=!ss] run scoreboard players operation @s gwrand *= "2" sum
# 初始化完成后打 ss，防止下一轮继续套夜晚倍率或重置属性。
execute as @e[family=mob,scores={hp=-99999..},x=1022,y=0,z=1011,rm=1] run tag @s add ss
# 清理死亡怪物和经验球，掉落由上面的结构加载控制。
kill @e[family=mob,scores={hp=..0}]
kill @e[type=minecraft:xp_orb]
