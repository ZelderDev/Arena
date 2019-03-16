


import Foundation

/* This class deals with the logic and the display of player picks */
class Picks{
    var team1: Team
    var team2: Team
    var playerName1: String = ""
    var playerName2: String = ""
    static var arrayName: [String] = ["Toto"]

    //Initialize with two teams in arguments
    init(team1: Team, team2: Team){
        self.team1 = team1
        self.team2 = team2
    }
    
    //Ask the names of the players
    func askPlayerName(){
        team1.setPlayerName()
        team2.setPlayerName()
    }
    

    //This method manages the selection of the hero and the entry of the name
    func pickCharacter(team: Team){
        var input: String?
        var nameCharacter: String = ""
        var picking: Int = 0
        var nameIsVailable: Bool = false
        var checkLengthName: Bool = false
        var nameLength: Int = 0
        var checkInput = false
        
        /* Ask to select a hero */
        repeat{
            print("\(team.getPlayerName()), choisissez un héros:")
            //CHECK STRING - check if the entry is only between 1 and 5
            while(checkInput == false){
                input =  readLine()
                
                if(input != "1" && input != "2" && input != "3" && input != "4" && input != "5"){
                    checkInput = false
                    print("Saisir UNIQUEMENT un héros entre 1 et 5.")
                }else{
                    checkInput = true
                }
            }
            if let input = input{
                picking = (input as NSString).integerValue
            }
        }while (picking < 1  || picking > 5)   //CHECK INT - check if the entry is only between 1 and 5
        
        /* Ask the name of the hero */
        repeat{
            print("Choisir le nom de ce héros")
            //CHECK the length of the name
            repeat{
                input = readLine()                      //Keyboard input
                if let input = input{                   //try to warp optionnel
                    nameCharacter = input               //optionnel warped
                    nameLength = nameCharacter.count    //get the length of the name
                    if(nameLength > 10){                //check length
                        print("Ce nom est trop long, choisir un  nom de 10 caractères maximum")
                        checkLengthName = false
                    }else{
                        checkLengthName = true
                    }
                }
            }while(checkLengthName == false)
            
            if nameCharacter != ""{             //check if the keyboard input is not empty
                nameIsVailable = checkNameCharacter(name: nameCharacter)
            }
            
        }while((nameCharacter == "") || (nameIsVailable == false)) //As long as the name is not available
        
        /* Creating and adding the character to the team */
        makeCharacter(team: team, characterName: nameCharacter, picking: picking)
    }
    
    //Check if the character's name is unique
    func checkNameCharacter(name: String) -> Bool{
        var vailable: Bool = false
        
        for index in Picks.arrayName{     //check the array for duplicate name
            if(index == name){
                print("ERREUR - Le nom \(name) est déjà pris")
                vailable = false
                return vailable
            }else{
                vailable = true
            }
        }
        Picks.arrayName.append(name) //Add the new name to the array name.
        return vailable
    }
    
    //Create a character, with his team, his name and his role
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
    
    //Orders and displays the champions selection phase
    func pickPhase(team1: Team, team2: Team){
        var pickTeam1: Int = 3
        var pickTeam2: Int = 3
        var turn: Bool = true
        var indexPick = 2
        var selectorP1 = ""
        var selectorP2 = ""
        
        for _ in 1...6{             //total number of picks
            
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
    
    //Gives a list of heroes owned by the players
    //Indicates which player is selecting
    func displayPickPhase(selectorP1: String, selectorP2: String){
        var bloc: String
        var arrayIndicatorPlayer1: [String] = ["Slot1","Slot2","Slot3"]
        var arrayIndicatorPlayer2: [String] = ["Slot1","Slot2","Slot3"]
        var lengthArrayTeam1: Int
        var lengthArrayTeam2: Int
        var currentPickPlayer1: String = ""
        var currentPickPlayer2: String = ""
        
        
        //Implements the display of the player1's hero list
        lengthArrayTeam1 = team1.arrayCharac.count
        if(lengthArrayTeam1 > 0){
            for index in 0...(lengthArrayTeam1-1){
                arrayIndicatorPlayer1[index] = team1.getspecializationName(index: index)
            }
        }
        for specializationName in arrayIndicatorPlayer1{
            currentPickPlayer1 += specializationName + " "
        }
        
        //Implements the display of the player2's hero list
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
        bloc = selectorP1
            + "Equipe de \(team1.getPlayerName()), [\(currentPickPlayer1)]"
            + "\n"
            + selectorP2
            + "Equipe de \(team2.getPlayerName()), [\(currentPickPlayer2)]"
        
        //Displays the choice list of the heroes to select as well as the characters already selected.
        print("\n\n\n\n\n\n\n\n\n")
        print(" * * * * * * PHASE DE PICK * * * * * * * ")
        print("             Liste des héros             ")
        print("     Roles     | Pv  |  Items    | Dégats ")
        print("  1.Combattant | 100 |  épée     |  10    ")
        print("  2.Prêtre     | 80  |  bâton    |  10    ")
        print("  3.Colosse    | 200 |  masse    |  5     ")
        print("  4.Nain       | 50  |  arbalète |  20    ")
        print("  5.Ninja      | 110 |  poignard |  10    ")
        print("  ------------------------------------   ")
        print(bloc)
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
        print("* * * * RÉSUMÉ DES ÉQUIPES * * * *")
        print(line1)
        print(line2)
        loading()
    }
    
    func loading(){
        print("LANCEMENT DE LA PHASE DE COMBAT, veuillez patienter", terminator:" ")
        for _ in 1...3{
            print(".", terminator:"")
            sleep(1)
        }
        print("\n")
    }
    
}
