# bug 修复/补发函数。
# 执行对象一般是临时触发实体或命令执行者 @s。
# 根据剧情进度补发对应护照物品，随后让玩家属性重新校准，并打开属性面板。
# 最后一行 kill @s 会清理执行者；不要直接对玩家执行，除非确认 @s 是临时实体。
execute as @s[scores={jq=1..59},hasitem={item=gold:hz_1,quantity=0}] run give @s gold:hz_1 1 0 {"item_lock":{"mode":"lock_in_inventory"}}
execute as @s[scores={jq=60..},hasitem={item=gold:hz_2,quantity=0}] run give @s gold:hz_2 1 0 {"item_lock":{"mode":"lock_in_inventory"}}
# 补发完成后重新计算境界、装备、奇物等带来的属性。
tag @s add 属性校准
# 打开属性总览面板，方便确认修复结果。
scoreboard players set @s xqcd 1
# 清理触发本函数的实体。
kill @s 
