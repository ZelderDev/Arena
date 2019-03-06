//
//  Combat.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 22/02/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation

class Battle{
    var team1: Team
    var team2: Team
    var turn: Int = 1

    
    init(team1: Team, team2: Team){
        self.team1 = team1
        self.team2 = team2
    }
    
    /* SELECT A CHARACTER */
    func selectCharacter(team: Team) -> Character{
        var characSelected = Character(name: "Unnamed")
        var picking: Int = 0
        var input: String?

        repeat{
            
            input =  readLine()
            if let input = input{
                picking = (input as NSString).integerValue
            }
            if(picking > 0 && picking <= 3){
                if(team.getCharacter(index: picking-1).isAlive == false){
                    print("\(team.getCharacter(index: picking-1).getCharacterName()) est mort !")
                }
            }else{
                print("Choisissez un héro dans la liste entre 1 et 3:")
            }
        }while(picking < 1 || picking > 3 || ((team.getCharacter(index: picking-1).isAlive == false)))
        
        
        switch picking{
            case 1:
                characSelected = team.getCharacter(index: picking-1)
            case 2:
                characSelected = team.getCharacter(index: picking-1)
            case 3:
                characSelected = team.getCharacter(index: picking-1)
            default:
                print("Erreur - Combat - picking")
            }
        return characSelected
    }
    
    //ACTION: ATTACK
    func attack(attacker: Character, target: Character){
        var targetHp = target.getHealthPoints()
        var attackerAttack = attacker.getDamage()
        
        //STATS - update the attacker stats with setDamageDone
        attacker.setDamageDone(damage: attackerAttack)
        //STATS - upadate the target stats witch setDamageTaken
        target.setDamageTaken(damage: attackerAttack)
        
        print("\(attacker.getCharacterName()) attaque \(target.getCharacterName()) et lui inflige \(attackerAttack) points de dégâts")
        targetHp -= attackerAttack
        target.setHealthPoints(hp: targetHp)
    }
    
    //ACTION: HEAL
    func heal(healer: Character, target: Character){
        var targetHp = target.getHealthPoints()
        var healerHeal = healer.getDamage()
        
        //STATS - update the healer stats with setHealingDone
        healer.setHealingDone(heal: healerHeal)
        //STATS - upadate the target stats witch setHealingTaken
        target.setHealingTaken(heal: healerHeal)
        
        print("\(healer.getCharacterName()) soigne \(target.getCharacterName()) et lui rend \(healerHeal) points de vie")
        targetHp += healerHeal
        target.setHealthPoints(hp: targetHp)
    }
    
    func round(){
        var round: Bool = true  //player1 begins
        var target: Character = Character(name: "Unnamed")
        var emitter : Character = Character(name: "Unnamed")
        var ally: Team
        var enemy: Team
        var indexTurn: Int = 0
        var resume = Picks(team1: team1, team2: team2)
        var text: String = ""
        
        //Tant que tous les perso d'une équipe sont vivants alors on joue
        while(team1.teamIsAlive() && team2.teamIsAlive()){

            indexTurn += 1 //
            if(turn%2 == 0){
                turn += 1
            }
            
            switch round{
            case true:          //player1
                ally = team1
                enemy = team2
            
                //Sélectionner votre héro entre 1 et 3
                text = "\(ally.getPlayerName()), choisissez un champion à jouer"
                displayBattle(team:ally, str: text) //affichage combat
                emitter = selectCharacter(team: ally) //selection d'un héro
    
                //randChest
                random(character: emitter)
                
                //Sélectionne un ennemi
                if emitter is DamageDealer{
                    text = "\(ally.getPlayerName()), choisissez un champion à attaquer"
                    displayBattle(team:enemy, str: text)      //affichage
                    target = selectCharacter(team: enemy)     //sélection
                    attack(attacker: emitter, target: target) //action
                    nextPlayer()                              //fin du tour du joueur
                }
                //Sélectionne un allié
                if emitter is Healer{
                    text = "\(ally.getPlayerName()), choisissez un champion à soigner"
                    displayBattle(team:ally, str: text)      //affichage
                    target = selectCharacter(team: ally)
                    heal(healer: emitter, target: target)
                    nextPlayer()
                }
            
                round = false   //next player
            case false:         //player2
                ally = team2
                enemy = team1
                
                //Sélectionner votre héro entre 1 et 3
                text = "\(ally.getPlayerName()), choisissez un champion à jouer"
                displayBattle(team:ally, str: text) //affichage combat
                emitter = selectCharacter(team: ally) //selection d'un héro
                
                //randChest
                random(character: emitter)
                
                //Sélectionne un ennemi
                if emitter is DamageDealer{
                    text = "\(ally.getPlayerName()), choisissez un champion à attaquer"
                    displayBattle(team:enemy, str: text)      //affichage
                    target = selectCharacter(team: enemy)     //sélection
                    attack(attacker: emitter, target: target) //action
                    nextPlayer()                              //fin du tour du joueur
                }
                //Sélectionne un allié
                if emitter is Healer{
                    text = "\(ally.getPlayerName()), choisissez un champion à soigner"
                    displayBattle(team:ally, str: text)      //affichage
                    target = selectCharacter(team: ally)
                    heal(healer: emitter, target: target)
                    nextPlayer()
                }
                round = true    //next player
            }//end switch
            
        }//end while

        //savoir qui a perdu
        if(team1.teamIsAlive() == false){
            print("\(team2.getPlayerName()) à gagné")
            //afficher
        }else if(team2.teamIsAlive() == false){
            print("\(team1.getPlayerName()) à gagné")
        }
        
    }//end round
    
    //affiche les héros du joueur selon l'action en cours (jouer, attaquer, soigner)
    func displayBattle(team: Team, str: String){
        var bloc: String = ""
        var line1: String = ""
        
        line1 += "       "
            + cell(str: "Noms", format: .medium)
            + cell(str: "Pv", format: .small)
            + cell(str: "Items", format: .medium)
            + cell(str: "Dégâts", format: .medium)
        
        for index in 0...2{
        bloc += "   " + "\(index+1) . "
              + cell(str: (team.getCharacter(index: index).getCharacterName())
               + "(" + team.getspecializationName(index: index)
               + ")", format: .medium)
              + cell(str: team.getCharacter(index: index).getHealthPoints(), format: .small)
              + cell(str: team.getCharacter(index: index).getItemName(), format: .medium)
              + cell(str: team.getCharacter(index: index).getDamage(), format: .medium)
              + "\n"
        }
        
        print("\n\n\n\n\n\n\n\n\n\n\n\n")
        print("          PHASE DE COMBAT - TOUR n°\(turn)")
        print(str)
        print(line1)
        print(bloc, terminator: "")
    }
    
    func nextPlayer(){
        print("FIN DU TOUR, veuillez patienter", terminator:" ")
        for _ in 1...3{
            print(".", terminator:"")
            sleep(1)
        }
        print("\n")
    }
}//end Combat

