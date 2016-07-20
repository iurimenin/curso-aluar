//
//  Item.swift
//  Aula Alura
//
//  Created by Iuri Menin on 07/07/16.
//  Copyright © 2016 Iuri Menin. All rights reserved.
//

import Foundation

class Item : NSObject, NSCoding {
    
    let nome:String
    let calorias: Double
    init(nome:String, calorias:Double){
        self.nome = nome
        self.calorias = calorias
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.nome = aDecoder.decodeObjectForKey("nome") as! String
        self.calorias = aDecoder.decodeDoubleForKey("calorias")
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(nome, forKey: "nome")
        aCoder.encodeDouble(calorias, forKey: "calorias")
    }
}
func == (first: Item, second:Item) -> Bool {
    return first.nome == second.nome && first.calorias == second.calorias
}