//
//  DashboardViewModel.swift
//  OCBCTest
//
//  Created by Denny Arfansyah on 02/07/22.
//

import UIKit
import Combine

class DashboardViewModel {
    
    private(set) var caller: DashboardViewController
    var service: DashboardServiceImplementation
    var errorMessage: String!
    @Published private(set) var sections = [TransactionSection]()
    
    init(caller: DashboardViewController, service: DashboardServiceImplementation = DashboardServiceImplementation()) {
        self.caller = caller
        self.service = service
        self.getBalance()
        self.getTransactions()
    }
    
    func getBalance() {
        self.service.fetchBalance(completion: { [weak self] result in
            switch result {
            case .success(let balance):
                self?.setBalance(with: balance)
            case .failure(let error):
                print(error.localizedDescription)
                self?.errorMessage = error.localizedDescription
            }
        })
    }
    
    func setBalance(with balance: Balance) {
        caller.balanceLabel.text = String(format: "SGD %1.f", balance.balance ?? "0,0")
        caller.accountNoLabel.text = String(format: "%@", balance.accountNo)
    }
    
    func getTransactions() {
        self.service.fetchTransaction(completion: { [weak self] result in
            switch result {
            case .success(let transactions):
                self?.setTransactions(with: transactions)
            case .failure(let error):
                print(error.localizedDescription)
                self?.errorMessage = error.localizedDescription
            }
        })
    }
    
    func setTransactions(with transactions: [Transaction]) {
        let groups = Dictionary(grouping: transactions) { transaction in
            return getDay(dateString: transaction.transactionDate)
        }
        sections = groups.map { (key, values) in
            return TransactionSection(date: key, transactions: values)
        }
        sections.sort { (lhr, rhs) in lhr.date > rhs.date }
        caller.tableView.reloadData()
    }
    
    func getDay(dateString: String) -> Date {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = inputDateFormatter.date(from: dateString)
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date ?? Date())
        return calendar.date(from: components)!
    }
    
}

