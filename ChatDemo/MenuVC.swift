//
//  MenuVC.swift
//  ChatDemo
//
//  Created by hema on 2/13/18.
//  Copyright © 2018 UDAAR. All rights reserved.
//

import UIKit

class MenuVC: UITableViewController {
    
    
    fileprivate let reuseIdentifier = "MenuCell"
    
    let ContentArr = ["Profile","Settings","SignOut"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title = "Menu"

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
        return ContentArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuCustomCell

        // Configure the cell...
        
        cell.MenuLabel.text = ContentArr[indexPath.row]

        return cell
    }
    
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (ContentArr[indexPath.row] == ContentArr[0]) {
            let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
//              destinationVC.ProfileUserImage = "image"
//              destinationVC.ProfileUserLabel = "user name"
//              destinationVC.PasswordLabel = "Password : **********"
//
            self.navigationController?.pushViewController(destinationVC, animated: true)

        }
        else if (ContentArr[indexPath.row] == ContentArr[1]) {
            
            let alert = UIAlertController(title: "NotAvailable", message: "Settings Options Not Available Right Now", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in
                tableView.reloadData()
            })
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion: nil)
        }
        else {
            
            let alert = UIAlertController(title: "SignOut !", message: "Are You Sure You Want To Leave ?", preferredStyle: UIAlertControllerStyle.alert)
            let YESAction = UIAlertAction(title: "Yes", style: .default, handler: {(action) -> Void in
                tableView.reloadData()
            })
            let CancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {(action) -> Void in
            tableView.reloadData()
        })
            alert.addAction(YESAction)
            alert.addAction(CancelAction)
            self.present(alert, animated: true, completion: nil)
        }
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
