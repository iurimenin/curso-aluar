//
//  NewItemViewController.swift
//  Aula Alura
//
//  Created by Iuri Menin on 12/07/16.
//  Copyright © 2016 Iuri Menin. All rights reserved.
//

import UIKit

protocol AddAnItemDelegate {
    func add(item:Item)
}
class NewItemViewController: UIViewController {


    @IBOutlet var campoNome:UITextField?
    @IBOutlet var campoCalorias:UITextField?
    var delegate : AddAnItemDelegate?
    
    init(delegate:AddAnItemDelegate){
        self.delegate = delegate
        super.init(nibName: "NewItemViewController", bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBAction func addNewItem() {
        
        if campoNome == nil || campoCalorias == nil {
            return
        }
        
        let nome = campoNome?.text
        let calorias = NSString(string: campoCalorias!.text!).doubleValue
        
        let item = Item(nome: nome!,  calorias:calorias)
        
        if delegate == nil {
            return
        }
        
        delegate?.add(item)
        
        if let navigation = navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }

}
