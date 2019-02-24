//
//  Colossus.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 15/02/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation

class Colossus: DamageDealer{
    
    override init(name: String){
        super.init(name: name)
        //self.characterName = name
        self.specializationName = "Colosse"
        self.rawHp = 200
        self.rawDamage = 5
        self.healthPoints = rawHp
        self.damage = rawDamage
    }
    
    
}
