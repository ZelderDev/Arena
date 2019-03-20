//
//  Colossus.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 15/02/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation

class Colossus: Character{
    
    
    override init(name: String){
        super.init(name: name)
        //self.characterName = name
        self.specializationName = "Colosse"
        self.rawHp = 200
        self.healthPoints = rawHp
        self.itemSelector = [ColossusItems.hammer.rawValue, ColossusItems.shield.rawValue]
        self.items = ["masse": 5, "bouclier":9]
        self.damage = items[itemSelector[0]]!  
        self.itemName = itemSelector[0]
        self.dpsOrHealer = true                 //dps
    }
    
    enum ColossusItems: String{
        case hammer = "masse"
        case shield = "bouclier"
    }
    
}
