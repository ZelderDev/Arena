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
        self.rawDamage = 10
        self.healthPoints = rawHp
        self.damage = rawDamage

    }
    

}

