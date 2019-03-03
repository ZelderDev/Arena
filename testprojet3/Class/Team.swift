//
//  Team.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 17/02/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation

class Team{
    var playerName: String = "Unnamed"
    var arrayCharac: [Character] = []
    static var checkNamePlayer:[String] = ["Nono","Robert"]

    
    init(name: String){
        self.playerName = name
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
        if(getCharacter(index: 0).getIsAlive() == false && getCharacter(index: 1).getIsAlive() == false && getCharacter(index: 2).getIsAlive() == false){
            return false
        }else{
            return true
        }
    }
    
}
