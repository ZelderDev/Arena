//
//  Team.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 17/02/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation

//The team has a name and 3 characters
class Team{
    var playerName: String = "Unnamed"
    var arrayCharac: [Character] = []
    static var checkNamePlayer:[String] = ["Nono","Robert"]

    var teamHealingTaken = 0
    var teamHealingDone = 0
    var teamDamageTaken = 0
    var teamDamageDone = 0
    
    init(name: String){
        self.playerName = name
    }
    
    //STATISTICS  Healing taken by the team
    func getTeamHealingTaken() -> Int{
        return teamHealingTaken
    }
    func setTeamHealingTaken(){
        self.teamHealingTaken = 0
        for character in arrayCharac {
            self.teamHealingTaken += character.getHealingTaken()
        }
    }
    
    //STATISTICS - Get & Set - healing done by the team
    func getTeamHealingDone() -> Int{
        return teamHealingDone
    }
    func setTeamHealingDone(){
        self.teamHealingDone = 0
        for character in arrayCharac {
            self.teamHealingDone += character.getHealingDone()
            //print(self.teamHealingDone)
        }
    }
    
    //STATISTICS damage taken by the team
    func getTeamDamageTaken() -> Int {
        return teamDamageTaken
    }
    func setTeamDamageTaken(){
        self.teamDamageTaken = 0
        for character in arrayCharac {
            self.teamDamageTaken += character.getDamageTaken()
        }
    }
    
    //STATISTICS Damage done by the team
    func getTeamDamageDone() -> Int {
        return teamDamageDone
    }
    func setTeamDamageDone(){
        self.teamDamageDone = 0
        for character in arrayCharac {
            self.teamDamageDone += character.getDamageDone()
        }
    }
    
    /* PLAYER NAME */
    func setPlayerName(){
        var name: String = ""
        var nameIsVailable: Bool = false

        repeat{
            print("\(playerName) entrez votre nom:")
            let input = readLine()
            if let input = input{
                name = input
            }
            if(name == ""){
                print("Erreur")
            }else{
                nameIsVailable = checkNamePlayer(name: name)
            }
        }while((name == "") || (nameIsVailable == false))
        
        self.playerName = name
    }

    //Check if the name is available
    func checkNamePlayer(name: String) -> Bool{
        var vailable: Bool = true
        
        for index in Team.checkNamePlayer{              //check array for duplicate
            if(index == name){                          //give a other name
                print("Le nom \(name) est déjà pris")   
                vailable = false
                return vailable
            }else{
                vailable = true                         //this name is available
            }
        }
        Team.checkNamePlayer.append(name)       //add the name at the database
        return vailable
    }
    
    func getPlayerName() -> String{
        return playerName
    }
    
    /* Add a new hero to the team */
    func addCharacter(character: Character){
        if arrayCharac.count < 3 {                  //if the team is not full
            self.arrayCharac.append(character)      //add this character to the team
        }else{
            print("Impossible d'ajouter un autre héro")
        }
    }
    
    
    func getCharacter(index: Int) -> Character{
        return arrayCharac[index]   //return the character at this index
    }
    
    func getCharacterName(index: Int) -> String{
        return arrayCharac[index].getCharacterName()
    }
    
    func getspecializationName(index: Int) -> String{
        return arrayCharac[index].getSpecializationName()
    }
    
    func teamIsAlive() -> Bool{
        if(getCharacter(index: 0).getIsAlive() == false && getCharacter(index: 1).getIsAlive() == false && getCharacter(index: 2).getIsAlive() == false ){
            return false
        }else{
            return true
        }
    }
    
}
