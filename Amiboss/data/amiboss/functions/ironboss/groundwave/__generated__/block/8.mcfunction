#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players set groundwave bossloops 40
scoreboard players set groundwave cooldowns 40
summon marker ~ ~ ~ {Tags:["groundwave"]}
execute as @e[type=marker,tag=groundwave,tag=!grounded] at @s run function amiboss:ironboss/gotoground
execute as @e[type=marker,tag=groundwave,tag=!grounded] at @s run function amiboss:ironboss/groundwave/attack_2