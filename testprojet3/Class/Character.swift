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
    var isAlive = true
    var damage: Int = 0
    var rawHp = 1
    var rawDamage = 0

    
    init(name: String){
        self.characterName = name
    }
    
/* ========== GETTER & SETTER ========== */
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
    func setDamage(damage: Int){
        self.damage = damage
    }
    
    func getIsAlive() -> Bool{
        return isAlive
    }
/* ============================================= */
}
