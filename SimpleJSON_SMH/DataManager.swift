//
//  DataManager.swift
//  SimpleJSON_SMH
//
//  Created by Sean Halstead on 3/4/19.
//  Copyright © 2019 Sean Halstead. All rights reserved.
//

import UIKit

class DataManager: NSObject {

    func getData() {
        
        let URLString = "https://api.myjson.com/bins/136w0u"
        
        let actualURL = URL(string: URLString)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with:  actualURL!) { ( data, response, error) in
            
            if error != nil {
                // handle eerror
            }
            
            if let successfulData = data {
                print(String(data: successfulData, encoding: String.Encoding.ascii))
                
                
            }
        }
        task.resume()
    }
}
