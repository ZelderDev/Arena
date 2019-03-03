//
//  Random.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 28/02/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation

//tableau d'item du perso
func random(character: Character){
    var randChest: Int
    var randItem: Int
    var item: String
    var itemSelector = character.getItemSelector()
    var newDamage: Int
    var oldDamage: Int
    
    randChest = Int.random(in: 1...2) //50% de chance de loot un coffre
    
    if randChest == 1{      //si il y a un coffre
        oldDamage = character.getDamage()
        
        randItem = Int.random(in: 0...itemSelector.count-1) //on lance en rand parmi les items que le perso peut porter
        item = itemSelector[randItem]
        character.setDamage(itemSelector: item) //affectation des dégats de l'item aux dégats du perso
        newDamage = character.getDamage()
        character.setItemName(itemName: item)   //nom du nouvel l'item
        
        print("\n\n\n\n\n\n\n\n\n\n\n\n\n")
        print("UN COFFRE TOMBE DU CIEL ET LAISSE ECHAPPER QUELQUE CHOSE")
        sleep(1)
        print("\(character.getCharacterName()) s'équipe du nouvel item: \(item),")
        print("son attaque passe de \(oldDamage) à \(newDamage)")
        sleep(3)
    }
}

