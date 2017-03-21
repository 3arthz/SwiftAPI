//
//  ItemAPI.swift
//  SurveyApiTest
//
//  Created by 3arthzneiz on 3/21/2560 BE.
//  Copyright © 2560 nimbl3test. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ItemAPI:NSObject {
    var Name : [String] = []
    var Description: [String] = []
    var ImageURL: [String] = []
    //Endpoint URL
    func endpointForFeed() -> String {
        
        let accesstoken = "e586a548ff83a931da99da48aeb829702940116a2ee48774eea2862b0427767f"
        let endpoint = "https://nimbl3-survey-api.herokuapp.com/surveys.json?page=1&per_page=10&access_token=" + accesstoken
        return endpoint
    }
    //Get Data using Alamofire
    func getFeedItems(completionHandler: @escaping (NSError?) -> ()) {
        
        Alamofire.request(self.endpointForFeed()).responseJSON { response in
            let result = response.result.value
            if let elements = result as? NSArray{
                for obj in elements{
                    if let data = obj as? Dictionary<String,AnyObject>{
                        self.Name.append(data["title"] as! String)
                        self.Description.append(data["description"] as! String)
                        self.ImageURL.append(data["cover_image_url"] as! String)
                    }
                }
                
                
                
            }
            completionHandler(nil)
        }
    }
    
}
