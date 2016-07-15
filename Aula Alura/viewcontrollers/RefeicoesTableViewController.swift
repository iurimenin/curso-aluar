//
//  RefeicoesTableViewController.swift
//  Aula Alura
//
//  Created by Iuri Menin on 11/07/16.
//  Copyright © 2016 Iuri Menin. All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AddMealDelegate {

    
    var refeicoes = [Meal(nome: "brownie chocolate", felicidade: 5),
                     Meal(nome: "bolo de chocolate", felicidade: 4)
                    ]
    
    func add(meal:Meal){
    
        refeicoes.append(meal)
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addRefeicao" {
            let view = segue.destinationViewController as! ViewController
            view.delegate = self
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.showDetail(_:)));
        let linha = indexPath.row
        let refeicao = refeicoes[linha]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
        cell.textLabel?.text = refeicao.nome
        cell.addGestureRecognizer(longPress)
        return cell
    }
    
    func showDetail(recognizer : UILongPressGestureRecognizer){
        
        if recognizer.state == UIGestureRecognizerState.Began {
            
            let celula = recognizer.view as! UITableViewCell
            let index = tableView.indexPathForCell(celula)
            if index == nil{
                return
            }
            let linha = index!.row
            let refeicao = refeicoes[linha]
            var mensagem = refeicao.montaMensagemItens()
            
            let alerta = UIAlertController(title: refeicao.nome,
                              message: mensagem,
                              preferredStyle: UIAlertControllerStyle.Alert)
            
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
            alerta.addAction(ok)
            presentViewController(alerta, animated: true, completion: nil)
        }
    }
 
    
    
}
