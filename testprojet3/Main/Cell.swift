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

func cell(str: Any, format: Size) -> String{
    var convert: String = ""
    var length:Int = 0
    
    if let contenu = str as? String{
        convert = contenu
    }
    if let contenu = str as? Int{
        convert = String(contenu)
    }
    
    switch format{
    case .large:
        length = 29
    case .medium:
        length = 20
    case.small:
        length = 5
    }
    
    var lenghtName = convert.count              //taille de la cdc
    var nbrSpacing: Int = length - lenghtName   //taille espace à compléter
    
    if(nbrSpacing != 0){
        for _ in 1...nbrSpacing{
            convert.insert(" ", at: convert.endIndex)
        }
    }
    return convert
}
