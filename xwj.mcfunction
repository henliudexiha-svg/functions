# 新玩家基础属性初始化。
# 这个文件只负责重置属性数值，不负责分配 uuid 和开局剧情；完整开局流程见 jq/ks.mcfunction。
# 设计意图：把玩家拉回凡人初始状态，清空境界、修为、筑基奇物和炼丹经验。
# 注意：第一行会先移除“新玩家”标签，后续选择器 tag=!"新玩家" 会命中被重置的玩家。
tag @a remove 新玩家
# 生存资源：初始生命 200，灵力为 0，瘴气 zq 从 0 开始。
execute if entity @a[tag=!"新玩家"]  as @a[tag=!"新玩家"] run scoreboard players set @s hp2 200
execute if entity @a[tag=!"新玩家"]  as @a[tag=!"新玩家"] run scoreboard players set @s hp 200
execute if entity @a[tag=!"新玩家"]  as @a[tag=!"新玩家"] run scoreboard players set @s zq 0
execute if entity @a[tag=!"新玩家"]  as @a[tag=!"新玩家"] run scoreboard players set @s ll2 0
execute if entity @a[tag=!"新玩家"]  as @a[tag=!"新玩家"] run scoreboard players set @s ll 0
# 基础战斗属性：凡人攻击 1、防御 0、回血 1、闪避 1、真伤 1，暴击相关为 0。
execute if entity @a[tag=!"新玩家"]  as @a[tag=!"新玩家"] run scoreboard players set @s hx 1
execute if entity @a[tag=!"新玩家"]  as @a[tag=!"新玩家"] run scoreboard players set @s bj 0
execute if entity @a[tag=!"新玩家"]  as @a[tag=!"新玩家"] run scoreboard players set @s bs 0
execute if entity @a[tag=!"新玩家"]  as @a[tag=!"新玩家"] run scoreboard players set @s zs 1
execute if entity @a[tag=!"新玩家"]  as @a[tag=!"新玩家"] run scoreboard players set @s fy 0
execute if entity @a[tag=!"新玩家"]  as @a[tag=!"新玩家"] run scoreboard players set @s atk 1
execute if entity @a[tag=!"新玩家"]  as @a[tag=!"新玩家"] run scoreboard players set @s sb 1
# 经济与修炼进度：给 100 灵石，境界 dj=0，下一境界需求 jy2=100。
execute if entity @a[tag=!"新玩家"]  as @a[tag=!"新玩家"] run scoreboard players set @s ls 100
execute if entity @a[tag=!"新玩家"]  as @a[tag=!"新玩家"] run scoreboard players set @s dj 0
execute if entity @a[tag=!"新玩家"]  as @a[tag=!"新玩家"] run scoreboard players set @s jy2 100
execute if entity @a[tag=!"新玩家"]  as @a[tag=!"新玩家"] run scoreboard players set @s jy 0
execute if entity @a[tag=!"新玩家"]  as @a[tag=!"新玩家"] run scoreboard players set @s tdqw 0
# 炼丹系统初始值：0 品炼丹师，经验 0，下一级需求 100。
execute if entity @a[tag=!"新玩家"]  as @a[tag=!"新玩家"] run scoreboard players set @s ld 0
execute if entity @a[tag=!"新玩家"]  as @a[tag=!"新玩家"] run scoreboard players set @s ldjy 0
execute if entity @a[tag=!"新玩家"]  as @a[tag=!"新玩家"] run scoreboard players set @s ldjy2 100
