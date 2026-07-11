# 功法学习流程。
# 手持对应书籍并右键/使用时设置 gf 和 gftime；修炼期间持续消耗灵力，gftime 到 0 后生效并触发属性校准。
# gf=0 表示尚未学习功法；设置 gf 后会清除书籍，tag=gf 表示正在修炼读条。
# gftime 不是现实秒，而是由 xh/gf 调度减少的进度值；灵力不足时不会继续减少。
#####################千机玉寰金章
execute as @a[hasitem={item=book,data=301,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 500
execute as @a[hasitem={item=book,data=301,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 301
execute as @a[hasitem={item=book,data=301,location=slot.weapon.mainhand},scores={gf=301,dj=1..},tag=!gf,rxm=89] run clear @s book 301 1
execute as @a[scores={gf=301,gftime=500}] run tag @s add gf
execute as @a[scores={gf=301,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=301,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2
#####################小衍水决
execute as @a[hasitem={item=book,data=1,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 600
execute as @a[hasitem={item=book,data=1,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 1
execute as @a[hasitem={item=book,data=1,location=slot.weapon.mainhand},scores={gf=1,dj=1..},tag=!gf,rxm=89] run clear @s book 1 1
execute as @a[scores={gf=1,gftime=600}] run tag @s add gf
execute as @a[scores={gf=1,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=1,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2

# ===== 功法 data=2, gf=2 =====
execute as @a[hasitem={item=book,data=2,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 600
execute as @a[hasitem={item=book,data=2,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 2
execute as @a[hasitem={item=book,data=2,location=slot.weapon.mainhand},scores={gf=2,dj=1..},tag=!gf,rxm=89] run clear @s book 2 1
execute as @a[scores={gf=2,gftime=600}] run tag @s add gf
execute as @a[scores={gf=2,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=2,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2

# ===== 功法 data=3, gf=3 =====
execute as @a[hasitem={item=book,data=3,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 600
execute as @a[hasitem={item=book,data=3,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 3
execute as @a[hasitem={item=book,data=3,location=slot.weapon.mainhand},scores={gf=3,dj=1..},tag=!gf,rxm=89] run clear @s book 3 1
execute as @a[scores={gf=3,gftime=600}] run tag @s add gf
execute as @a[scores={gf=3,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=3,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2

# ===== 功法 data=4, gf=4 =====
execute as @a[hasitem={item=book,data=4,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 600
execute as @a[hasitem={item=book,data=4,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 4
execute as @a[hasitem={item=book,data=4,location=slot.weapon.mainhand},scores={gf=4,dj=1..},tag=!gf,rxm=89] run clear @s book 4 1
execute as @a[scores={gf=4,gftime=600}] run tag @s add gf
execute as @a[scores={gf=4,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=4,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2

# ===== 功法 data=5, gf=5 =====
execute as @a[hasitem={item=book,data=5,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 600
execute as @a[hasitem={item=book,data=5,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 5
execute as @a[hasitem={item=book,data=5,location=slot.weapon.mainhand},scores={gf=5,dj=1..},tag=!gf,rxm=89] run clear @s book 5 1
execute as @a[scores={gf=5,gftime=600}] run tag @s add gf
execute as @a[scores={gf=5,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=5,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2

# ===== 功法 data=6, gf=6 =====
execute as @a[hasitem={item=book,data=6,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 600
execute as @a[hasitem={item=book,data=6,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 6
execute as @a[hasitem={item=book,data=6,location=slot.weapon.mainhand},scores={gf=6,dj=1..},tag=!gf,rxm=89] run clear @s book 6 1
execute as @a[scores={gf=6,gftime=600}] run tag @s add gf
execute as @a[scores={gf=6,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=6,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2

# ===== 功法 data=7, gf=7 =====
execute as @a[hasitem={item=book,data=7,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 600
execute as @a[hasitem={item=book,data=7,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 7
execute as @a[hasitem={item=book,data=7,location=slot.weapon.mainhand},scores={gf=7,dj=1..},tag=!gf,rxm=89] run clear @s book 7 1
execute as @a[scores={gf=7,gftime=600}] run tag @s add gf
execute as @a[scores={gf=7,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=7,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2

# ===== 功法 data=8, gf=8 =====
execute as @a[hasitem={item=book,data=8,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 600
execute as @a[hasitem={item=book,data=8,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 8
execute as @a[hasitem={item=book,data=8,location=slot.weapon.mainhand},scores={gf=8,dj=1..},tag=!gf,rxm=89] run clear @s book 8 1
execute as @a[scores={gf=8,gftime=600}] run tag @s add gf
execute as @a[scores={gf=8,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=8,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2

# ===== 功法 data=9, gf=9 =====
execute as @a[hasitem={item=book,data=9,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 600
execute as @a[hasitem={item=book,data=9,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 9
execute as @a[hasitem={item=book,data=9,location=slot.weapon.mainhand},scores={gf=9,dj=1..},tag=!gf,rxm=89] run clear @s book 9 1
execute as @a[scores={gf=9,gftime=600}] run tag @s add gf
execute as @a[scores={gf=9,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=9,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2

# ===== 功法 data=10, gf=10 =====
execute as @a[hasitem={item=book,data=10,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 600
execute as @a[hasitem={item=book,data=10,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 10
execute as @a[hasitem={item=book,data=10,location=slot.weapon.mainhand},scores={gf=10,dj=1..},tag=!gf,rxm=89] run clear @s book 10 1
execute as @a[scores={gf=10,gftime=600}] run tag @s add gf
execute as @a[scores={gf=10,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=10,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2

# ===== 功法 data=11, gf=11 =====
execute as @a[hasitem={item=book,data=11,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 600
execute as @a[hasitem={item=book,data=11,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 11
execute as @a[hasitem={item=book,data=11,location=slot.weapon.mainhand},scores={gf=11,dj=1..},tag=!gf,rxm=89] run clear @s book 11 1
execute as @a[scores={gf=11,gftime=600}] run tag @s add gf
execute as @a[scores={gf=11,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=11,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2

# ===== 功法 data=12, gf=12 =====
execute as @a[hasitem={item=book,data=12,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 600
execute as @a[hasitem={item=book,data=12,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 12
execute as @a[hasitem={item=book,data=12,location=slot.weapon.mainhand},scores={gf=12,dj=1..},tag=!gf,rxm=89] run clear @s book 12 1
execute as @a[scores={gf=12,gftime=600}] run tag @s add gf
execute as @a[scores={gf=12,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=12,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2

# ===== 功法 data=13, gf=13 =====
execute as @a[hasitem={item=book,data=13,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 600
execute as @a[hasitem={item=book,data=13,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 13
execute as @a[hasitem={item=book,data=13,location=slot.weapon.mainhand},scores={gf=13,dj=1..},tag=!gf,rxm=89] run clear @s book 13 1
execute as @a[scores={gf=13,gftime=600}] run tag @s add gf
execute as @a[scores={gf=13,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=13,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2

# ===== 功法 data=14, gf=14 =====
execute as @a[hasitem={item=book,data=14,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 600
execute as @a[hasitem={item=book,data=14,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 14
execute as @a[hasitem={item=book,data=14,location=slot.weapon.mainhand},scores={gf=14,dj=1..},tag=!gf,rxm=89] run clear @s book 14 1
execute as @a[scores={gf=14,gftime=600}] run tag @s add gf
execute as @a[scores={gf=14,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=14,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2

# ===== 功法 data=15, gf=15 =====
execute as @a[hasitem={item=book,data=15,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 600
execute as @a[hasitem={item=book,data=15,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 15
execute as @a[hasitem={item=book,data=15,location=slot.weapon.mainhand},scores={gf=15,dj=1..},tag=!gf,rxm=89] run clear @s book 15 1
execute as @a[scores={gf=15,gftime=600}] run tag @s add gf
execute as @a[scores={gf=15,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=15,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2

# ===== 功法 data=16, gf=16 =====
execute as @a[hasitem={item=book,data=16,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 600
execute as @a[hasitem={item=book,data=16,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 16
execute as @a[hasitem={item=book,data=16,location=slot.weapon.mainhand},scores={gf=16,dj=1..},tag=!gf,rxm=89] run clear @s book 16 1
execute as @a[scores={gf=16,gftime=600}] run tag @s add gf
execute as @a[scores={gf=16,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=16,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2

# ===== 功法 data=17, gf=17 =====
execute as @a[hasitem={item=book,data=17,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 600
execute as @a[hasitem={item=book,data=17,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 17
execute as @a[hasitem={item=book,data=17,location=slot.weapon.mainhand},scores={gf=17,dj=1..},tag=!gf,rxm=89] run clear @s book 17 1
execute as @a[scores={gf=17,gftime=600}] run tag @s add gf
execute as @a[scores={gf=17,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=17,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2

# ===== 功法 data=18, gf=18 =====
execute as @a[hasitem={item=book,data=18,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 600
execute as @a[hasitem={item=book,data=18,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 18
execute as @a[hasitem={item=book,data=18,location=slot.weapon.mainhand},scores={gf=18,dj=1..},tag=!gf,rxm=89] run clear @s book 18 1
execute as @a[scores={gf=18,gftime=600}] run tag @s add gf
execute as @a[scores={gf=18,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=18,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2

# ===== 功法 data=19, gf=19 =====
execute as @a[hasitem={item=book,data=19,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 600
execute as @a[hasitem={item=book,data=19,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 19
execute as @a[hasitem={item=book,data=19,location=slot.weapon.mainhand},scores={gf=19,dj=1..},tag=!gf,rxm=89] run clear @s book 19 1
execute as @a[scores={gf=19,gftime=600}] run tag @s add gf
execute as @a[scores={gf=19,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=19,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2

# ===== 功法 data=20, gf=20 =====
execute as @a[hasitem={item=book,data=20,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gftime 600
execute as @a[hasitem={item=book,data=20,location=slot.weapon.mainhand},scores={gf=0,dj=1..},tag=!gf,rxm=89] run scoreboard players set @s gf 20
execute as @a[hasitem={item=book,data=20,location=slot.weapon.mainhand},scores={gf=20,dj=1..},tag=!gf,rxm=89] run clear @s book 20 1
execute as @a[scores={gf=20,gftime=600}] run tag @s add gf
execute as @a[scores={gf=20,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s gftime -1
execute as @a[scores={gf=20,gftime=1..},tag=gf] if score @s ll matches 2.. run scoreboard players add @s ll -2

















# 修炼中的通用限制和完成结算。
# 修炼中给缓慢和虚弱，避免玩家边修炼边战斗；完成时播放图腾粒子并重新计算属性。
execute as @a[scores={gftime=1..}] run scoreboard players add @s gftime 0
execute as @a[scores={gftime=1..}] run effect @s slowness 2 4 true
execute as @a[scores={gftime=1..}] run effect @s weakness 2 32 true
execute as @a[scores={gftime=0},tag=gf] at @s run playsound random.totem 
execute as @a[scores={gftime=0},tag=gf] at @s run particle minecraft:totem_particle ~ ~ ~
execute as @a[scores={gftime=0},tag=gf] run tag @s add "属性校准"
execute as @a[scores={gftime=0},tag=gf] run tag @s remove gf 
  scoreboard players add @a gf 0
