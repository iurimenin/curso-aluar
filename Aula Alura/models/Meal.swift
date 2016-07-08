//
//  Meal.swift
//  Aula Alura
//
//  Created by Iuri Menin on 07/07/16.
//  Copyright © 2016 Iuri Menin. All rights reserved.
//

import Foundation

class Meal {
    
    let nome:String
    let felicidade:Int
    var items = Array<Item>()
    
    init(nome:String, felicidade:Int){
        self.nome = nome
        self.felicidade = felicidade
    }
    
    func todasCalorias() -> Double {
        
        var total = 0.0
        for i in items {
            total += i.calorias
        }
        
        return total
    }
}