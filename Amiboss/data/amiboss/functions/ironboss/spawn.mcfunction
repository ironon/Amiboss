#built using mc-build (https://github.com/mc-build/mc-build)

summon giant ~ ~ ~ {AbsorptionAmount:9999999f,Tags:["ironboss","boss"],ArmorItems:[{id:'minecraft:leather_boots',Count:1b,tag:{Unbreakable:1b,CustomModelData:1}},{},{id:'minecraft:iron_chestplate',Count:1b,tag:{Unbreakable:1b,Enchantments:[{id:'minecraft:protection',lvl:1s}]}},{id:'minecraft:skeleton_skull',Count:1b}],ArmorDropChances:[0.085F,0.085F,0.085F,0.085F],ActiveEffects:[{Id:14b,Amplifier:9b,Duration:10000000,ShowParticles:0b}]}
summon zombie ~ ~8 ~ {NoGravity:1b,Silent:1b,NoAI:1b,Tags:["ironbosshead"],ArmorItems:[{},{},{},{id:"minecraft:command_block",Count:1b,tag:{CustomModelData:2}}],ActiveEffects:[{Id:11b,Amplifier:255b,Duration:1000000,ShowParticles:0b},{Id:14b,Amplifier:1b,Duration:1000000,ShowParticles:0b}]}
execute as @e[type=giant,tag=!invincible] run function amiboss:ironboss/__generated__/block/0
summon marker ~ ~ ~ {Tags:["firecircle"]}
scoreboard players set firecircle bossloops 4
execute as @e[type=marker,tag=firecircle,tag=!grounded] at @s run function amiboss:ironboss/__generated__/block/1