//
//  Alert.swift
//  Aula Alura
//
//  Created by Iuri Menin on 19/07/16.
//  Copyright © 2016 Iuri Menin. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    let controller:UIViewController
    init(controller:UIViewController){
        self.controller = controller
    }
    
    func show(mensagem:String = "Erro desconhecido. Tome cuidado."){
        
        let alerta = UIAlertController(title: "Oops!",
                                       message: mensagem,
                                       preferredStyle: UIAlertControllerStyle.Alert)
        
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil)
        
        alerta.addAction(ok)
        controller.presentViewController(alerta, animated: true, completion: nil)
    }
}