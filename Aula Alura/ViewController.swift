//
//  ViewController.swift
//  Aula Alura
//
//  Created by Iuri Menin on 06/07/16.
//  Copyright © 2016 Iuri Menin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var campoNome:UITextField!
    @IBOutlet var campoFelicidade:UITextField!
 
    @IBAction func add(){
        var nome = campoNome.text
        var felicidade = campoFelicidade.text
        print("comida: \(nome) \(felicidade)")
    }

}

