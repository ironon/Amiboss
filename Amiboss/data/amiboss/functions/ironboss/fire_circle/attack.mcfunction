#built using mc-build (https://github.com/mc-build/mc-build)

execute as @e[type=marker,tag=firecircle] at @s run setblock ~ ~1 ~ fire
schedule function amiboss:ironboss/fire_circle/__generated__/sequence/3 80t replace