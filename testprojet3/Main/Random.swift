//
//  Random.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 28/02/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation

//Back to the game
func backToTheGame(){
    print("RETOUR À LA PARTIE, veuillez patienter", terminator:" ")
    for _ in 1...3{
        print(".", terminator:"")
        sleep(1)
    }
    print("\n")
}
//Manage the random appearance of a chest during the combat phase
func random(character: Character){
    var randChest: Int
    var randItem: Int
    var item: String
    var itemSelector = character.getItemSelector()
    var newDamage: Int
    var oldDamage: Int
    
    randChest = Int.random(in: 1...3) //33,33% chance to loot a chest
    
    if randChest == 1{      //if there is a chest
        oldDamage = character.getDamage()
        
        randItem = Int.random(in: 0...itemSelector.count-1)     //Randomly selects an item in the character item array
        item = itemSelector[randItem]
        character.setDamage(itemSelector: item) //Assignment of the damage of the item to the damage of the perso
        newDamage = character.getDamage()
        character.setItemName(itemName: item)   //nom du nouvel l'item
        
        print("\n\n\n\n\n\n\n\n\n\n\n\n\n")
        print("UN COFFRE TOMBE DU CIEL ET LAISSE ECHAPPER QUELQUE CHOSE")
        sleep(1)
        print("        Nom de l'item : \(item.uppercased())")
        print("\(character.getCharacterName()) s'équipe du nouvel item: \(item),")
        print("L'attaque de \(character.getCharacterName()) passe de \(oldDamage) à \(newDamage)")
        sleep(1)
        backToTheGame()
    }
    

}

