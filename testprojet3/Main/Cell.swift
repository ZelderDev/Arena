//
//  Cell.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 22/02/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation

enum Size{
    case large
    case medium
    case small
}

// The purpose of this function is to ease the format of the display,
// by building small display cells (small, medium, large).
func cell(str: Any, format: Size) -> String{
    var convert: String = ""
    var length:Int = 0
    
    //Check the type of str (Int or String)
    if let contenu = str as? String{
        convert = contenu
    }
    if let contenu = str as? Int{
        convert = String(contenu)
    }
    
    //This switch will allocate size based on its format of a cell
    switch format{
    case .large:
        length = 29
    case .medium:
        length = 21
    case.small:
        length = 5
    }
    
    let lenghtName = convert.count              //Get the size of the string
    let nbrSpacing: Int = length - lenghtName
    
    //Stuffed with spaces
    if(nbrSpacing != 0){
        for _ in 1...nbrSpacing{
            convert.insert(" ", at: convert.endIndex)
        }
    }
    return convert
}
