//
//  DrawingTableViewController.swift
//  PracticeProject
//
//  Created by Pablo Martín Redondo on 17/11/2019.
//  Copyright © 2019 Pablo Martín Redondo. All rights reserved.
//

import UIKit

class DrawingTableViewController: UITableViewController {
    
    var model = PracticeModel()
    
    @IBOutlet weak var typeSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        let row = indexPath.row
        let item = model.items[row]
        cell.xField.text = item.x
        cell.xField.tag = row
        cell.yField.text = item.y
        cell.yField.tag = row
        cell.deleteButton.tag = row
        return cell
    }
    
    @IBAction func addPoint(_ sender: UIBarButtonItem) {
        model.addItem()
        tableView.reloadData()
    }
    
    @IBAction func deleteItem(_ sender: UIButton) {
        model.deleteItem(pos: sender.tag)
        tableView.reloadData()
        
    }
    
    @IBAction func resetList(_ sender: UIBarButtonItem) {
        model.resetList()
        tableView.reloadData()
    }
    
    @IBAction func xTextFieldChanged(_ sender: UITextField) {
        if(sender.tag >= model.items.count){
            return
        }
        model.items[sender.tag].x = sender.text ?? ""
    }
    
    
    @IBAction func yTextFieldChanged(_ sender: UITextField) {
        if(sender.tag >= model.items.count){
            return
        }
        model.items[sender.tag].y = sender.text ?? ""
    }
    
    @IBSegueAction func prepareController(_ coder: NSCoder) -> FigureViewController? {
        let fvc  = FigureViewController(coder: coder)
        fvc?.items = model.items
        fvc?.type = typeSwitch.isOn ? 0:1
        return fvc
    }
    

}
