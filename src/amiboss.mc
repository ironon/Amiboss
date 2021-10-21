function load_amiboss_dimension {
    <%%
    for (let i=0; i<=2; i++) {
        for (let ji=0; ji<=2; ji++) {
            emit(`setblock ~-${i*48} ~ ~${ji*48} structure_block[mode=load]{name:"amiboss:arena${i}${ji}",rotation:"NONE",mirror:"NONE",mode:"LOAD"}`)
            emit(`setblock ~-${i*48} ~1 ~${ji*48} redstone_block`)
            emit(`setblock ~-${i*48} ~ ~${ji*48} air`)
            emit(`setblock ~-${i*48} ~1 ~${ji*48} air`)
         }   
    }
    %%>
}


##Attack 1: 
##Attack 2: 
##Attack 3: 