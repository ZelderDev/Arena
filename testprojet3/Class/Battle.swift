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
        var checkInput = false

        
        repeat{ //As long as the keyboard input is not correct or the selected character is dead then
            
            
            repeat{
                input = readLine()
                if(input != "1" && input != "2" && input != "3" && input != "4"){
                    checkInput = false
                    print("Saisir UNIQUEMENT un héros entre 1 et 3.")
                }else{
                    checkInput = true
                }
            }while(checkInput == false)
            
            if let input = input{
                picking = (input as NSString).integerValue
            }
            
            if(picking > 0 && picking <= 3){
                if(team.getCharacter(index: picking-1).isAlive == false){
                    print("\(team.getCharacter(index: picking-1).getCharacterName()) est mort(e)!\nSélectionnez un autre héro.")
                    checkInput = false
                }
            }else{
                print("Choisissez un héros dans la liste entre 1 et 3:")
            }
        }while(picking < 1 || picking > 3 || ((team.getCharacter(index: picking-1).isAlive == false)))
        
        //Selects the character chosen by the player
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
        let attackerAttack = attacker.getDamage()
        
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
        let healerHeal = healer.getDamage()
        
        //STATS - update the healer stats with setHealingDone
        healer.setHealingDone(heal: healerHeal)
        //STATS - upadate the target stats witch setHealingTaken
        target.setHealingTaken(heal: healerHeal)
        
        print("\(healer.getCharacterName()) soigne \(target.getCharacterName()) et lui rend \(healerHeal) points de vie")
        targetHp += healerHeal
        target.setHealthPoints(hp: targetHp)
    }
    
    //Manage turn by turn
    //Manage the actions of players and characters
    func round() -> Int{
        var round: Bool = true  //player1 begins
        var target: Character = Character(name: "Unnamed")
        var emitter : Character = Character(name: "Unnamed")
        var ally: Team
        var enemy: Team
        var indexTurn: Int = 0
        var text: String = ""
        
        //Tant que tous les perso d'une équipe sont vivants alors on joue
        while(team1.teamIsAlive() && team2.teamIsAlive()){

            indexTurn += 1 //
            if(indexTurn%2 == 0){
                turn += 1
            }
            
            switch round{
            case true:          //Player1's turn
                ally = team1
                enemy = team2
            
                //The player chooses among the characters of his team
                text = "\(ally.getPlayerName()), choisissez un champion à jouer"
                displayBattle(team:ally, str: text)     //Shows the player's team
                emitter = selectCharacter(team: ally)   //Select a hero to play
    
                //Random chest
                random(character: emitter)
                
                //Select an enemy
                if emitter.getDpsOrHealer() == true{
                    text = "\(ally.getPlayerName()), choisissez un champion à attaquer"
                    displayBattle(team:enemy, str: text)      //Show the enemy team
                    target = selectCharacter(team: enemy)     //Select a character to attack
                    attack(attacker: emitter, target: target) //action (ATTACK !!!)
                    nextPlayer()                              //End of this player's turn
                }
                
                //Select an ally
                if emitter.getDpsOrHealer() == false{
                    text = "\(ally.getPlayerName()), choisissez un champion à soigner"
                    displayBattle(team:ally, str: text)      //Show the ally team
                    target = selectCharacter(team: ally)     //Select a character to heal
                    heal(healer: emitter, target: target)    //action (HEAL)
                    nextPlayer()                             //End of this player's turn
                }
                round = false   //next player's turn
                
            case false:         //Player2's turn
                ally = team2
                enemy = team1
                
                text = "\(ally.getPlayerName()), choisissez un champion à jouer"
                displayBattle(team:ally, str: text)
                emitter = selectCharacter(team: ally)
                
                random(character: emitter)
                
                //Select an enemy
                if emitter.getDpsOrHealer() == true{
                    text = "\(ally.getPlayerName()), choisissez un champion à attaquer"
                    displayBattle(team:enemy, str: text)      //Show the enemy team
                    target = selectCharacter(team: enemy)     //Select a character to attack
                    attack(attacker: emitter, target: target) //action (ATTACK !!!)
                    nextPlayer()                              //End of this player's turn
                }
                
                //Select an ally
                if emitter.getDpsOrHealer() == false{
                    text = "\(ally.getPlayerName()), choisissez un champion à soigner"
                    displayBattle(team:ally, str: text)      //Show the ally team
                    target = selectCharacter(team: ally)     //Select a character to heal
                    heal(healer: emitter, target: target)    //action (HEAL)
                    nextPlayer()                             //End of this player's turn
                }
                round = true
            }//end switch
            
        }//end - While one team is alive

        //Who to win, who lost the game
        if(team1.teamIsAlive() == false){
            print("\nLE VAINQUEUR EST \(team2.getPlayerName())!")
        }else if(team2.teamIsAlive() == false){
            print("\nLE VAINQUEUR EST \(team1.getPlayerName())!")
        }
        return turn
    }//end round
    
    //Displays the characters according to the current action (play, attack, heal)
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
}//End of the battle

