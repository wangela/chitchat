//
//  Message.swift
//  chitchat
//
//  Created by Angela Yu on 9/27/17.
//  Copyright © 2017 Angela Yu. All rights reserved.
//

import UIKit
import Parse

// subclassing PFObject will automatically register with Parse SDK now
// See https://github.com/parse-community/Parse-SDK-iOS-OSX/pull/967
class Message2: PFObject, PFSubclassing {
    // properties/fields must be declared here
    // @NSManaged to tell compiler these are dynamic properties
    // See https://stackoverflow.com/questions/31357564/what-does-nsmanaged-do
    @NSManaged var text: String?
    
    // returns the Parse name that should be used
    class func parseClassName() -> String {
        return "Message2"
    }
}
