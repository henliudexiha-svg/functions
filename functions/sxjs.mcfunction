
#属性计算
# 每秒刷新玩家最终属性。
# 后缀 a 表示装备/临时附加值，双写字段如 atkatk、hp2hp2、ll2ll2 表示最终结算值。
# 这里不直接扣血或回血，只负责把“基础值 + 装备 + 临时 buff”写成最终缓存。
# 其他系统应优先读最终缓存，例如 hxxt 读 atkatk/fyfy，xqcd 读 hp2hp2/ll2ll2。
#武器
# 只读取背包 0 号位作为主武器槽，同时写入攻击加成 atka 和武器类型 wqlx。
# wqlx 后续会被 hxxt 用来替换 0 号热键栏显示武器，也会被 dyq 用来判断鱼竿类技能。
execute  as @a run scoreboard players set @s atka 0
execute  as @a[hasitem={item=wooden_axe,location=slot.inventory,slot=0}] run scoreboard players set @s atka 7
execute  as @a[hasitem={item=wooden_axe,location=slot.inventory,slot=0}] run scoreboard players set @s wqlx 1
execute  as @a[hasitem={item=stone_axe,location=slot.inventory,slot=0}] run scoreboard players set @s atka 9
execute  as @a[hasitem={item=stone_axe,location=slot.inventory,slot=0}] run scoreboard players set @s wqlx 2
execute  as @a[hasitem={item=iron_axe,location=slot.inventory,slot=0}] run scoreboard players set @s atka 13
execute  as @a[hasitem={item=iron_axe,location=slot.inventory,slot=0}] run scoreboard players set @s wqlx 3
execute  as @a[hasitem={item=golden_axe,location=slot.inventory,slot=0}] run scoreboard players set @s atka 18
execute  as @a[hasitem={item=golden_axe,location=slot.inventory,slot=0}] run scoreboard players set @s wqlx 4
execute  as @a[hasitem={item=diamond_axe,location=slot.inventory,slot=0}] run scoreboard players set @s atka 21
execute  as @a[hasitem={item=diamond_axe,location=slot.inventory,slot=0}] run scoreboard players set @s wqlx 5
execute  as @a[hasitem={item=netherite_axe,location=slot.inventory,slot=0}] run scoreboard players set @s atka 24
execute  as @a[hasitem={item=netherite_axe,location=slot.inventory,slot=0}] run scoreboard players set @s wqlx 6
execute  as @a[hasitem={item=wooden_sword,location=slot.inventory,slot=0}] run scoreboard players set @s atka 4
execute  as @a[hasitem={item=wooden_sword,location=slot.inventory,slot=0}] run scoreboard players set @s wqlx 7
execute  as @a[hasitem={item=stone_sword,location=slot.inventory,slot=0}] run scoreboard players set @s atka 5
execute  as @a[hasitem={item=stone_sword,location=slot.inventory,slot=0}] run scoreboard players set @s wqlx 8
execute  as @a[hasitem={item=iron_sword,location=slot.inventory,slot=0}] run scoreboard players set @s atka 6
execute  as @a[hasitem={item=iron_sword,location=slot.inventory,slot=0}] run scoreboard players set @s wqlx 9
execute  as @a[hasitem={item=golden_sword,location=slot.inventory,slot=0}] run scoreboard players set @s atka 7
execute  as @a[hasitem={item=golden_sword,location=slot.inventory,slot=0}] run scoreboard players set @s wqlx 10
execute  as @a[hasitem={item=diamond_sword,location=slot.inventory,slot=0}] run scoreboard players set @s atka 10
execute  as @a[hasitem={item=diamond_sword,location=slot.inventory,slot=0}] run scoreboard players set @s wqlx 11
execute  as @a[hasitem={item=netherite_sword,location=slot.inventory,slot=0}] run scoreboard players set @s atka 13
execute  as @a[hasitem={item=netherite_sword,location=slot.inventory,slot=0}] run scoreboard players set @s wqlx 12
execute  as @a[hasitem={item=minecraft:archer_pottery_sherd,data=10,location=slot.inventory,slot=0}] run scoreboard players set @s wqlx 13
execute  as @a[hasitem={item=minecraft:archer_pottery_sherd,data=10,location=slot.inventory,slot=0}] run scoreboard players set @s atka 15
execute  as @a[hasitem={item=amethyst_cluster,data=10,location=slot.inventory,slot=0}] run scoreboard players set @s wqlx 13
execute  as @a[hasitem={item=minecraft:flow_pottery_sherd,data=10,location=slot.inventory,slot=0}] run scoreboard players set @s wqlx 13
execute  as @a[hasitem={item=minecraft:flow_pottery_sherd,data=10,location=slot.inventory,slot=0}] run scoreboard players set @s atka 20
#装备
# 护甲只统计胸甲、护腿、鞋子的防御加成，最终汇总到 fya。
# 头盔槽在 hxxt 中会被临时用作受击检测标记，所以这里不把头盔计入防御。
execute  as @a run scoreboard players reset * fya
execute  as @a[hasitem={item=leather_chestplate,location=slot.armor.chest,slot=0}] run scoreboard players add @s fya 3
execute  as @a[hasitem={item=leather_leggings,location=slot.armor.legs,slot=0}] run scoreboard players add @s fya 2
execute  as @a[hasitem={item=leather_boots,location=slot.armor.feet,slot=0}] run scoreboard players add @s fya 1
execute  as @a[hasitem={item=iron_chestplate,location=slot.armor.chest,slot=0}] run scoreboard players add @s fya 6
execute  as @a[hasitem={item=iron_leggings,location=slot.armor.legs,slot=0}] run scoreboard players add @s fya 5
execute  as @a[hasitem={item=iron_boots,location=slot.armor.feet,slot=0}] run scoreboard players add @s fya 3
execute  as @a[hasitem={item=golden_chestplate,location=slot.armor.chest,slot=0}] run scoreboard players add @s fya 15
execute  as @a[hasitem={item=golden_leggings,location=slot.armor.legs,slot=0}] run scoreboard players add @s fya 13
execute  as @a[hasitem={item=golden_boots,location=slot.armor.feet,slot=0}] run scoreboard players add @s fya 10
execute  as @a[hasitem={item=diamond_chestplate,location=slot.armor.chest,slot=0}] run scoreboard players add @s fya 9
execute  as @a[hasitem={item=diamond_leggings,location=slot.armor.legs,slot=0}] run scoreboard players add @s fya 7
execute  as @a[hasitem={item=diamond_boots,location=slot.armor.feet,slot=0}] run scoreboard players add @s fya 5
execute  as @a[hasitem={item=netherite_chestplate,location=slot.armor.chest,slot=0}] run scoreboard players add @s fya 11
execute  as @a[hasitem={item=netherite_leggings,location=slot.armor.legs,slot=0}] run scoreboard players add @s fya 9
execute  as @a[hasitem={item=netherite_boots,location=slot.armor.feet,slot=0}] run scoreboard players add @s fya 6

# tempa 是通用临时变量；下面逐项计算最终攻击、真伤、暴击、命中、防御、闪避和上限。
# 每一项都先复制基础值，再叠加对应 a 后缀或 k 前缀临时 buff，最后写入最终字段。
execute  as @a run scoreboard players reset * tempa
execute  as @a run scoreboard players operation @s tempa = @s atk
execute  as @a run scoreboard players operation @s tempa += @s atka
execute  as @a run scoreboard players operation @s tempa += @s ksatk
execute  as @a run scoreboard players operation @s tempb = @s atkgf
execute  as @a run scoreboard players operation @s tempb /= @s gfrs
execute  as @a run scoreboard players operation @s tempa += @s tempb
execute  as @a run scoreboard players operation @s atkatk = @s tempa
execute  as @a run scoreboard players operation @s tempa = @s zs
execute  as @a run scoreboard players operation @s tempa += @s zsa
execute  as @a run scoreboard players operation @s tempb = @s zsgf
execute  as @a run scoreboard players operation @s tempb /= @s gfrs
execute  as @a run scoreboard players operation @s tempa += @s tempb
execute  as @a run scoreboard players operation @s zszs = @s tempa

execute  as @a run scoreboard players operation @s tempa = @s bj
execute  as @a run scoreboard players operation @s tempa += @s bja
execute  as @a run scoreboard players operation @s tempb = @s bjgf
execute  as @a run scoreboard players operation @s tempb /= @s gfrs
execute  as @a run scoreboard players operation @s tempa += @s tempb
execute  as @a run scoreboard players operation @s bjbj = @s tempa

execute  as @a run scoreboard players operation @s tempa = @s bs
execute  as @a run scoreboard players operation @s tempa += @s bsa
execute  as @a run scoreboard players operation @s tempb = @s bsgf
execute  as @a run scoreboard players operation @s tempb /= @s gfrs
execute  as @a run scoreboard players operation @s tempa += @s tempb
execute  as @a run scoreboard players operation @s bsbs = @s tempa

execute  as @a run scoreboard players operation @s tempa = @s mz
execute  as @a run scoreboard players operation @s tempa += @s mza
execute  as @a run scoreboard players operation @s tempb = @s mzgf
execute  as @a run scoreboard players operation @s tempb /= @s gfrs
execute  as @a run scoreboard players operation @s tempa += @s tempb
execute  as @a run scoreboard players operation @s mzmz = @s tempa

execute  as @a run scoreboard players operation @s tempa = @s fy
execute  as @a run scoreboard players operation @s tempa += @s fya
execute  as @a run scoreboard players operation @s tempa += @s ksfy
execute  as @a run scoreboard players operation @s tempb = @s fygf
execute  as @a run scoreboard players operation @s tempb /= @s gfrs
execute  as @a run scoreboard players operation @s tempa += @s tempb
execute  as @a run scoreboard players operation @s fyfy = @s tempa

execute  as @a run scoreboard players operation @s tempa = @s sb
execute  as @a run scoreboard players operation @s tempa += @s sba
execute  as @a run scoreboard players operation @s tempb = @s sbgf
execute  as @a run scoreboard players operation @s tempb /= @s gfrs
execute  as @a run scoreboard players operation @s tempa += @s tempb
execute  as @a run scoreboard players operation @s sbsb = @s tempa

execute  as @a run scoreboard players operation @s tempa = @s ll2
execute  as @a run scoreboard players operation @s tempa += @s ll2a
execute  as @a run scoreboard players operation @s tempb = @s ll2gf
execute  as @a run scoreboard players operation @s tempb /= @s gfrs
execute  as @a run scoreboard players operation @s tempa += @s tempb
execute  as @a run scoreboard players operation @s ll2ll2 = @s tempa

execute  as @a run scoreboard players operation @s tempa = @s hp2
execute  as @a run scoreboard players operation @s tempa += @s hp2a
execute  as @a run scoreboard players operation @s tempb = @s hp2gf
execute  as @a run scoreboard players operation @s tempb /= @s gfrs
execute  as @a run scoreboard players operation @s tempa += @s tempb
execute  as @a run scoreboard players operation @s hp2hp2 = @s tempa
# 自然恢复也使用最终值，避免装备/丹药加成被遗漏。
execute  as @a run scoreboard players operation @s tempa = @s hx
execute  as @a run scoreboard players operation @s tempa += @s hxa
execute  as @a run scoreboard players operation @s tempb = @s hxgf
execute  as @a run scoreboard players operation @s tempb /= @s gfrs
execute  as @a run scoreboard players operation @s tempa += @s tempb
execute  as @a run scoreboard players operation @s hxhx = @s tempa
execute  as @a run scoreboard players operation @s tempa = @s hl
execute  as @a run scoreboard players operation @s tempa += @s hla
execute  as @a run scoreboard players operation @s tempb = @s hlgf
execute  as @a run scoreboard players operation @s tempb /= @s gfrs
execute  as @a run scoreboard players operation @s tempa += @s tempb
execute  as @a run scoreboard players operation @s hlhl = @s tempa



execute  as @a run scoreboard players reset * tempa
execute  as @a run scoreboard players reset * tempb
