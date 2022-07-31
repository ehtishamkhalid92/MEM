//
//  UserModel.swift
//  MEM
//
//  Created by Ehtisham Khalid on 31.07.22.
//

import Foundation

struct UserModel:Codable {
    var userId = String()
    var email = String()
    var name = String()
    var countryCode = String()
    var phoneNumber = String()
}
