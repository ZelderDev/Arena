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
        self.damage = rawDamage
    }
    
}
