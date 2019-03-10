//
//  Display.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 17/02/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation

class Picks{
    var team1: Team
    var team2: Team
    var playerName1: String = ""
    var playerName2: String = ""
    static var arrayName: [String] = ["Toto"]

    
    init(team1: Team, team2: Team){
        self.team1 = team1
        self.team2 = team2
//        self.playerName1 = team1.getPlayerName()
//        self.playerName2 = team2.getPlayerName()
    }
    
    //Demande le nom des joueurs
    func askPlayerName(){
        team1.setPlayerName()
        team2.setPlayerName()
    }
    
    func pickCharacter(team: Team){
        var input: String?
        var nameCharacter: String = ""
        var picking: Int = 0
        var nameIsVailable: Bool = false
        
        /* Demander numéro du héro */
        repeat{
            print("\(team.getPlayerName()), choisissez un héro:")
            input =  readLine()
            if let input = input{
                picking = (input as NSString).integerValue
            }
        }while (picking < 1  || picking > 5) //choix du pick de 1 à 5.
        
        /* Demander le nom du héro */
        repeat{
            print("Choisir le nom de ce héro")
            input = readLine()            //entré au clavier
            if let input = input{         //ouverture de l'optionnel
                nameCharacter = input     //affectation de la valeur de l'optionnel
            }
    
            if nameCharacter != ""{
                nameIsVailable = checkNameCharacter(name: nameCharacter)
            }
            
        }while((nameCharacter == "") || (nameIsVailable == false)) //tant que le nom n'est pas dispo, on boucle
        
        /* Création et ajout du personnage à l'équipe */
        makeCharacter(team: team, characterName: nameCharacter, picking: picking)
    }
    
    //Vérifier si le nom de personnage est unique
    func checkNameCharacter(name: String) -> Bool{
        var vailable: Bool = false
        
        for index in Picks.arrayName{     //check tout le tableau à la recherche de doublon
            if(index == name){            //si doublon alors redemande un autre nom
                print("Le nom \(name) est déjà pris")
                vailable = false
                return vailable
            }else{
                vailable = true                //le nom est disponible
            }
        }
        Picks.arrayName.append(name) //ajout le nouveau à la bdd de noms
        return vailable
    }
    
    func makeCharacter(team: Team, characterName: String, picking: Int){
        switch picking{
        case 1:
            team.addCharacter(character: Warrior(name: characterName))
        case 2:
            team.addCharacter(character: Priest(name: characterName))
        case 3:
            team.addCharacter(character: Colossus(name: characterName))
        case 4:
            team.addCharacter(character: Dwarf(name: characterName))
        case 5:
            team.addCharacter(character: Ninja(name: characterName))
        default:
            print("Erreur - Function - makeCharacter")
        }
    }
    
    
    func pickPhase(team1: Team, team2: Team){
        var pickTeam1: Int = 3
        var pickTeam2: Int = 3
        var turn: Bool = true
        var indexPick = 2
        var selectorP1 = ""
        var selectorP2 = ""
        
        //Tour par tour
        //Ordre de pick p1, p2, p2, p1, p1, p2
        //le first pick n'a pas le last pick
        for _ in 1...6{     //nombre de pick total
            
            if indexPick > 2 {
                turn = !turn
                indexPick = 1
            }
            
            switch turn{
                case true:
                    selectorP1 = "  -> "
                    selectorP2 = "     "
                    displayPickPhase(selectorP1: selectorP1, selectorP2: selectorP2)
                    pickCharacter(team: team1)
                    pickTeam1 -= 1
                case false:
                    selectorP1 = "     "
                    selectorP2 = "  -> "
                    displayPickPhase(selectorP1: selectorP1, selectorP2: selectorP2)
                    pickCharacter(team: team2)
                    pickTeam2 -= 1
            }
            indexPick += 1
        }
        resumePick()
    }
    
    func displayPickPhase(selectorP1: String, selectorP2: String){
        var bloc1: String
        var bloc2: String
        var arrayIndicatorPlayer1: [String] = ["Slot1","Slot2","Slot3"]
        var arrayIndicatorPlayer2: [String] = ["Slot1","Slot2","Slot3"]
        var lengthArrayTeam1: Int
        var lengthArrayTeam2: Int
        var currentPickPlayer1: String = ""
        var currentPickPlayer2: String = ""
        
        
        //FORMAT PICK PLAYER 1
        lengthArrayTeam1 = team1.arrayCharac.count
        if(lengthArrayTeam1 > 0){
            for index in 0...(lengthArrayTeam1-1){
                arrayIndicatorPlayer1[index] = team1.getspecializationName(index: index)
            }
        }
        for specializationName in arrayIndicatorPlayer1{
            currentPickPlayer1 += specializationName + " "
        }
        
        //FORMAT PICK PLAYER 2
        lengthArrayTeam2 = team2.arrayCharac.count
        if(lengthArrayTeam2 > 0){
            for index in 0...(lengthArrayTeam2-1){
                arrayIndicatorPlayer2[index] = team2.getspecializationName(index: index)
            }
        }
        for specializationName in arrayIndicatorPlayer2{
            currentPickPlayer2 += specializationName + " "
        }
        
        //FORMAT PICK PLAYER 1 PLAYER 2
        bloc2 = selectorP1
            + "Equipe de \(team1.getPlayerName()), [\(currentPickPlayer1)]"
            + "\n"
            + selectorP2
            + "Equipe de \(team2.getPlayerName()), [\(currentPickPlayer2)]"
        
        //DISPLAY CURRENT PICK PLAYER1  & PLAYER2
        print("\n\n\n\n\n\n\n\n\n")
        print(" * * * * * * PHASE DE PICK * * * * * * * ")
        print("             Liste des héros             ")
        print("     Roles     | Pv  |  Items   | Dégats ")
        print("  1.Combattant | 100 |  épée    |  10    ")
        print("  2.Prêtre     | 80  |  bâton   |  10    ")
        print("  3.Colosse    | 200 |  masse   |  5     ")
        print("  4.Nain       | 50  |  arbalète|  20    ")
        print("  5.Ninja      | 10  | poignard |  10    ")
        print("  ------------------------------------   ")
        print(bloc2)
    }
    
    //RESUME THE DETAILS OF THE PICKS
    func resumePick(){
        var line1: String = ""
        var line2: String = ""
        
        line1 = cell(str: team1.getPlayerName(), format: .medium)
              + cell(str: team2.getPlayerName(), format: .medium)


        for index in 0...2{
        line2 += "  "
               + cell(str: (team1.getCharacter(index: index).getCharacterName())
               + "(" + team1.getspecializationName(index: index)
               + ")", format: .medium)
               + cell(str: (team2.getCharacter(index: index).getCharacterName())
               + "(" + team2.getspecializationName(index: index)
               + ")", format: .medium) + "\n"
        }
        
        print("\n\n\n\n\n\n\n\n\n")
        print("* * * * RESUMÉ DES EQUIPES * * * *")
        print(line1)
        print(line2)
    }
    
    func reset(){
        
    }
}
