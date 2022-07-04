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
    private(set) var service: DashboardService
    @Published var errorMessage: String!
    @Published var sections = [TransactionSection]()
    
    init(caller: DashboardViewController, service: DashboardService = DashboardServiceImplementation()) {
        self.caller = caller
        self.service = service
        self.getBalance()
        self.getTransactions()
    }
    
    func getBalance() {
//        DispatchQueue.main.async {
//            self.caller.activityIndicatroView.startAnimating()
//        }
        self.service.fetchBalance(completion: { [weak self] result in
            DispatchQueue.main.async {
                self?.caller.activityIndicatroView.stopAnimating()
                self?.caller.activityIndicatroView.isHidden = true
            }
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
        DispatchQueue.main.async {
            self.caller.balanceView.isHidden = false
            self.caller.balanceLabel.text = String(format: "SGD %1.f", balance.balance ?? "0,0")
            self.caller.accountNoLabel.text = String(format: "%@", balance.accountNo)
        }
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
            return Constant.getDay(dateString: transaction.transactionDate)
        }
        sections = groups.map { (key, values) in
            return TransactionSection(date: key, transactions: values)
        }
        sections.sort { (lhr, rhs) in lhr.date > rhs.date }
        DispatchQueue.main.async {
            self.caller.transactionHistoryLabel.isHidden = false
            self.caller.tableView.reloadData()
        }
    }
    
}

