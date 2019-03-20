//
//  Ninja.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 04/03/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation

class Ninja: Character{
    
    
    override init(name: String){
        super.init(name: name)
        //self.characterName = name
        self.specializationName = "Ninja"
        self.rawHp = 110
        self.healthPoints = rawHp
        self.itemSelector = [NinjaItems.dagger.rawValue, NinjaItems.shuriken.rawValue, NinjaItems.nunchaku.rawValue]
        self.items = ["poingnard":10, "shuriken":12, "ninchaku": 15]
        self.damage = items[itemSelector[0]]!
        self.itemName = itemSelector[0]
        self.dpsOrHealer = true                 //dps
    }
    
    enum NinjaItems: String{
        case dagger = "poingnard"
        case shuriken = "shuriken"
        case nunchaku = "ninchaku"
    }
    
    
    
    
    
}
