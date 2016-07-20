//
//  Meal.swift
//  Aula Alura
//
//  Created by Iuri Menin on 07/07/16.
//  Copyright © 2016 Iuri Menin. All rights reserved.
//

import Foundation

class Meal : NSObject, NSCoding {
    
    let nome:String
    let felicidade:Int
    var items = Array<Item>()
    
    init(nome:String, felicidade:Int){
        self.nome = nome
        self.felicidade = felicidade
    }
    
    required init(coder aDecoder:NSCoder){
    
        self.nome = aDecoder.decodeObjectForKey("nome") as! String
        self.felicidade = aDecoder.decodeIntegerForKey("felicidade")
        self.items = aDecoder.decodeObjectForKey("items") as! Array
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(nome, forKey: "nome")
        aCoder.encodeInteger(felicidade, forKey: "felicidade")
        aCoder.encodeObject(items, forKey: "items")
    }
    
    func todasCalorias() -> Double {
        
        var total = 0.0
        for i in items {
            total += i.calorias
        }
        
        return total
    }
    
    func montaMensagemItens() -> String {
        var msg = "Felicidade: \(self.felicidade)"
        
        for item in self.items {
            
            msg += "\n * \(item.nome) - \(item.calorias) calorias"
        }

        return msg
    }
}