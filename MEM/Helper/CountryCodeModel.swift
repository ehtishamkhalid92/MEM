//
//  CountryCodeModel.swift
//  MEM
//
//  Created by Ehtisham Khalid on 31.07.22.
//

import Foundation

struct CountryCodeModel {
    var flag = String()
    var code = String()
    var countryName = String()
    var countryCode = String()
    
    init(flag: String, code:String,countryName: String,countryCode:String) {
        self.flag = flag
        self.code = code
        self.countryName = countryName
        self.countryCode = countryCode
    }
}
