//
//  Priest.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 15/02/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation

class Priest: Healer{
    
    override init(name: String){
        super.init(name: name)
        //self.characterName = name
        self.specializationName = "Prêtre"
        self.rawHp = 80
        self.rawDamage = 10
        self.healthPoints = rawHp
        self.damage = rawDamage
    }
}

