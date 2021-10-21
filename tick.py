import beet
import onyx.selector
import onyx.commands as cm
import onyx.selector
import onyx.registries
import onyx.split_registries
import onyx.scoreboard as sc
import requests
import nbtlib
import onyx
import dims
from onyx import *

class Amiboss(onyx.DataPack):
    def __init__(self):
        super().__init__("Amiboss")
        ##REGISTERING
        amibossD = Amiboss.dimension(self, 'amiboss:amiboss', dims.amiboss)
        self.function("amiboss:function", self.function_obj)
        self.function("amiboss:load_amiboss_dimension", self.load_amiboss_dimension)
        self.generate(print_output_path=True)
    def load_structure(self, x,y,z, struc):
        cm.setblock(Vector3("~",x,y,z).build(),Block(type=onyx.split_registries.block.chest,block_states={},nbt=Compound({'Items:[{Slot:0b,id:"bedrock",Count:1b}]'}).parse()))
    def function_obj(self):
        onyx.commands.say("Hello, World!")

    def load_amiboss_dimension(self):
        currentPos = Vector3('~',0,0,0)
        onyx.commands.forceload.add(Vector2("~", 0, 0).build(),Vector2("~",144, -144).build())
        self.load_structure(currentPos.x, currentPos.y, currentPos.z, "d")
Amiboss()