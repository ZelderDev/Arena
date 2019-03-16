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
    
    //STATISTICS healing taken by the team
    func getTeamHealingTaken() -> Int{
        for character in arrayCharac {
            self.teamHealingTaken += character.getHealingTaken()
        }
        return teamHealingTaken
    }
    
    //STATISTICS healing done by the team
    func getTeamHealingDone() -> Int{
        for character in arrayCharac {
            self.teamHealingDone += character.getHealingDone()
        }
        return teamHealingDone
    }
    
    //STATISTICS damage taken by the team
    func getTeamDamageTaken() -> Int {
        for character in arrayCharac {
            self.teamDamageTaken += character.getDamageTaken()
        }
        return teamDamageTaken
    }
    
    //STATISTICS Damage done by the team
    func getTeamDamageDone() -> Int {
        for character in arrayCharac {
            self.teamDamageDone += character.getDamageDone()
        }
        return teamDamageDone
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
        
        for index in Team.checkNamePlayer{              //check tout le tableau à la recherche de doublon
            if(index == name){                          //si doublon alors redemande un autre nom
                print("Le nom \(name) est déjà pris")   
                vailable = false
                return vailable
            }else{
                vailable = true                         //le nom est disponible
            }
        }
        Team.checkNamePlayer.append(name)       //ajout le nouveau à la bdd de noms
        return vailable
    }
    
    func getPlayerName() -> String{
        return playerName
    }
    
    /* Add a new hero to the team */
    func addCharacter(character: Character){        //nouveau champion dans l'équipe
        if arrayCharac.count < 3 {                  //si l'équipe n'est pas pleine
            self.arrayCharac.append(character)      //on ajoute le héro à l'équipe
        }else{
            print("Impossible d'ajouter un autre héro") //sinon erreur
        }
    }
    
    
    func getCharacter(index: Int) -> Character{
        return arrayCharac[index]   //return le champion voulu
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
