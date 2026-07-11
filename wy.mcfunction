# 剧情位移控制。
# 调用入口：xh.mcfunction 检测到实体 tag=wy2 时调用本文件；实体自身 wy 分数决定当前移动阶段。
# 写法说明：多数命令使用 facing + tp ^^^速度，让 NPC 朝目标点或玩家缓慢移动。
# 常见对象：道玄子、寇洪、京城守卫、赵管事、神秘人、玩家，以及带 tyz 标签的剧情实体。

# 道玄子、寇洪和 jiji 的早期剧情走位。
execute as @e[name=道玄子] at @s facing 137 79 118 if score @s wy matches 1 run tp @s[x=137,y=79,z=118,rm=2] ^^^2
execute as @e[name=寇洪] at @s facing 148 78 110 if score @s wy matches 1 run tp @s[x=148,y=78,z=110,rm=2] ^^^2
execute as @e[name=寇洪] at @s facing 141 78 116 if score @s wy matches 2 run tp @s[x=143,y=78,z=114,rm=2] ^^^0.7
execute as @e[name=道玄子] at @s facing ~ 57 ~ if score @s wy matches 2  unless block ~~~ air run tp @s ^^^0.5
execute as @e[name=寇洪] at @s facing ~ 58 ~ if score @s wy matches 3  unless block ~~-0.6~ air run tp @s ^^^0.5
execute as @e[name=道玄子] at @s facing ~ 81 ~ if score @s wy matches 3  run  tp @s[x=137,y=79,z=118,rm=2] ^^^1 
execute as @e[name=寇洪] at @s facing entity @p[scores={jqa=20,jq=..19}] eyes if score @s wy matches 4 unless entity @p[scores={jqa=20,jq=..19},r=3] run tp @s ^^^0.3
execute as @e[name=jiji] at @s facing ~ 57 ~ if score @s wy matches 1 run tp @s ^^^0.4
execute as @e[name=jiji] at @s facing ~ 57 ~ if score @s wy matches 1 run tp @s ~~~~~20

# 后续剧情中，道玄子/寇洪会追向正在播放指定 jqa 节点的玩家。
execute as @e[name=寇洪] at @s if score @s wy matches 5 facing entity @p[scores={jqa=29,jq=..28}] eyes unless entity @a[scores={jqa=29,jq=..28},r=3] run tp @s ^^^0.3
execute as @e[name=道玄子] at @s if score @s wy matches 5 facing entity @p[scores={jqa=29,jq=..28}] eyes unless entity @a[scores={jqa=29,jq=..28},r=3] run tp @s ^^^0.3

execute as @e[name=道玄子] at @s facing 95 59 67 if score @s wy matches 6 unless entity @s[x=95,y=59,z=67,r=2] run tp @s ^^^0.1
# 京城守卫根据 wy 阶段靠近或远离寇洪/道玄子，用于剧情演出站位。
execute as @e[name=京城守卫,scores={wy=1}] at @s facing entity @e[name=寇洪] eyes unless entity @e[r=2,name=寇洪] run tp @s ^^^0.5
execute as @e[name=京城守卫,scores={wy=2}] at @s facing entity @e[name=道玄子] eyes run tp @s ^^^-2
execute as @e[name=京城守卫,scores={wy=3}] at @s facing entity @e[name=道玄子] eyes unless entity @e[r=2,name=道玄子] run tp @s ^^^0.5
execute as @e[name=京城守卫,scores={wy=4}] at @s facing entity @e[name=道玄子] eyes run tp @s ^^^-2
execute as @e[name=京城守卫,scores={wy=5}] at @s facing entity @e[name=道玄子] eyes run tp @s ^^^-1
execute as @e[name=京城守卫,scores={wy=6}] at @s facing entity @e[name=道玄子] eyes run tp @s ^^^-0.7

# 赵管事固定路线移动，坐标在琉璃/商会相关剧情中使用。
execute as @e[name=赵管事,scores={wy=6}] at @s facing 3719 51 1837.51 run tp @s[x=3719,y=51,z=1837.51,rm=0.5] ^^^0.2
execute as @e[name=赵管事,scores={wy=6}] at @s facing 3720 51 1825 run tp @s[x=3720,y=51,z=1825,rm=0.5] ^^^0.2

execute as @e[tag=tyz] at @s facing ~ 100 ~ if score @s wy matches 1 run tp @s ^^^0.2
execute as @e[tag=tyz] at @s facing ~ 0 ~ if score @s wy matches 2 run tp @s ^^^0.2
# execute as @e[name=道玄子] at @s facing 137 79 118 if score @s wy matches 2 run tp @s[x=137,y=79,z=118,rm=2] ^^^2

# 神秘人：向固定坐标移动，靠近后由剧情节点继续处理。
execute as @e[name=神秘人,scores={wy=1}] at @s facing 3873 1 1968 unless entity @s[x=3873,y=1,z=1968,r=2] run tp @s ^^^1.6






















# 玩家位移：部分剧情会直接移动玩家到指定目标点。
execute as @a[scores={wy=1}] at @s facing -519 85 216 unless entity @s[x=-519,y=85,z=216,r=2] run tp @s ^^^1
