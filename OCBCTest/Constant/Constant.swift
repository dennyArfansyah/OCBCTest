//
//  Constant.swift
//  OCBCTest
//
//  Created by Denny Arfansyah on 02/07/22.
//

import Foundation

struct Constant {
    
    static let baseUrl = "https://green-thumb-64168.uc.r.appspot.com/"
    
    static let username = "Username"
    static let password = "Password"
    
    static let login = "login"
    static let register = "register"
    static let transaction = "transactions"
    static let balance = "balance"
    static let payees = "payess"
    static let transfer = "transfer"
    
    static let token = "token"
    static let transactionHeaderDateFormat = "dd MMM yyyy"
    static let isoFormatDate = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    
    static let notAvailable = "Not avaible yet"
    static let usernameRequired = "Username is required, at least 5 char"
    static let passwordRequired = "Password is required, at least 5 char"
    
    static func getDay(dateString: String) -> Date {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = isoFormatDate
        let date = inputDateFormatter.date(from: dateString)
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date ?? Date())
        return calendar.date(from: components)!
    }
    
    static func getHeaderTitle(with section: TransactionSection) -> String {
        let date = section.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = transactionHeaderDateFormat
        return dateFormatter.string(from: date)
    }
    
}
