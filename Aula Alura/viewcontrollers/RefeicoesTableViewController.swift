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
        
        let linha = indexPath.row
        let refeicao = refeicoes[linha]
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
        cell.textLabel?.text = refeicao.nome
        return cell
    }
}
