//
//  Dao.swift
//  Aula Alura
//
//  Created by Iuri Menin on 19/07/16.
//  Copyright © 2016 Iuri Menin. All rights reserved.
//

import Foundation

class Dao {
    
    let arquivoRefeicoes:String
    let arquivoItems:String
    
    init(){
        let userDirs = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let dir = userDirs[0] as String
        arquivoRefeicoes = "\(dir)/aula-alura-refeicoes"
        arquivoItems = "\(dir)/aula-alura-items"
    }
    
    func salvaRefeicoes(refeicoes:Array<Meal>){
        NSKeyedArchiver.archiveRootObject(refeicoes, toFile: arquivoRefeicoes)
    }
    
    func carregaRefeicoes() -> Array<Meal> {
    
        if let carregou = NSKeyedUnarchiver.unarchiveObjectWithFile(arquivoRefeicoes) {
            return carregou as! Array
        } else {
            return Array<Meal>()
        }
    }
    
    func salvaItems(items:Array<Item>){
        NSKeyedArchiver.archiveRootObject(items, toFile: arquivoItems)
    }
    
    func carregaItems() -> Array<Item> {
        
        if let carregou = NSKeyedUnarchiver.unarchiveObjectWithFile(arquivoItems) {
            return carregou as! Array
        } else {
            return Array<Item>()
        }
    }

}