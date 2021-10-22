import invincible.mcm

function load_amiboss_dimension {
    <%%
    for (let i=0; i<=2; i++) {
        for (let ji=0; ji<=2; ji++) {
            emit(`setblock ~-${i*48} ~ ~${ji*48} structure_block[mode=load]{name:"amiboss:arena${i}${ji}",posX:-48,posZ:48,rotation:"COUNTERCLOCKWISE_90",mirror:"NONE",mode:"LOAD"}`)
            emit(`fill ~-${i*(48 * 1)} ~-1 ~${ji*(48 * 1)} ~-${(i*48) + 48} ~-1 ~${(ji*48) + 48} smooth_stone replace air`)
          
            emit(`setblock ~-${i*48} ~1 ~${ji*48} redstone_block`)
            emit(`fill ~-${i*(48 * 1)} ~1 ~${ji*(48 * 1)} ~-${(i*48) + 48} ~1 ~${(ji*48) + 48} light[level=15] replace air`)
            emit(`setblock ~-${i*48} ~ ~${ji*48} air`)
            emit(`setblock ~-${i*48} ~1 ~${ji*48} air`)
            
         }   
    }
    %%>
}

function spawn_iron {
    summon giant ~ ~ ~ {ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{Unbreakable:1b,CustomModelData:1}},{},{id:"minecraft:iron_chestplate",Count:1b,tag:{Unbreakable:1b,Enchantments:[{id:"minecraft:protection",lvl:1s}]}},{id:"minecraft:skeleton_skull",Count:1b}],ArmorDropChances:[0.000F,0.085F,0.000F,0.085F],ActiveEffects:[{Id:14b,Amplifier:9b,Duration:10000000,ShowParticles:0b}],Tags:["ironboss", "boss"]}
    execute as @e[type=giant,tag=!invincible] run block {
        makeInvincible @s
    }
}


##Attack 1: 
##Attack 2: 
##Attack 3: 