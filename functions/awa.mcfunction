# 调试/快捷突破入口。
# 作用：把执行者 @s 的当前修为 jy 直接设置到突破需求 jy2，然后给 tpsj 标签进入突破试炼。
# 使用场景：测试突破流程、雷劫结算、死亡播报时临时调用。
# 注意：下面保留的大段 rawtext 是死亡/筑基播报草稿，当前都被 # 注释，不会执行。
# {"translate":"%%6","with":{"rawtext":[
#     {"selector":"@s[scores={tdqw=..1}]"},
#     {"selector":"@a[scores={tdqw=..2}]"},
#     {"selector":"@a[scores={tdqw=..4}]"},
#     {"selector":"@a[scores={tdqw=..4}]"},
#     {"selector":"@a[scores={tdqw=..5}]"},
#     {"text":"奇物【虬龙枝】成就道基"},
#     {"text":"奇物【锈剑道玄】成就道基"},
#     {"text":"奇物【天煞剑意】成就道基"},
#     {"text":"奇物【附魔金苹果】成就道基"},
#     {"text":"奇物【不眠瞳】成就道基"},
#     ]}}




# {"rawtext":[{"text":"§7§l筑基§4§l修士 §l§6"},{"selector":"@s"},{"text":"§r§f,凡修道 "},{"score":{"name":"@s","objective":"day"}},{"text":" 载，"},{"translate":"%%6","with":{"rawtext":[{"selector":"@s[scores={tdqw=..1}]"},{"selector":"@a[scores={tdqw=..2}]"},{"selector":"@a[scores={tdqw=..4}]"},{"selector":"@a[scores={tdqw=..4}]"},{"selector":"@a[scores={tdqw=..5}]"},{"text":"以奇物§a§l【虬龙枝】§r§f成就道基"},{"text":"以奇物§a§l【锈剑道玄】§r§f成就道基"},{"text":"以奇物§a§l【天煞剑意】§r§f成就道基"},{"text":"以奇物§a§l【附魔金苹果】§r§f成就道基"},{"text":"以奇物§a§l【不眠瞳】§r§f成就道基"},{"test":""}]}},{"text":"，因被 "},{"translate":"%%2%%4","with":{"rawtext":[{"text":""},{"selector":"@e[family=!inanimate,type=!item,type=!player,r=10,c=2]"},{"translate":"%%7","with":{"rawtext":[{"selector":"@p[scores={dj=..4}]"},{"selector":"@p[scores={dj=..8}]"},{"selector":"@p[scores={dj=..12}]"},{"selector":"@p[scores={dj=..16}]"},{"selector":"@p[scores={dj=..20}]"},{"selector":"@p[scores={dj=..24}]"},{"translate":"%%2%%1","with":{"rawtext":[{"text":"§a§l练气修士 "},{"selector":"@p[scores={dj=1..4}]"}]}},{"translate":"%%2%%1","with":{"rawtext":[{"text":"§7§l筑基修士 "},{"selector":"@p[scores={dj=5..8}]"}]}},{"translate":"%%2%%1","with":{"rawtext":[{"text":"§g§l金丹修士 "},{"selector":"@p[scores={dj=9..12}]"}]}},{"translate":"%%2%%1","with":{"rawtext":[{"text":"§e§l元婴修士 "},{"selector":"@p[scores={dj=14..16}]"}]}},{"translate":"%%2%%1","with":{"rawtext":[{"text":"§5§l化神修士 "},{"selector":"@p[scores={dj=16..20}]"}]}},{"translate":"%%2%%1","with":{"rawtext":[{"text":"§c§l合道修士 "},{"selector":"@p[scores={dj=21..24}]"}]}},{"text":""}]}}]}},{"text":" §r§f所伤，如今身死道消，还道于天！"}]}

# 将当前修为补到刚好满足突破需求。
scoreboard players operation @s jy = @s jy2
# tpsj 会被 xh.mcfunction 检测到，并交给 tpsj.mcfunction 进入雷劫/突破判定。
tag @s add tpsj
