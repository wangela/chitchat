//
//  ChatViewController.swift
//  chitchat
//
//  Created by Angela Yu on 9/27/17.
//  Copyright © 2017 Angela Yu. All rights reserved.
//

import UIKit
import Parse
import ParseLiveQuery

class ChatViewController: UIViewController {
    @IBOutlet weak var messagesTableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set up Parse Live Query
        // make sure to declare both client and subscriptions variables outside lifecycle methods
        // otherwise, websocket delegate methods won't fire
        var client : ParseLiveQuery.Client!
        var subscription : Subscription<Message>!
        
        override func viewDidLoad() {
            var chatQuery: PFQuery<Message> {
                return (Message.query()!
                    .whereKeyExists("text")
                    //.order(byAscending: "createdAt")) as! PFQuery<Armor>
            }
            client = ParseLiveQuery.Client()
            subscription = client.subscribe(chatQuery)
                // handle creation events, we can also listen for update, leave, enter events
                .handle(Event.created) { _, message in
                    print("error")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSendButton(_ sender: Any) {
        let message = PFObject(className: "Message")
        message["text"] = messageTextField.text
        message.saveInBackground(block: { (success, error) in
            if (success) {
                // The object has been saved.
                print("message saved. \(message["text"])")
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

//// subclassing PFObject will automatically register with Parse SDK now
//// See https://github.com/parse-community/Parse-SDK-iOS-OSX/pull/967
//class Message: PFObject, PFSubclassing {
//    // properties/fields must be declared here
//    // @NSManaged to tell compiler these are dynamic properties
//    // See https://stackoverflow.com/questions/31357564/what-does-nsmanaged-do
//    @NSManaged var text: String?
//
//    // returns the Parse name that should be used
//    class func parseClassName() -> String {
//        return "Message"
//    }
//}

