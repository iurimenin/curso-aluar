//: Playground - noun: a place where people can play

import UIKit

let calorias:Array<Double> = [50.5, 100, 300, 500]

let itens:Array<Double> = []

for var i = 0; i < calorias.count; i++ {
    print(calorias[i])
}

for i in 0...3 {
    print(calorias[i])
}

for i in calorias {
    print(i)
}

func allCalories(calories:Array<Double>) -> Double {
    var total:Double = 0
    for c in calorias {
        total += c
    }
    return total
}

let totalCalorias = allCalories([10.5, 100, 300, 500])
print(totalCalorias)

var total = 0
var values = [1,2]

for v in values {
    total += v
}
print(total / values.count)