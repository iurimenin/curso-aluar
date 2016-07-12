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
    
    var items = [
        Item(nome: "Brownie de chocolate", calorias: 10),
        Item(nome: "Zucchini muffin", calorias: 10),
        Item(nome: "Cookie", calorias: 10),
        Item(nome: "Bolo de Chocolate", calorias: 500),
        Item(nome: "Chocolate frosting", calorias: 1000),
        Item(nome: "Brownie de chocolate", calorias: 1000)
    ]
 
    var selected = Array<Item>()
    
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "new item",
                        style: UIBarButtonItemStyle.Plain,
                        target: self,
                        action: #selector(ViewController.showNewItem))
        
        navigationItem.rightBarButtonItem = newItemButton
    }
    
    func add(item: Item) {
        items.append(item)
        if tableView == nil {
            return
        }
        tableView!.reloadData()
    }
    
    func showNewItem() {
        let newItem = NewItemViewController(delegate: self)

        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
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
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        if cell == nil {
            return
        }

        let item = items[indexPath.row]
        if cell?.accessoryType == UITableViewCellAccessoryType.None {
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            selected.append(item)
        } else {
            cell?.accessoryType = UITableViewCellAccessoryType.None
            if let position = selected.indexOf(item) {
                selected.removeAtIndex(position)
            }
        }
    }
    
    
    
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
        meal.items = selected

        print("comeu: \(meal.nome) \(meal.felicidade) \(meal.items)")
        
        if delegate == nil {
            return
        }
        
        delegate!.add(meal)
        
        if let navigation = self.navigationController {
            
            navigation.popViewControllerAnimated(true)
        }
    }

}
