# 死亡处理。
# hp<=0 的玩家会先处理特殊免死，再广播死亡信息，最后按 vip/普通玩家重置生命与灵力。
# 村长的弟弟附近触发一次剧情免死回血。
# 调用来源：xh.mcfunction 检测任意玩家 hp<=0 后调用。
# 注意：这里不清除背包，qz 已设置 keepinventory true；死亡惩罚主要是重置 day、面板和突破状态。
execute as @a[scores={hp=..0}] at @s if entity @e[name=村长的弟弟,r=10] run tellraw @a[r=50,scores={hp=..0}] {"rawtext":[{"text":"你使用了珍藏已久的宝药§4♥§f +100"}]}
execute as @a[scores={hp=..0}] at @s if entity @e[name=村长的弟弟,r=10] run scoreboard players add @s hp 100
execute as @a[scores={hp=..0},tag=新玩家] run kill @s
execute as @a[scores={hp=..-1},tag=!新玩家] run kill @s
# 普通死亡播报会展示境界、修道天数、筑基奇物和附近攻击者/实体。
execute as @a[scores={dj=1..,hp=..0},tag=!tpsj,tag=!tyg] at @s run tellraw @a {"rawtext":[{"translate":"%%7","with":{"rawtext":[{"selector":"@s[scores={dj=..4}]"},{"selector":"@s[scores={dj=..8}]"},{"selector":"@s[scores={dj=..12}]"},{"selector":"@s[scores={dj=..16}]"},{"selector":"@s[scores={dj=..20}]"},{"selector":"@s[scores={dj=..24}]"},{"text":"§a§l练气修士"},{"text":"§7§l筑基修士"},{"text":"§g§l金丹修士"},{"text":"§e§l元婴修士"},{"text":"§5§l化神修士"},{"text":"§c§l合道修士"},{"text":"§4§l长生天尊"}]}},{"selector":"@s"},{"text":"§r§f,凡修道"},{"score":{"name":"@s","objective":"day"}},{"text":"载，"},{"translate":"%%7","with":{"rawtext":[{"selector":"@s[scores={tdqw=..1}]"},{"selector":"@s[scores={tdqw=..2}]"},{"selector":"@s[scores={tdqw=..3}]"},{"selector":"@s[scores={tdqw=..4}]"},{"selector":"@s[scores={tdqw=..5}]"},{"selector":"@s[scores={tdqw=..6}]"},{"text":"以奇物§a§l【虬龙枝】§r§f成就道基"},{"text":"以奇物§a§l【锈剑道玄】§r§f成就道基"},{"text":"以奇物§a§l【天煞剑意】§r§f成就道基"},{"text":"以奇物§a§l【附魔金苹果】§r§f成就道基"},{"text":"以奇物§a§l【不眠瞳】§r§f成就道基"},{"text":"以奇物§a§l【沧海珠】§r§f成就道基"}]}},{"text":"，因被"},{"translate":"%%2","with":{"rawtext":[{"text":""},{"selector":"@e[family=!inanimate,type=!item,type=!player,r=10,c=1,scores={hp=1..}]"}]}},{"translate":"%%8","with":{"rawtext":[{"selector":"@a[r=10,tag=gj,c=1,scores={hp=1..}]"},{"selector":"@a[r=10,tag=gj,c=1,scores={dj=..4,hp=1..}]"},{"selector":"@a[r=10,tag=gj,c=1,scores={dj=..8,hp=1..}]"},{"selector":"@a[r=10,tag=gj,c=1,scores={dj=..12,hp=1..}]"},{"selector":"@a[r=10,tag=gj,c=1,scores={dj=..16,hp=1..}]"},{"selector":"@a[r=10,tag=gj,c=1,scores={dj=..20,hp=1..}]"},{"selector":"@a[r=10,tag=gj,c=1,scores={dj=..24,hp=1..}]"},{"rawtext":[{"text":"§a§l练气修士"},{"selector":"@a[r=10,tag=gj,c=1,scores={dj=1..4}]"}]},{"rawtext":[{"text":"§7§l筑基修士"},{"selector":"@a[r=10,tag=gj,c=1,scores={dj=5..8}]"}]},{"rawtext":[{"text":"§g§l金丹修士"},{"selector":"@a[r=10,tag=gj,c=1,scores={dj=9..12}]"}]},{"rawtext":[{"text":"§e§l元婴修士"},{"selector":"@a[r=10,tag=gj,c=1,scores={dj=13..16}]"}]},{"rawtext":[{"text":"§5§l化神修士"},{"selector":"@a[r=10,tag=gj,c=1,scores={dj=17..20}]"}]},{"rawtext":[{"text":"§c§l合道修士"},{"selector":"@a[r=10,tag=gj,c=1,scores={dj=21..24}]"}]},{"rawtext":[{"text":"§4§l长生天尊"},{"selector":"@a[r=10,tag=gj,c=1,scores={dj=25..}]"}]},{"text":""}]}},{"text":"§r§f所伤，如今身死道消，还道于天！"}]}
# 灵力枪击杀会通过 tyg/tempb 记录弹体归属，使用单独死亡文案。
execute as @a[scores={dj=1..4},tag=tyg] at @a[tag="攻击",rm=0.1] run tellraw @a {"rawtext":[{"translate":"%%1","with":{"rawtext":[{"selector":"@s[scores={dj=..4}]"},{"selector":"@s[scores={dj=..8}]"},{"selector":"@s[scores={dj=..12}]"},{"selector":"@s[scores={dj=..16}]"},{"selector":"@s[scores={dj=..20}]"},{"selector":"@s[scores={dj=..24}]"},{"text":"§a§l练气修士"},{"text":"§7§l筑基修士"},{"text":"§g§l金丹修士"},{"text":"§e§l元婴修士"},{"text":"§5§l化神修士"},{"text":"§c§l合道修士"},{"text":"§4§l长生天尊"}]}},{"selector":"@s"},{"text":"§r§f,凡修道"},{"score":{"name":"@s","objective":"day"}},{"text":"载"},{"translate":"%%1","with":{"rawtext":[{"selector":"@s[scores={tdqw=..1}]"},{"selector":"@s[scores={tdqw=..2}]"},{"selector":"@s[scores={tdqw=..3}]"},{"selector":"@s[scores={tdqw=..4}]"},{"selector":"@s[scores={tdqw=..5}]"},{"selector":"@s[scores={tdqw=..6}]"},{"text":"以奇物§a§l【虬龙枝】§r§f成就道基"},{"text":"以奇物§a§l【锈剑道玄】§r§f成就道基"},{"text":"以奇物§a§l【天煞剑意】§r§f成就道基"},{"text":"以奇物§a§l【附魔金苹果】§r§f成就道基"},{"text":"以奇物§a§l【不眠瞳】§r§f成就道基"},{"text":"以奇物§a§l【沧海珠】§r§f成就道基"}]}},{"text":"，因被"},{"translate":"%%1","with":{"rawtext":[{"selector":"@e[family=!inanimate,type=!item,type=!player,r=10,c=2,scores={hp=1..}]"}]}},{"translate":"%%1","with":{"rawtext":[{"selector":"@p[scores={dj=..4}]"},{"selector":"@p[scores={dj=..8}]"},{"selector":"@p[scores={dj=..12}]"},{"selector":"@p[scores={dj=..16}]"},{"selector":"@p[scores={dj=..20}]"},{"selector":"@p[scores={dj=..24}]"},{"translate":"%%1","with":{"rawtext":[{"text":"§a§l练气修士"},{"selector":"@p[scores={dj=1..4}]"}]}},{"translate":"%%1","with":{"rawtext":[{"text":"§7§l筑基修士"},{"selector":"@p[scores={dj=5..8}]"}]}},{"translate":"%%1","with":{"rawtext":[{"text":"§g§l金丹修士"},{"selector":"@p[scores={dj=9..12}]"}]}},{"translate":"%%1","with":{"rawtext":[{"text":"§e§l元婴修士"},{"selector":"@p[scores={dj=13..16}]"}]}},{"translate":"%%1","with":{"rawtext":[{"text":"§5§l化神修士"},{"selector":"@p[scores={dj=16..20}]"}]}},{"translate":"%%1","with":{"rawtext":[{"text":"§c§l合道修士"},{"selector":"@p[scores={dj=21..24}]"}]}},{"translate":"%%1","with":{"rawtext":[{"text":"§4§l长生天尊"},{"selector":"@p[scores={dj=25..}]"}]}},{"text":""}]}},{"text":"§r§f使用灵力枪所伤，如今身死道消，还道于天！"}]}
execute as @a[scores={hp=..0,dj=4},tag=tpsj] at @s run tellraw @a[r=1000] {"rawtext":[{"text":"§a§l练气§3§l修士 §l§6"},{"selector":"@s"},{"text":"§r§f,凡修道 "},{"score":{"name":"@s","objective":"day"}},{"text":" 载，因突破筑基天道雷劫所伤，如今身死道消，还道于天！"}]}

 
# 突破中死亡视为突破失败，清理突破状态。
# 这里同时移除 tp/tpsj，防止复活后继续被 djsx 当作突破成功处理。
execute as @a[scores={hp=..0},tag=tpsj] run tellraw @s {"rawtext":[{"text":"§4§l突破失败，请下次做好准备再来"}]}
execute as @a[scores={hp=..0},tag=tpsj] run tag @s remove tp
execute as @a[scores={hp=..0},tag=tpsj] run tag @s remove tpsj
execute as @a[scores={hp=..0,dj=1..}] run scoreboard players set @s day 0 
execute as @a[scores={hp=..0}] run scoreboard players set @s xqcd 0
execute as @a[scores={hp=..0}] run scoreboard players set @s tpzt 0


# 最终复活数值：普通玩家保留 1 点生命，vip 直接满额。
execute as @a[scores={hp=..0},tag=!vip] run scoreboard players operation @s hp = @s hp2hp2
execute as @a[scores={hp=..0},tag=!vip] run scoreboard players operation @s hp /= "2" sum
execute as @a[scores={hp=..0},tag=!vip] run scoreboard players set @s ll 0
execute as @a[scores={hp=..0},tag=vip] run scoreboard players set @s hp 9999999
execute as @a[scores={hp=..0},tag=vip] run scoreboard players set @s ll 9999999
