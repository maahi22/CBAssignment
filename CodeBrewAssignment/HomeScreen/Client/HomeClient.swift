//
//  HomeClient.swift
//  CodeBrewAssignment
//
//  Created by Maahi on 12/10/18.
//  Copyright © 2018 KTek. All rights reserved.
//

import UIKit

class HomeClient: NSObject {

    // MARK: - Injections
    internal let networkClient = NetworkClient.shared
    
    //pick up date
    func getPickUpDate(completion:@escaping (HomeDataModel?,String)->())  {
        
        
        
        let apiname = BASE_URL + "\(Home_URL)"
        
        
      /*  networkClient.callAPIWithAlamofire(apiname: apiname,
                                           requestType: .get,
                                           params: nil,
                                           headers: nil,
                                           success: { (data, httpResponse) in
                                            
                                            if let homeDataModel = decodeJSON(type: HomeDataModel.self, from: data) {
                                                completion(homeDataModel, "Success")
                                            }
                                            else if let messageModel = decodeJSON(type: MessageModel.self, from: data) {
                                                completion(nil, messageModel.Message ?? "")
                                            }
                                                
                                            else{
                                                completion(nil,"failed")
                                            }
                                            
        }) { (error, message) in
            
            completion(nil,message)
            
        }*/
        networkClient.callAPIWithAlamofire(apiname: apiname,
                                           requestType: .post,
                                           params: nil,
                                           headers: nil,
                                           success: { (data, httpResponse) in
                                            
                                            print("STATUS . \(httpResponse.statusCode)")
                                            
                                            if let homeModel = decodeJSON(type: HomeDataModel.self, from: data) {
                                                
                                                
                                                completion(homeModel, "Success")
                                            }
                                            else if let messageModel = decodeJSON(type: MessageModel.self, from: data) {
                                                completion(nil, messageModel.Message ?? "Parsing error")
                                            }
                                                
                                            else{
                                                completion(nil,"failed")
                                            }
                                            
        }) { (error, message) in
            
            completion(nil,message)
            
        }
    }
    
    
    
    
}
