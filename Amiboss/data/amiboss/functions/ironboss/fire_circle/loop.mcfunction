#built using mc-build (https://github.com/mc-build/mc-build)

execute positioned ~-1 ~ ~ unless block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["firecircle"]}
execute positioned ~1 ~ ~ unless block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["firecircle"]}
execute positioned ~ ~ ~1 unless block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["firecircle"]}
execute positioned ~ ~ ~-1 unless block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["firecircle"]}
setblock ~ ~1 ~ fire
execute at @s positioned ~ ~1 ~ as @a[distance=0..0.6] run effect give @s instant_damage 0 0 true
summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:sandstone"},Time:-10000000,Motion:[0.0,1.0,0.0]}
scoreboard players remove firecircle bossloops 1
function amiboss:ironboss/fire_circle/loop