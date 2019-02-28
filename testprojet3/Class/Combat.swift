//
//  Combat.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 22/02/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation

class Combat{
    var team1: Team
    var team2: Team
    
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
            if(team.getCharacter(index: picking-1).isAlive == false){
                print("\(team.getCharacter(index: picking-1).getCharacterName()) est mort ! Choissir un autre prersonnage")
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
    
    
    
    func attack(attacker: Character, target: Character){
        var targetHp = target.getHealthPoints()
        var attackerAttack = attacker.getDamage()
        
        print("\(attacker.getCharacterName()) attaque \(target.getCharacterName()) et lui inflige \(attackerAttack) points de dégâts")
        targetHp -= attackerAttack
        target.setHealthPoints(hp: targetHp)
    }
    
    func heal(healer: Character, target: Character){
        var targetHp = target.getHealthPoints()
        var healerHeal = healer.getDamage()
        
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
        var resume = Display(team1: team1, team2: team2)
        
        //Tant que tous les perso d'une équipe sont vivants alors on joue
        while(team1.teamIsAlive() && team2.teamIsAlive()){
        
            switch round{
            case true:          //player1
                resume.resumePick()
                ally = team1
                enemy = team2
            
                //Sélectionner votre héro entre 1 et 3
                print("\(ally.getPlayerName()), choisissez un champion à jouer")
                emitter = selectCharacter(team: ally)
                //ajouter la fonction randChest
                //remplacer l'item actuel par celui loot
                //remplacer l'attaque actuel par la nouvelle
                
                //Sélectionne un ennemi
                if emitter is DamageDealer{
                    print("\(ally.getPlayerName()), choisissez un champion à attaquer")
                    target = selectCharacter(team: enemy)
                    attack(attacker: emitter, target: target)
                }
                //Sélectionne un allié
                if emitter is Healer{
                    print("\(ally.getPlayerName()), choisissez un champion à soigner")
                    target = selectCharacter(team: ally)
                    heal(healer: emitter, target: target)
                }
            
                round = false   //next player
            case false:         //player2
                resume.resumePick()
                ally = team2
                enemy = team1
            
                //Sélectionner votre héro entre 1 et 3
                print("\(ally.getPlayerName()), choisissez un champion à jouer")
                emitter = selectCharacter(team: ally)
            
                //Sélectionne un ennemi
                if emitter is DamageDealer{
                    print("\(ally.getPlayerName()), choisissez un champion à attaquer")
                    target = selectCharacter(team: enemy)
                    attack(attacker: emitter, target: target)
                }
                //Sélectionne un allié
                if emitter is Healer{
                    print("\(ally.getPlayerName()), choisissez un champion à soigner")
                    target = selectCharacter(team: ally)
                    heal(healer: emitter, target: target)
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
}//end Combat
