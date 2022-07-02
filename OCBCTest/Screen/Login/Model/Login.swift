//
//  Login.swift
//  OCBCTest
//
//  Created by Denny Arfansyah on 02/07/22.
//

import Foundation

struct Login: Codable {
    
    var username: String
    var password: String
    
}

struct LoginRespons: Codable {
    
    var status: String
    var token: String
    var username: String
    var accountNo: String
    
}
