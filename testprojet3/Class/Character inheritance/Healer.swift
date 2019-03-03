//
//  Healer.swift
//  testprojet3
//
//  Created by Fabien Le Boulaire on 15/02/2019.
//  Copyright © 2019 lbf. All rights reserved.
//

import Foundation

class Healer: Character{
           //propriétés de classe (ou variables de classe)
    
    
    override init(name: String){
        super.init(name: name)
        self.items = ["Bâton": 10]
    }
}
