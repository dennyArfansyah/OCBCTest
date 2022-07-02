//
//  Transaction.swift
//  OCBCTest
//
//  Created by Denny Arfansyah on 02/07/22.
//

import Foundation

struct Transaction: Codable {
    
    var transactionId: String
    var amount: Double
    var transactionDate: String
    var description: String?
    var transactionType: String
    var receipient: Receipient
    
}

struct Transactions: Codable {
    
    var status: String
    var data: [Transaction]
    
}
