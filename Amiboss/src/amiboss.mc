import invincible.mcm
import ironminion.mcm
function load_amiboss_dimension {
    <%%
    for (let i=0; i<=2; i++) {
        for (let ji=0; ji<=2; ji++) {
            emit(`forceload add ~ ~ ~-96 ~96`)
            emit(`setblock ~-${i*48} ~ ~${ji*48} structure_block[mode=load]{name:"amiboss:arena${i}${ji}",posX:-48,posZ:48,rotation:"COUNTERCLOCKWISE_90",mirror:"NONE",mode:"LOAD"}`)
            emit(`fill ~-${i*(48 * 1)} ~-1 ~${ji*(48 * 1)} ~-${(i*48) + 48} ~-1 ~${(ji*48) + 48} sandstone replace air`)
          
            emit(`setblock ~-${i*48} ~1 ~${ji*48} redstone_block`)
            emit(`fill ~-${i*(48 * 1)} ~1 ~${ji*(48 * 1)} ~-${(i*48) + 48} ~1 ~${(ji*48) + 48} light[level=15] replace air`)
            emit(`setblock ~-${i*48} ~ ~${ji*48} air`)
            emit(`setblock ~-${i*48} ~1 ~${ji*48} air`)
            emit(`forceload remove ~ ~ ~-96 ~96`)
         }   
    }
    %%>
}




function tick {
  execute if score groundwave cooldowns matches 1.. run scoreboard players remove groundwave cooldowns 1
execute if score spawn_minions cooldowns matches 1.. run scoreboard players remove spawn_minions cooldowns 1
}
dir ironboss {

    function spawn {
        summon giant ~ ~ ~ {AbsorptionAmount:9999999f,Tags:["ironboss","boss"],ArmorItems:[{id:'minecraft:leather_boots',Count:1b,tag:{Unbreakable:1b,CustomModelData:1}},{},{id:'minecraft:iron_chestplate',Count:1b,tag:{Unbreakable:1b,Enchantments:[{id:'minecraft:protection',lvl:1s}]}},{id:'minecraft:skeleton_skull',Count:1b}],ArmorDropChances:[0.085F,0.085F,0.085F,0.085F],ActiveEffects:[{Id:14b,Amplifier:9b,Duration:10000000,ShowParticles:0b}]}
        summon zombie ~ ~8 ~ {NoGravity:1b,Silent:1b,NoAI:1b,Tags:["ironbosshead"],ArmorItems:[{},{},{},{id:"minecraft:command_block",Count:1b,tag:{CustomModelData:2}}],ActiveEffects:[{Id:11b,Amplifier:255b,Duration:1000000,ShowParticles:0b},{Id:14b,Amplifier:1b,Duration:1000000,ShowParticles:0b}]}
        execute as @e[type=giant,tag=!invincible] run block {
            makeInvincible @s
        }
        summon marker ~ ~ ~ {Tags:["firecircle"]}
        scoreboard players set firecircle bossloops 4
        execute as @e[type=marker,tag=firecircle,tag=!grounded] at @s run block {
            function amiboss:ironboss/gotoground
            
        }

    }
    
  function load {
    scoreboard objectives add bosshealth dummy
    scoreboard objectives add bossloops dummy
    scoreboard objectives add cooldowns dummy
    bossbar add amiboss:ironboss "IronGriefer"
    
    
  }

  function loop {
    scoreboard players add @s bossloops 1
    execute if score @s bossloops matches 2400.. run scoreboard players set @s bossloops 0
    execute run block {
        #Cosmetic stuff
        particle item command_block{CustomModelData:1} ~ ~8 ~ 4 4 4 1 100
        execute as @e[type=zombie,tag=ironbosshead] at @s facing entity @p eyes run tp ~ ~ ~
    }
    #first 45 seconds
    execute if score @s bossloops matches 0..200 run block {
      function amiboss:ironboss/groundwave/attack
    } 
    execute if score @s bossloops matches 200..400 run block {
        function amiboss:ironboss/minion_spawn/attack
    } 
    execute if score @s bossloops matches 400..600 run block {
        function amiboss:ironboss/fire_circle/attack
    } 
    execute if score @s bossloops matches 600..800 run block {
        function amiboss:ironboss/fire_shot/attack
    } 
    sequence {
      delay 1s
      function amiboss:ironboss/loop
    }
    
  }

  
  
  function gotoground {
    tp @s ~ ~-0.5 ~
    tag @s add grounded
    execute at @s if block ~ ~ ~ #amiboss:air run function amiboss:ironboss/gotoground
  }
  function createwalls {
    execute as @e[type=marker,tag=bosswall] at @s facing entity @e[type=giant,tag=ironboss,sort=nearest,limit=1] feet run fill ^-2 ^-1 ^ ^2 ^3 ^ stone_bricks
  }
  
  dir fire_shot {
    function attack {
        execute at @s anchored feet facing entity @p feet run block {
            name loop
            fill ^-1 ^ ^-1 ^1 ^ ^0 fire replace #amiboss:air
            execute positioned ^ ^ ^0.1 if block ~ ~ ~ air run function amiboss:ironboss/fireshot/attack
        }
    }
  }
  #------------------------------------------------------
dir fire_circle {

    function attack {

    sequence {
        execute as @e[type=marker,tag=firecircle] at @s run setblock ~ ~1 ~ fire
        delay 4s
        execute as @e[type=marker,tag=firecircle] at @s run setblock ~ ~1 ~ air
    }
  }
  function loop{    
      execute positioned ~-1 ~ ~ unless block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["firecircle"]}
      execute positioned ~1 ~ ~ unless block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["firecircle"]}
      execute positioned ~ ~ ~1 unless block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["firecircle"]}
      execute positioned ~ ~ ~-1 unless block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["firecircle"]}
      setblock ~ ~1 ~ fire
      execute at @s positioned ~ ~1 ~ as @a[distance=0..0.6] run effect give @s instant_damage 0 0 true
      summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:sandstone"},Time:-10000000,Motion:[0.0,1.0,0.0]}     
      scoreboard players remove firecircle bossloops 1
      function amiboss:ironboss/fire_circle/loop
    }
  }
  dir minion_spawn {
    function attack {
        execute if score spawn_minions cooldowns matches ..0 run block {
            scoreboard players set spawn_minions cooldowns 100
            ironminion ~ ~ ~
            ironminion ~ ~ ~
            ironminion ~ ~ ~
            ironminion ~ ~ ~
            ironminion ~ ~ ~
            ironminion ~ ~ ~
            ironminion ~ ~ ~
            spreadplayers ~ ~ 100 1 false @e[type=zombie,tag=ironminion]
        }
    }
  }
  dir groundwave {
    function attack {
    execute if score groundwave cooldowns matches ..0 run block {
      scoreboard players set groundwave bossloops 40
      scoreboard players set groundwave cooldowns 40
      summon marker ~ ~ ~ {Tags:["groundwave"]}
      execute as @e[type=marker,tag=groundwave,tag=!grounded] at @s run function amiboss:ironboss/gotoground
      execute as @e[type=marker,tag=groundwave,tag=!grounded] at @s run function amiboss:ironboss/groundwave/attack_2
  }
  }
  
  function attack_2 {
    kill @e[type=marker,tag=old]
    sequence {
      execute positioned ~-1 ~ ~ unless block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["groundwave"]}
      execute positioned ~1 ~ ~ unless block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["groundwave"]}
      execute positioned ~ ~ ~1 unless block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["groundwave"]}
      execute positioned ~ ~ ~-1 unless block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["groundwave"]}
      setblock ~ ~ ~ air
      execute at @s positioned ~ ~1 ~ as @a[distance=0..0.6] run effect give @s instant_damage 0 0 true
      summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:sandstone"},Time:-10000000,Motion:[0.0,1.0,0.0]}
      tag @s add old
      scoreboard players remove groundwave bossloops 1
      delay 1s
      execute if score groundwave bossloops matches 1.. as @e[type=marker,tag=groundwave,tag=!old] at @s run function amiboss:ironboss/groundwave/attack_2
    }
  }
  dir energy_blast {
    function attack {
      sequence {
        say Insert Charging Up Sound Effect Here!
        say Insert Particle Effect
        function amiboss:ironboss/createwalls
        delay 5s
        execute as @a at @s facing entity @a[type=giant,tag=ironboss] feet run function amiboss:ironboss/energy_blast/raycast
        execute as @a[tag=unsafe] run block {
          effect give @s instant_damage 0 2 true
          tag @s remove unsafe
        }
        
      }

    }
    function raycast {
      -
      execute positioned ^ ^ ^0.1 if entity @e[type=giant,tag=ironboss,dx=0] run block {
        tag @s add unsafe
      }
      execute positioned ^ ^ ^0.1 if block air run function amiboss:ironboss/energy_blast/raycast
      
    }
  }
  }
}

##Attack 1: groundwave
##LETHAL attack: Energy Blast
##Attack 2: minion spawn
##Attack 3: fire circle
##Attack 4: fire shot