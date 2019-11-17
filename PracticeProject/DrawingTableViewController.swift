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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
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
        return fvc
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
