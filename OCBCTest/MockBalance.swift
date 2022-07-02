//
//  MockBalance.swift
//  OCBCTestTests
//
//  Created by Denny Arfansyah on 02/07/22.
//

import Foundation

extension Balance {
    
    static func with(status: String = "success",
                     accountNo: String = "2970-111-3648",
                     balance: Double? = 0.0) -> Balance {
        return Balance(status: status, accountNo: accountNo, balance: balance)
    }
    
}

extension Transaction {
    
    static func with(transactionId: String = "622cb8b68c7f3a5bcccf8ba4", amount: Double = 1.0,
                     transactionDate: String = "2022-03-12T15:13:58.927Z", description: String = "testing",
                     transactionType: String = "transfer", receipient: Receipient = Receipient.with()) -> Transaction {
        return Transaction(transactionId: transactionId, amount: amount, transactionDate: transactionDate, description: description, transactionType: transactionType, receipient: receipient)
    }
    
}

extension Receipient {
    
    static func with(accountNo: String = "6554-630-9653", accountHolder: String = "Andy") -> Receipient {
        return Receipient(accountNo: accountNo, accountHolder: accountHolder)
    }
}
