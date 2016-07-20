//
//  RemoveRefeicaoController.swift
//  Aula Alura
//
//  Created by Iuri Menin on 19/07/16.
//  Copyright © 2016 Iuri Menin. All rights reserved.
//

import Foundation
import UIKit

class RemoveRefeicaoController {
    
    let controller:UIViewController
    init(controller:UIViewController){
        self.controller = controller
    }
    
    func show(refeicao:Meal, handler:((UIAlertAction!) -> Void)){
        
        let alerta = UIAlertController(title: refeicao.nome,
                                       message: refeicao.montaMensagemItens(),
                                       preferredStyle: UIAlertControllerStyle.Alert)
        
        let remove = UIAlertAction(title: "Remove", style: UIAlertActionStyle.Destructive, handler: handler)
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        
        alerta.addAction(remove)
        alerta.addAction(cancel)
        
        controller.presentViewController(alerta, animated: true, completion: nil)
    }
}