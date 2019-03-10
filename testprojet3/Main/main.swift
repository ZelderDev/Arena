//
//  main.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 12/02/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation

var team1 = Team(name: "Joueur 1")
var team2 = Team(name: "Joueur 2")
var show = Picks(team1: team1, team2: team2)
var battle = Battle(team1: team1, team2: team2)
var stats = Statistics(team1: team1, team2: team2)

team1.addCharacter(character: Dwarf(name: "Vrarox"))
team1.addCharacter(character: Priest(name: "Broudy"))
team1.addCharacter(character: Colossus(name: "Prova"))
team2.addCharacter(character: Ninja(name: "Yhlia"))
team2.addCharacter(character: Priest(name: "Kervam"))
team2.addCharacter(character: Warrior(name: "Wallfax"))

//team2.getCharacter(index: 0).setHealthPoints(hp: 0)
//team2.getCharacter(index: 1).setHealthPoints(hp: 0)
//team2.getCharacter(index: 2).setHealthPoints(hp: 0)


show.askPlayerName()
show.pickPhase(team1: team1, team2: team2)
battle.round()
stats.displayStatistics()
