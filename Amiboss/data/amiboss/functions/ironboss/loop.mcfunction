#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add @s bossloops 1
execute if score @s bossloops matches 2400.. run scoreboard players set @s bossloops 0
execute run function amiboss:ironboss/__generated__/block/2
execute if score @s bossloops matches 0..200 run function amiboss:ironboss/__generated__/block/3
execute if score @s bossloops matches 200..400 run function amiboss:ironboss/__generated__/block/4
execute if score @s bossloops matches 400..600 run function amiboss:ironboss/__generated__/block/5
execute if score @s bossloops matches 600..800 run function amiboss:ironboss/__generated__/block/6
schedule function amiboss:ironboss/__generated__/sequence/1 20t replace