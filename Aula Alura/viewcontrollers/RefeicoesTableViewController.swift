//
//  RefeicoesTableViewController.swift
//  Aula Alura
//
//  Created by Iuri Menin on 11/07/16.
//  Copyright © 2016 Iuri Menin. All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AddMealDelegate {

    
    var refeicoes = Array<Meal>()
    
    func add(meal:Meal){
    
        refeicoes.append(meal)
        Dao().salvaRefeicoes(refeicoes)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        
        refeicoes = Dao().carregaRefeicoes()
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
           
            RemoveRefeicaoController(controller: self).show(refeicao, handler:{ action in
                self.refeicoes.removeAtIndex(linha)
                self.tableView.reloadData()
            })
        }
    }
 
    
    
    
}
