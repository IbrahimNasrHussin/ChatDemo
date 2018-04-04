//
//  GroupsVC.swift
//  ChatDemo
//
//  Created by hema on 2/11/18.
//  Copyright © 2018 UDAAR. All rights reserved.
//

import UIKit

class GroupsVC: UITableViewController {

    fileprivate let reuseIdentifier = "GroupsCell"
    
    var groups = [Groups]()

    lazy var refresher:UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handlerefresh), for: .valueChanged)
        return refresher
    }()
    
    
    @IBAction func Create_Group(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CustomAlertViewController") as! CustomAlertViewController
        vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChildViewController(vc)
        self.view.addSubview(vc.view)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Groups"
        tableView.tableFooterView = UIView()
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.contentInset = UIEdgeInsets.zero
        tableView.addSubview(refresher)
        handlerefresh()
        call_api()
        
    }
    
    @objc private func handlerefresh() {
        self.refresher.endRefreshing()
        call_api()
     
    }
    func call_api()
    {
        API.groups(view: self.view, completion: { (error: Error?, groups:[Groups]?) in
            if let groups = groups
            {
                self.groups = groups
                
                self.tableView.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! GroupsCustomCell
        

        // Configure the cell...
        
        cell.GroupNameLabel.text = groups[indexPath.row].group_name
      
            let url = URL(string: groups[indexPath.row].group_Pic_URL)
        cell.GroupIMG.kf.setImage(with: url, placeholder: UIImage(named:"group"), options: nil, progressBlock: nil, completionHandler: nil)//setImage(with: url)
        cell.GroupIMG.layer.cornerRadius = cell.GroupIMG.frame.width / 2
        cell.GroupIMG.clipsToBounds = true

        return cell
    }

    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let gros = groups[indexPath.row]
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action : UITableViewRowAction, indexpath: IndexPath) in
            self.handleDelete(gros : gros , indexpath: indexPath)
        }
        deleteAction.backgroundColor = .red
        
        
        let editPicAction = UITableViewRowAction(style: .default, title: "EditPicture") { (action : UITableViewRowAction, indexpath : IndexPath) in
        }
        editPicAction.backgroundColor = .blue
        
        let renameAction = UITableViewRowAction(style: .default, title: "Rename") { (action : UITableViewRowAction, indexpath : IndexPath) in
        }
        renameAction.backgroundColor = .gray
        
        
        return [deleteAction , editPicAction , renameAction]
    }
    private func handleDelete(gros : Groups, indexpath : IndexPath)
    {
        
    }
    private func handleRename(indexpath : IndexPath)
    {
        
    }
    private func handelEditPic(indexpath : IndexPath)
    {
        
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
