//
//  Statistics.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 04/03/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation

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
    
    //Le but de cette méthode est de donnée le pourcentage d'une statistique d'un perso en particulier et de la retourner sous forme de texte pour être intégré directement dans l'affichage
    func percentage(total: Int, characterStat: Int) -> String{
        var percent = 0.00
        
        if (characterStat != 0){
            percent = Double((characterStat * 100) / total)
        }
        return String(format: "%.2f", percent)
    }
 
    //Displays the stats of a team
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
    
    
    func totalStatistics(){
        var line = ""
        var totalDamageDone = team1.getTeamDamageDone() + team2.getTeamDamageDone()
        var totalDamageTaken = team1.getTeamDamageTaken() + team2.getTeamDamageTaken()
        var totalHealingDone = team1.getTeamHealingDone() + team2.getTeamHealingDone()
        var totalHealingTaken = team1.getTeamHealingTaken() + team2.getTeamHealingTaken()
        
        line += cell(str: "Total", format: .medium)
            + cell(str: totalDamageDone, format: .medium)
            + cell(str: totalDamageTaken, format: .medium)
            + cell(str: totalHealingDone, format: .medium)
            + cell(str: totalHealingTaken, format: .medium)
        
        print(line)
    }
    
    func displayStatistics(){
        print("Résumé des statistiques de la partie")
        teamStatics(team: team1)
        teamStatics(team: team2)
        totalStatistics()
    }
    
}
