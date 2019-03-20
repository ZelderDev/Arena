//
//  main.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 12/02/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation

var turn = 0
var team1 = Team(name: "Olivier")
var team2 = Team(name: "Antoine")
var show = Picks(team1: team1, team2: team2)
var battle = Battle(team1: team1, team2: team2)
var stats = Statistics(team1: team1, team2: team2)




//team1.addCharacter(character: Dwarf(name: "Vrarox"))
//team1.addCharacter(character: Priest(name: "Broudy"))
//team1.addCharacter(character: Colossus(name: "Prova"))
//team2.addCharacter(character: Ninja(name: "Yhlia"))
//team2.addCharacter(character: Priest(name: "Kervam"))
//team2.addCharacter(character: Warrior(name: "Wallfax"))
//
////Stats - Team1
////Dwarf
//team1.getCharacter(index: 0).setDamageDone(damage: 350)
//team1.getCharacter(index: 0).setDamageTaken(damage: 100)
//team1.getCharacter(index: 0).setHealingTaken(heal: 50)
////Priest
//team1.getCharacter(index: 1).setHealingDone(heal: 290)
//team1.getCharacter(index: 1).setDamageTaken(damage: 100)
//team1.getCharacter(index: 1).setHealingTaken(heal: 50)
////Colossus
//team1.getCharacter(index: 2).setDamageDone(damage: 50)
//team1.getCharacter(index: 2).setDamageTaken(damage: 500)
//team1.getCharacter(index: 2).setHealingTaken(heal: 50)
//
////Stats - Team2
////Ninja
//team2.getCharacter(index: 0).setDamageDone(damage: 400)
//team2.getCharacter(index: 0).setDamageTaken(damage: 150)
//team2.getCharacter(index: 0).setHealingTaken(heal: 60)
////Priest
//team2.getCharacter(index: 1).setHealingDone(heal: 300)
//team2.getCharacter(index: 1).setDamageTaken(damage: 110)
//team2.getCharacter(index: 1).setHealingTaken(heal: 50)
////Warrior
//team2.getCharacter(index: 2).setDamageDone(damage: 50)
//team2.getCharacter(index: 2).setDamageTaken(damage: 500)
//team2.getCharacter(index: 2).setHealingTaken(heal: 70)
//
//
////Death of the team2
//team2.getCharacter(index: 0).setHealthPoints(hp: 0)
//team2.getCharacter(index: 1).setHealthPoints(hp: 0)
//team2.getCharacter(index: 2).setHealthPoints(hp: 0)



show.askPlayerName()
show.pickPhase(team1: team1, team2: team2)
turn = battle.round()

//turn = 20
stats.displayStatistics(turn: turn)
