#built using mc-build (https://github.com/mc-build/mc-build)

execute as @a at @s facing entity @a[type=giant,tag=ironboss] feet run function amiboss:ironboss/energy_blast/raycast
execute as @a[tag=unsafe] run function amiboss:ironboss/groundwave/energy_blast/__generated__/block/9