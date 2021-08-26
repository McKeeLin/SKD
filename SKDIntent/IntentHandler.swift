//
//  IntentHandler.swift
//  SKDIntent
//
//  Created by McKee on 2021/8/9.
//

import Intents
import UIKit
import os.log

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        print("IntentHandler: handler")
        os_log("SKD_LOG IntentHandler: handler")
        var indent: ClockInIntent?
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        let alert=UIAlertController(title: "tips", message: "handler for intent", preferredStyle: .alert)
        let cancel=UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(cancel)
        print(#function)
        print(intent)
        
        return self
    }
    
//    func handle(intent: ClockInIntent, completion: @escaping (ClockInIntentResponse) -> Void) {
//        // Implement your application logic to send a message here.
//        print("IntentHandler: handle...")
//        let userActivity = NSUserActivity(activityType: NSStringFromClass(IntentHandler.self))
//        let response = ClockInIntentResponse(code: .success, userActivity: userActivity)
//        completion(response)
//    }
//
}
