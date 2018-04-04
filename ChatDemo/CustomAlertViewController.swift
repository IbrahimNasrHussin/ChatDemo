//
//  CustomAlertViewController.swift
//  ChatDemo
//
//  Created by hema on 3/18/18.
//  Copyright © 2018 UDAAR. All rights reserved.
//

import UIKit
import AssetsLibrary
import Photos

class CustomAlertViewController: UIViewController , UINavigationControllerDelegate , UIImagePickerControllerDelegate {
    
    fileprivate let CellIdentifier = "CheckableCell"
    fileprivate let CellHight : CGFloat = 30.0
    var members = [Contacts]()
    
    var choosen_members : [String] = []
    
    @IBOutlet weak var IMG_Name_LBL: UILabel!
    
    @IBOutlet weak var Members_tableview: UITableView!
    
    @IBOutlet weak var Group_Name_TXT: UITextField!
    
    @IBOutlet weak var Group_Img_View: UIImageView!
    
    @IBAction func Choose_IMG_BTN(_ sender: Any)
    {
        let img = UIImagePickerController()
        img.delegate = self
        img.sourceType = UIImagePickerControllerSourceType.photoLibrary
        img.allowsEditing = false
        self.present(img , animated: true)
        {
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            
            Group_Img_View.image = img
        }
        else
        {
            let alertmessage = UIAlertController(title: "Error", message: "Error", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in
                
            })
            alertmessage.addAction(OKAction)
            self.present(alertmessage, animated: true, completion: nil)
        }
        
        if let imageURL = info[UIImagePickerControllerReferenceURL] as? URL {
            let result = PHAsset.fetchAssets(withALAssetURLs: [imageURL], options: nil)
            let asset = result.firstObject
//            print(asset?.value(forKey: "filename"))
            IMG_Name_LBL.text = asset?.value(forKey: "filename") as! String?
            
        }
        Group_Img_View.layer.cornerRadius = Group_Img_View.frame.width / 2
        Group_Img_View.clipsToBounds = true
        
        self.dismiss(animated: true, completion: nil)
        
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var Members_LBL: UILabel!
    
    @IBAction func Create_Group_BTN(_ sender: Any) {
    }
    
    @IBAction func Cancel_BTN(_ sender: Any) {
        
        self.removeFromParentViewController()
        self.view.removeFromSuperview()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Members_tableview.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier)
        Members_tableview.dataSource = self
        Members_tableview.tableFooterView = UIView()
        Members_tableview.separatorInset = .zero
        Members_tableview.contentInset = .zero
        
        handlerefresh()

        // Do any additional setup after loading the view.
    }
    
    private func handlerefresh() {
    
        API.contacts(view :self.view, completion: {e,members in
            if let members = members
            {
                self.members = members
                self.Members_tableview.reloadData()
            }
            
        })
    }
    
}

extension CustomAlertViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        cell.textLabel?.text = members[indexPath.row].name
        
        if cell.isSelected
        {
            cell.accessoryType = .checkmark
        }
        else
        {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var whichRowIsSelected: String = ""
        
        let newcell = Members_tableview.cellForRow(at: indexPath)
        
        if newcell!.isSelected
        {
            newcell!.isSelected = false
            choosen_members.remove(at: choosen_members.index(of: whichRowIsSelected)!)
            
            if newcell!.accessoryType == .none
            {
                newcell!.accessoryType = .checkmark
                whichRowIsSelected = (newcell?.textLabel?.text)!
                choosen_members.append(whichRowIsSelected)
            }
            else
            {
                newcell!.accessoryType = .none
                choosen_members.remove(at: choosen_members.index(of: whichRowIsSelected)!)
            }
        }
        
    }

}

extension CustomAlertViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CellHight
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

public enum ImageFormat {
    case PNG
    case JPEG(CGFloat)
}

extension UIImage {
    public func ConvertToBase64(format: ImageFormat , image: UIImage) -> String {
        var imageData: Data
        switch format {
        case .PNG: imageData = UIImagePNGRepresentation(image)!
        case .JPEG(let compression): imageData = UIImageJPEGRepresentation(image , compression)!
        }
        return imageData.base64EncodedString()
    }
}




