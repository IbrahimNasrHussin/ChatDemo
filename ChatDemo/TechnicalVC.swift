//
//  TechnicalVC.swift
//  ChatDemo
//
//  Created by hema on 2/13/18.
//  Copyright © 2018 UDAAR. All rights reserved.
//

import UIKit

class TechnicalVC: UITableViewController {
    
    
    fileprivate let reuseIdentifier = "TechnicalCell"
    
    var technical_name = ["Technical Support"]
    var technical_image = ["technical.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Technical"
        
        tableView.tableFooterView = UIView()
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.contentInset = UIEdgeInsets.zero
        tableView.reloadData()

    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return technical_name.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TechnicalCustomCell

        // Configure the cell...
        
        cell.TechnicalLabel.text = technical_name[indexPath.row]
        cell.TechnicalIMG.image = UIImage(named: technical_image[indexPath.row])
        cell.TechnicalIMG.layer.cornerRadius = cell.TechnicalIMG.frame.width / 2
        cell.TechnicalIMG.clipsToBounds = true

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "NotAvailable", message: "Sorry, Technical Support Is Not Availabel Right Now", preferredStyle: UIAlertControllerStyle.alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in
            tableView.reloadData()
        })
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
