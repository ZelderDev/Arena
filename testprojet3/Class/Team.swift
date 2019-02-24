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
    
    init(name: String){
        self.playerName = name
    }
    
    /* PLAYER NAME */
    func setPayerName(){
        print("\(playerName) entrez votre nom:")
        let input = readLine()
        if let input = input{
            self.playerName  = input
        }
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
    
    func teamIsAlive() -> Bool{
        if(getCharacter(index: 0).getIsAlive() == false && getCharacter(index: 1).getIsAlive() == false && getCharacter(index: 1).getIsAlive() == false){
            return false
        }else{
            return true
        }
    }
    
}
