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
        self.itemSelector = [PriestItems.stick.rawValue, PriestItems.book.rawValue, PriestItems.wand.rawValue]
        self.items = ["bâton":15, "livre":12, "baguette":10]
        self.damage = items[itemSelector[0]]!   
        self.itemName = itemSelector[0] 
    }
    
    enum PriestItems: String{
        case stick = "bâton"
        case book = "livre"
        case wand = "baguette"
    }

}

