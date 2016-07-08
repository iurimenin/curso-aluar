//
//  ViewController.swift
//  Aula Alura
//
//  Created by Iuri Menin on 06/07/16.
//  Copyright © 2016 Iuri Menin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var campoNome:UITextField?
    @IBOutlet var campoFelicidade:UITextField?
 
    @IBAction func add(){
        
        if campoNome == nil || campoFelicidade == nil {
            return
        }
        
        let nome = campoNome!.text
        let felicidade = Int(campoFelicidade!.text!)

        if felicidade == nil {

            return
        }
        
        let meal = Meal(nome: nome!, felicidade: felicidade!)
        
        print("comeu: \(meal.nome) \(meal.felicidade)")
    }

}
