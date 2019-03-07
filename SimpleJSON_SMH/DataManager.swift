//
//  DataManager.swift
//  SimpleJSON_SMH
//
//  Created by Sean Halstead on 3/4/19.
//  Copyright © 2019 Sean Halstead. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    let MYJSONURL = "https://api.myjson.com/bins/r2zw6"
    
    var dataArray = ["No data yet, Captain!"]

    func getData(completion: @escaping (_ success: Bool) -> ()) {
        
        var success = true
        
        let actualURL = URL(string: MYJSONURL)
        
        let task = URLSession.shared.dataTask(with: actualURL!) { (data, response, error) in
            
            if let _ = data, error == nil {
                if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                    if let veggieArray = jsonObj!.value(forKey: "games") as? Array<String> {
                        self.dataArray = veggieArray
                    
                        print(jsonObj!.value(forKey: "games")!)
                    }
                }
            
            } else {
                success = false
            }
        
            completion(success)
            }
            task.resume()
    }
}
