//
//  Warrior.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 15/02/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation

class Warrior: DamageDealer{
    

    override init(name: String){
        super.init(name: name)
        //self.characterName = name
        self.specializationName = "Combattant"
        self.rawHp = 100
        self.healthPoints = rawHp
        self.itemSelector = [WarriorItems.sword.rawValue, WarriorItems.axe.rawValue, WarriorItems.hammer.rawValue, WarriorItems.dolk.rawValue]
        self.items = ["épée":10, "hache":15, "masse": 11, "dague":9]
        self.damage = items[itemSelector[0]]!   //épée
        self.itemName = itemSelector[0]         //épée
    }
    
    enum WarriorItems: String{
        case sword = "épée"
        case axe = "hache"
        case hammer = "masse"
        case dolk = "dague"
    }
    

    
    
    
}

