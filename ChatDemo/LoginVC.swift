//
//  ViewController.swift
//  ChatDemo
//
//  Created by hema on 2/11/18.
//  Copyright © 2018 UDAAR. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginVC: UIViewController {
    
    let tabbar: UITabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainVC") as! UITabBarController
    
    @IBOutlet weak var UserIMG: UIImageView!
    
    @IBOutlet weak var PasswordIMG: UIImageView!
    
    @IBOutlet weak var EmailTF: UITextField!
    
    @IBOutlet weak var PasswordTF: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        EmailTF.text = "pm@udaar.org"
        PasswordTF.text = "123456"
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    
    @IBAction func LoginPressed(_ sender: UIButton) {
        
        guard let Email = EmailTF.text , !Email.isEmpty else {return}
        guard let Password = PasswordTF.text , !Password.isEmpty else {return}
        API.login(email: Email, password: Password) { (error: Error?, sucess: Bool) in
            if sucess
            {
                // say hello
                Helper.RestartApp()
            }
            else
            {                
                let alert = UIAlertController(title: "Invalid", message: "Enter a correct email and password", preferredStyle: UIAlertControllerStyle.alert)
                
                let OKAction = UIAlertAction(title: "OK",style: .default, handler:{(action) in
                    alert.dismiss(animated: true, completion: nil)
                })
                alert.addAction(OKAction)
                self.present(alert, animated: true, completion: nil)

            }
        }
        
    }

}

