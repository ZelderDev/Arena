//
//  Display.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 17/02/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation

class Display{
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
        team1.setPayerName()
        team2.setPayerName()
    }
    
    //propose une liste de héros
    func choice(){
        print("* * * * * * PHASE DE PICK * * * * * * *")
        print("*          Liste des héros            *")
        print("* 1.Combattant | hp: 100 | Dégâts: 10 *")
        print("* 2.Mage       | hp: 80  | Soins:  10 *")
        print("* 3.Colosse    | hp: 200 | Dégâts: 5  *")
        print("* 4.Nain       | hp: 50  | Dégâts: 20 *")
        print("* * * * * * * * * * * * * * * * * * * *")
    }
    
    func pickCharacter(team: Team){
        var input: String?
        var nameCharacter: String = ""
        var picking: Int = 0
        var nameIsVailable: Bool = false
        
        /* Demander le héro */
        repeat{
            print("\(team.getPlayerName()), choisissez un Champion:")
            input =  readLine()
            if let input = input{
            picking = (input as NSString).integerValue
//                picking = Int(input)! //conversion String to Int
            }
        }while (picking < 1  || picking > 4) //choix du pick de 1 à 4.
        
        /* Demander le nom du héro */
        repeat{
            print("Choisir le nom de ce héro")
            input =  readLine()                 //entré au clavier
            if let input = input{               //ouverture de l'optionnel
                nameCharacter = input           //affectation de la valeur de l'optionnel
            }
            
        /* Vérifier si le nom est disponible */
           nameIsVailable = checkName(name: nameCharacter)
        }while(nameIsVailable != true) //tant que le nom n'est pas dispo, on boucle
        
        /* Création et ajout du personnage à l'équipe */
        makeCharacter(team: team, characterName: nameCharacter, picking: picking)
    }
    
    //Vérifier si le nom de personnage est unique
    func checkName(name: String) -> Bool{
        var vailable: Bool = false
        
        for index in Display.arrayName{     //check tout le tableau à la recherche de doublon
            if index == name{               //si doublon alors redemande un autre nom
                vailable = false
                print("Le nom \(name) est déjà pris")
            }else{
                vailable = true                //le nom est disponible
                Display.arrayName.append(name) //ajout le nouveau à la bdd de noms
            }
        }
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
        default:
            print("Erreur - Function - makeCharacter")
        }
    }
    
    func pickPhase(team1: Team, team2: Team){
        var pickTeam1: Int = 3
        var pickTeam2: Int = 3
        var turn: Bool = true
        var indexPick = 2
        
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
                    print("- - - - - - - - - - - - - -")
                    print("Picks restant: \(pickTeam1)")
                    pickCharacter(team: team1)
                    pickTeam1 -= 1
                case false:
                    print("- - - - - - - - - - - - - -")
                    print("Picks restant: \(pickTeam2)")
                    pickCharacter(team: team2)
                    pickTeam2 -= 1
            }
            indexPick += 1
        }
    }
    
    
    func resumePick(){
        var line1: String = ""
        var line2: String = ""
        var tab: [String] = []
        
        line1 = "|" + cell(str: team1.getPlayerName(), format: .large)
              + "|" + cell(str: "", format: .small)
              + "|" + cell(str: team2.getPlayerName(), format: .large) + "|"
              + "\n"
              + "|" + cell(str: "Nom", format: .medium)
              + "|" + cell(str: "Role", format: .medium)
              + "|" + cell(str: "HP", format: .small)
              + "|" + cell(str: "", format: .small)
              + "|" + cell(str: "Nom", format: .medium)
              + "|" + cell(str: "Role", format: .medium)
              + "|" + cell(str: "HP", format: .small) + "|"

        for index in 0...2{
        line2 = "|" + cell(str: team1.getCharacter(index: index).getCharacterName(), format: .medium)
              + "|" + cell(str: team1.getCharacter(index: index).specializationName, format: .medium)
              + "|" + cell(str: team1.getCharacter(index: index).getHealthPoints(), format: .small)
              + "|" + cell(str: "\(index + 1). .\(index + 1)", format: .small)
              + "|" + cell(str: team2.getCharacter(index: index).getCharacterName(), format: .medium)
              + "|" + cell(str: team2.getCharacter(index: index).specializationName, format: .medium)
              + "|" + cell(str: team2.getCharacter(index: index).getHealthPoints(), format: .small) + "|"
            
            tab.append(line2)
        }
        
        print(line1)
        for index in 0...2{
            print(tab[index])
        }
    }
    
    func reset(){
        
    }
}
