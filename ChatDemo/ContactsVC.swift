//
//  ContactsVC.swift
//  ChatDemo
//
//  Created by hema on 2/11/18.
//  Copyright © 2018 UDAAR. All rights reserved.
//

import UIKit
class ContactsVC: UITableViewController {

    
    fileprivate let reuseIdentifier = "ContactsCell"
    var contacts = [Contacts]()
    
    lazy var refresher:UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handlerefresh), for: .valueChanged)
        return refresher
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Contacts"
        tableView.tableFooterView = UIView()
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.contentInset = UIEdgeInsets.zero
        
        tableView.addSubview(refresher)
        
        handlerefresh()
    }
    
    @objc private func handlerefresh() {
        self.refresher.endRefreshing()
//        API.contacts { (error: Error?, contacts:[Contacts]?)  in
//            if let contacts = contacts
//            {
//                self.contacts = contacts
//                self.tableView.reloadData()
//            }
//            
//        }
        API.contacts(view :self.view, completion: {e,contactss in
            
            self.contacts = contactss!
            self.tableView.reloadData()
            
        })
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
        return contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ContactsCustomCell
            else
        {
            return UITableViewCell()
        }

        // Configure the cell...
        
        cell.contact_lbl.text = contacts[indexPath.row].name
        
        let url = URL(string: contacts[indexPath.row].Pic_URL)

        cell.contact_img.kf.setImage(with: url, placeholder: UIImage(named:"username"), options: nil, progressBlock: nil, completionHandler: nil)
        cell.contact_img.layer.cornerRadius = cell.contact_img.frame.width / 2
        cell.contact_img.clipsToBounds = true
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationvc = self.storyboard?.instantiateViewController(withIdentifier: "MessageVC") as! MessageViewController
        destinationvc.Cont_id = contacts[indexPath.row].id
        destinationvc.Cont_name = contacts[indexPath.row].name
        destinationvc.Cont_type = contacts[indexPath.row].type
        self.navigationController?.pushViewController(destinationvc, animated: true)
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

	
