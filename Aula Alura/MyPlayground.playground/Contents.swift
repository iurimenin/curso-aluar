//: Playground - noun: a place where people can play

import UIKit

class Meal {
    
    var nome:String
    var felicidade:Int
    var items = Array<Item>()
    init(nome:String, felicidade:Int){
        self.nome = nome
        self.felicidade = felicidade
    }
    
    func todasCalorias() -> Double {
        
        var total = 0.0
        for i in items {
            total += i.calories
        }
        
        return total
    }
}

class Item {
    var name:String
    var calories: Double
    init(nome:String, calorias:Double){
        self.name = nome
        self.calories = calorias
    }
}

let bolo = Meal(nome: "Chocolate", felicidade: 5);
bolo.items.append(Item(nome: "brownie", calorias: 115))
bolo.items.append(Item(nome: "vegan cream", calorias: 40))
print(bolo.todasCalorias())

print(bolo.nome)