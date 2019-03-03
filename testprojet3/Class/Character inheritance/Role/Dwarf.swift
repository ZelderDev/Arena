//
//  Dwarf.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 15/02/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation

class Dwarf: DamageDealer{
    
    
    
    override init(name: String){
        super.init(name: name)
        //self.characterName = name
        self.specializationName = "Nain"
        self.rawHp = 50
        self.rawDamage = 20
        self.healthPoints = rawHp
        self.itemSelector = [DwarfItems.crossbow.rawValue, DwarfItems.rifle.rawValue, DwarfItems.knife.rawValue, DwarfItems.hatchet.rawValue]
        self.items = ["arbalète":25, "fusil":30, "couteau":18, "hachette": 20]
        self.damage = items[itemSelector[0]]!   
        self.itemName = itemSelector[0]
    }
    
    enum DwarfItems: String{
        case crossbow = "arbalète"
        case rifle = "fusil"
        case knife = "couteau"
        case hatchet = "hachette"
    }
}
