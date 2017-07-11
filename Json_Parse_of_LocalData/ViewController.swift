//
//  ViewController.swift
//  Json_Parse_of_LocalData
//
//  Created by mac on 11/07/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let path =  Bundle.main.path(forResource: "usersAPI", ofType: "txt") else {return}
        let url = URL(fileURLWithPath: path)
        do{
            let data = try Data(contentsOf: url)
            print(data)  // print the data size
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            print(json) //print the data into json formate
            
            guard let array = json as? [Any] else {return}
            
            for user in array{
                guard let userDict = user as?  [String:Any] else {return}
                
                guard let addressDict = userDict["address"] as? [String:Any] else{return}
                guard let cityName = addressDict["city"] else {return}
                guard let streetName = addressDict["street"] else {return}
                guard let zipcode = addressDict["zipcode"] else {return}
                guard let geoDict = addressDict["geo"] as? [String:String] else {return}
                guard let latitude = geoDict["lat"] else {return}
                guard let logitude = geoDict["lng"] else {return}
                
                guard let userId = userDict["id"] as? Int else {return}
                guard let name = userDict["name"] as? String else {return}
                guard let email = userDict["email"] as? String else {return}
                guard let companyDict = userDict["company"] as? [String:String] else {return}
                guard let companyName = companyDict["name"] else {return}
                
            
                
                print("User-ID = \(userId)")
                print("User-Name = \(name)")
                print("User-Email = \(email)")
                print("Company-Name = \(companyName)")
                print("City-Name = \(cityName)")
                print("Street-Name = \(streetName)")
                print("ZipCode = \(zipcode)")
                print("LocationCordinate = \(latitude),\(logitude)")
                print(" ")
            }
        }
        catch
        {
            print(error)
        }
    }
}

