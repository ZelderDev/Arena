//
//  Character.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 15/02/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation


class Character{
    var characterName: String = "Unnamed"
    var specializationName: String = "None"
    var healthPoints: Int = 0
    var isAlive = true                  //Given the state of the character, dead or alive
    var damage: Int = 0
    var rawHp = 1                       //Allows you to set a maximum health point
    var rawDamage = 0
    var itemName = ""
    var items: [String:Int] = [:]       //Items specific to each character
    var itemSelector: [String] = []     //
    var dpsOrHealer = true              //true for dps & false for healer

    
    var healingTaken = 0
    var healingDone = 0
    var damageTaken = 0
    var damageDone = 0
    
    init(name: String){
        self.characterName = name
    }
    
    
    
/* ========== GETTER & SETTER ========== */
    
    //GET - Lets you know if the character is a dps or a healer
    func getDpsOrHealer() -> Bool{
        return dpsOrHealer
    }
    
    //GET & SET healingTaken
    func getHealingTaken() -> Int{
        return healingTaken
    }
    func setHealingTaken(heal: Int){
        self.healingTaken += heal
    }
    
    //GET & SET healingDone
    func getHealingDone() -> Int{
        return healingDone
    }
    func setHealingDone(heal: Int){
        self.healingDone += heal
    }
    
    //GET & SET damage taken
    func getDamageTaken() -> Int{
        return damageTaken
    }
    func setDamageTaken(damage: Int){
        self.damageTaken += damage
    }
    
    //GET & SET damage done
    func getDamageDone() -> Int{
        return damageDone
    }
    func setDamageDone(damage: Int){
        self.damageDone += damage
    }
    
    //GET & SET characterName
    func getCharacterName() -> String{
        return characterName
    }
    func setCharacterName(name: String){
        self.characterName = name
    }
    
    //GET & SET  healthPoints
    func getHealthPoints() -> Int{
        return healthPoints
    }
    func setHealthPoints(hp: Int){
        self.healthPoints = hp
        if(healthPoints > rawHp){
            self.healthPoints = rawHp
        }else if(healthPoints <= 0){
            self.healthPoints = 0
            print("\(getCharacterName()) est MORT(E)!")
            isAlive = false
        }
    }
    
    //GET & SET specializationName
    func getSpecializationName() -> String{
        return specializationName
    }
    func setSpecializationName(name: String){
        self.specializationName = name
    }
    
    //GET & SET  damage
    func getDamage() -> Int{
        return damage
    }
    func setDamage(itemSelector: String){
        self.damage = items[itemSelector]!
    }
    
    //GET if the character is alive
    func getIsAlive() -> Bool{
        return isAlive
    }
    
    //Return the array enum.String for Random
    func getItemSelector() -> [String]{
        return itemSelector
    }
    
    func setItemName(itemName: String){
        self.itemName = itemName
    }
    func getItemName() -> String {
        return itemName
    }
    
/* ============================================= */
}
