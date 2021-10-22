#built using mc-build (https://github.com/mc-build/mc-build)

kill @e[type=marker,tag=old]
execute positioned ~-1 ~ ~ unless block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["groundwave"]}
execute positioned ~1 ~ ~ unless block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["groundwave"]}
execute positioned ~ ~ ~1 unless block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["groundwave"]}
execute positioned ~ ~ ~-1 unless block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["groundwave"]}
setblock ~ ~ ~ air
execute at @s positioned ~ ~1 ~ as @a[distance=0..0.6] run effect give @s instant_damage 0 0 true
summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:sandstone"},Time:-10000000,Motion:[0.0,1.0,0.0]}
tag @s add old
scoreboard players remove groundwave bossloops 1
schedule function amiboss:ironboss/groundwave/__generated__/sequence/5 20t replace