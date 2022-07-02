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

extension LoginRespons {
    
    static func with(status: String = "success",
                     token: String = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MTZlNzNlMDYyYWY0ZGQ5YmMyYzYxMWQiLCJ1c2VybmFtZSI6InRlc3QiLCJhY2NvdW50Tm8iOiIyOTcwLTExMS0zNjQ4IiwiaWF0IjoxNjU2NzkyNjE2LCJleHAiOjE2NTY4MDM0MTZ9.eK_flipTtPCrl8113N2hjqjW06RLcFDjaw_XMoWyMw4",
                     username: String = "test",
                     accountNo: String = "2970-111-3648") -> LoginRespons {
        return LoginRespons(status: status, token: token, username: username, accountNo: accountNo)
        
    }
}

extension Login {
    
    static func with(username: String = "test", password: String = "asdasd") -> Login {
        return Login(username: username, password: password)
    }
}
