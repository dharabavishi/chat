//
//  ViewController.swift
//  ChatApp
//
//  Created by Ruchit Mehta on 10/26/16.
//  Copyright © 2016 Dhara Bavishi. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func onLogin(_ sender: AnyObject) {
        let username = emailTextField.text
        let password = passwordTextField.text
        
        
        PFUser.logInWithUsername(inBackground: username!, password: password!) { (user: PFUser?, error: Error?) in
            
            if let error = error {
                print("error")
                print(error.localizedDescription)
            } else {
                // Hooray! Let them use the app now.
                print("success")
//                let chat = ChatViewController(nibName: "ChatViewController", bundle: nil)
//                self.present(chat, animated: true, completion: { 
//                    
//                })
                self.performSegue(withIdentifier: "ChatViewController", sender: nil)
            }
        }
        
    }
    
    @IBAction func onSignUp(_ sender: AnyObject) {
        let user = PFUser()
        user.username = emailTextField.text
        user.password = passwordTextField.text
        
        user.signUpInBackground { (succeeded: Bool, error: Error?) -> Void in
            if let error = error {
                print("error")
                //                let errorString = error.userInfo["error"] as? String
                // Show the errorString somewhere and let the user try again.
            } else {
                // Hooray! Let them use the app now.
                print("success")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

