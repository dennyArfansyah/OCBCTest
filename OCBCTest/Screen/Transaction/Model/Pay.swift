//
//  Pay.swift
//  OCBCTest
//
//  Created by Denny Arfansyah on 02/07/22.
//

import Foundation

struct Pay: Codable {
    
    var id: String
    var name: String
    var accountNo: String
    
}

struct Payes: Codable {
    
    var status: String
    var data: [Pay]?
    
}
