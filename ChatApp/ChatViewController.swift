//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Ruchit Mehta on 10/26/16.
//  Copyright © 2016 Dhara Bavishi. All rights reserved.
//

import UIKit
import Parse
class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageTextFeild: UITextField!
    
    var messages: [PFObject]?
    
    @IBAction func sendButtonClick(_ sender: AnyObject) {
       
        let messageText  = messageTextFeild.text
        
        let message = PFObject(className:"Message")
        message["text"] = messageText
        message.saveInBackground {
            (success: Bool, error: Error?) -> Void in
            if (success) {
                // The object has been saved.
                self.messageTextFeild.text = ""
            } else {
                // There was a problem, check error.description
                print(error?.localizedDescription)
            }
        }


    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chat"
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(reloadMessages), userInfo: nil, repeats: true)
    }
    
    func reloadMessages() {
        let query = PFQuery(className:"Message")
        query.order(byDescending: "createAt")
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    self.messages = objects
                    self.tableView.reloadData()
                }
            } else {
                // Log details of the failure
                print("Error: \(error!)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let messages = messages {
            return messages.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        let object = (messages?[indexPath.row])! as PFObject
        var messageText: String = ""
        if let text = object["text"] as? String {
            messageText = text
        }
        cell.messageLabel.text = messageText
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
