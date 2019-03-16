//
//  Statistics.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 04/03/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation

//Gives all the statistics of the game (damage, heal).
class Statistics{
    var totalDamageDone = 0
    var totalDamageTaken = 0
    var totalHealingDone = 0
    var totalHealingTaken = 0
    
    
    init(team1: Team, team2: Team){
        self.totalDamageDone = team1.getTeamDamageDone() + team2.getTeamDamageDone()
        self.totalDamageTaken = team1.getTeamDamageTaken() + team2.getTeamDamageTaken()
        self.totalHealingDone = team1.getTeamHealingDone() + team2.getTeamHealingDone()
        self.totalHealingTaken = team1.getTeamHealingTaken() + team2.getTeamHealingTaken()
    }
    
    //The purpose of this method is to give the percentage of a statistic of a particular character and to return it as text to be directly integrated in the display
    func percentage(total: Int, characterStat: Int) -> String{
        var percent = 0.00
        
        if (characterStat != 0){
            percent = Double((characterStat * 100) / total)
        }
        return String(format: "%.2f", percent)
    }
 
    //Show team stats
    func teamStatics(team: Team){
        var bloc1: String = ""
        var bloc2: String = ""
        
        bloc1 = "  \(team.getPlayerName())"
            + "\n"
            + cell(str: "Héros", format: .medium)
            + cell(str: "Dégats infligés", format: .medium)
            + cell(str: "Dégâts subis", format: .medium)
            + cell(str: "Soins prodigués", format: .medium)
            + cell(str: "Soins reçu", format: .medium)
            + "\n"
        
        for index in 0...2{
            bloc2 += ""
              + cell(str: team.getCharacter(index: index).getCharacterName(), format: .medium)
              + cell(str: "\(team.getCharacter(index: index).getDamageDone()) (\(percentage(total: team.getTeamDamageDone(), characterStat: team.getCharacter(index: index).getDamageDone())))", format: .medium)
              + cell(str: "\(team.getCharacter(index: index).getDamageTaken()) (\(percentage(total: team.getTeamDamageTaken(), characterStat: team.getCharacter(index: index).getDamageTaken())))", format: .medium)
             + cell(str: "\(team.getCharacter(index: index).getHealingDone()) (\(percentage(total: team.getTeamHealingDone(), characterStat: team.getCharacter(index: index).getHealingDone())))", format: .medium)
             + cell(str: "\(team.getCharacter(index: index).getHealingTaken()) (\(percentage(total: team.getTeamHealingTaken(), characterStat: team.getCharacter(index: index).getHealingTaken())))", format: .medium)
            + "\n"
        }
        print(bloc1 + bloc2)
    }
    
    //Calculate total statistics
    func totalStatistics(){
        var line = ""
        let totalDamageDone = team1.getTeamDamageDone() + team2.getTeamDamageDone()
        let totalDamageTaken = team1.getTeamDamageTaken() + team2.getTeamDamageTaken()
        let totalHealingDone = team1.getTeamHealingDone() + team2.getTeamHealingDone()
        let totalHealingTaken = team1.getTeamHealingTaken() + team2.getTeamHealingTaken()
        
        line += cell(str: "Total", format: .medium)
            + cell(str: totalDamageDone, format: .medium)
            + cell(str: totalDamageTaken, format: .medium)
            + cell(str: totalHealingDone, format: .medium)
            + cell(str: totalHealingTaken, format: .medium)
        
        print(line)
    }
    
    //Displays the statistics of the game
    func displayStatistics(turn: Int){
        print("\nRésumé des statistiques de la partie")
        print("Nombre de tours: \(turn)")
        teamStatics(team: team1)
        teamStatics(team: team2)
        totalStatistics()
    }
}
