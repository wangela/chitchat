//
//  ChatViewController.swift
//  chitchat
//
//  Created by Angela Yu on 9/27/17.
//  Copyright © 2017 Angela Yu. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {
    @IBOutlet weak var messageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSendButton(_ sender: Any) {
        let message = Message()
        message.text = messageTextField.text
        message.saveInBackground(block: { (success, error) in
            if (success) {
                // The object has been saved.
                print("message saved. \(message.text)")
            } else {
                // There was a problem, check error.description
                print("error: \(error?.localizedDescription)")
            }
        })
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

// subclassing PFObject will automatically register with Parse SDK now
// See https://github.com/parse-community/Parse-SDK-iOS-OSX/pull/967
class Message: PFObject, PFSubclassing {
    // properties/fields must be declared here
    // @NSManaged to tell compiler these are dynamic properties
    // See https://stackoverflow.com/questions/31357564/what-does-nsmanaged-do
    @NSManaged var text: String?
    
    // returns the Parse name that should be used
    class func parseClassName() -> String {
        return "Message"
    }
}
