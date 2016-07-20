//
//  ViewController.swift
//  Aula Alura
//
//  Created by Iuri Menin on 06/07/16.
//  Copyright © 2016 Iuri Menin. All rights reserved.
//

import UIKit

protocol AddMealDelegate {
    func add(meal:Meal)
}
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {

    @IBOutlet var campoNome:UITextField?
    @IBOutlet var campoFelicidade:UITextField?
    @IBOutlet var tableView : UITableView? 
    var delegate:AddMealDelegate?
    
    var items = Array<Item>()
    var selected = Array<Item>()
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "new item",
                        style: UIBarButtonItemStyle.Plain,
                        target: self,
                        action: #selector(ViewController.showNewItem))
        navigationItem.rightBarButtonItem = newItemButton
    
        items = Dao().carregaItems()
    }
    
    func add(item: Item) {
        items.append(item)
        Dao().salvaItems(items)
        if let table = tableView {
            table.reloadData()
        } else {
            Alert(controller: self).show("Erro inesperado, mas o item foi adicionado.");
        }
    }
    
    func showNewItem() {
        let newItem = NewItemViewController(delegate: self)

        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        } else {
            Alert(controller: self).show()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let item = items[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
        cell.textLabel?.text = item.nome
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
         
            let item = items[indexPath.row]
            if cell.accessoryType == UITableViewCellAccessoryType.None {
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
                selected.append(item)
            } else {
                cell.accessoryType = UITableViewCellAccessoryType.None
                if let position = selected.indexOf(item) {
                    selected.removeAtIndex(position)
                } else {
                    Alert(controller: self).show()
                }
            }
        } else {
            Alert(controller: self).show()
        }
    }
    
    func getRefeicaoFromForm() -> Meal? {
    
        if campoNome == nil || campoFelicidade == nil {
            return nil
        }
        
        let nome = campoNome!.text
        let felicidade = Int(campoFelicidade!.text!)
        
        if felicidade == nil {
            
            return nil
        }
        
        let meal = Meal(nome: nome!, felicidade: felicidade!)
        meal.items = selected
        
        print("comeu: \(meal.nome) \(meal.felicidade) \(meal.items)")
        
        return meal
    }
    
    @IBAction func add(){
        
        if let meal = getRefeicaoFromForm() {
            
            if let meals = delegate {
                meals.add(meal)
                
                if let navigation = self.navigationController {
                    navigation.popViewControllerAnimated(true)
                } else {
                    Alert(controller: self).show("Erro desconhecido, mas a refeição foi adicionada.")
                }
                
                return
            }
        }
        
        Alert(controller: self).show()
    }

}
