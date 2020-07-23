//
//  HttpTask.swift
//  DoctorAppointment
//
//  Created by Salihcan Kahya on 23.07.2020.
//  Copyright © 2020 Salihcan Kahya. All rights reserved.
//

import Foundation
import Alamofire

class HttpTask{
    
    
    func GetRequest(url : String, callback : @escaping ([Doctor]?)->Void) {
        AF.request(url,method: .get).response { res in
            if let data = res.data {
                do{
                     let doctors : [Doctor] = try JSONDecoder().decode([Doctor].self, from: data)
                     callback(doctors)
                }catch {
                     callback(nil)
                }
            }
        }
    }
    
    
    
    
}
