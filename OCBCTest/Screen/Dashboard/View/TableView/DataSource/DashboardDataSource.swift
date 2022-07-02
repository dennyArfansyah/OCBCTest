//
//  DashboardDataSource.swift
//  OCBCTest
//
//  Created by Denny Arfansyah on 02/07/22.
//

import UIKit
import Combine

class DashboardDataSource: NSObject, UITableViewDataSource {
    
    private(set) var caller: DashboardViewController
    private var subscriptions = Set<AnyCancellable>()
    var viewModel: DashboardViewModel!
    var sections = [TransactionSection]()
    
    init(caller: DashboardViewController, viewModel: DashboardViewModel) {
        self.caller = caller
        super.init()
        self.viewModel = viewModel
        self.registerCell()
        self.subsribe()
    }
    
    private func subsribe() {
        subscriptions = [
            viewModel.$sections.sink(receiveValue: { sections in
                self.sections = sections
            })
        ]
    }
    
    private func registerCell() {
        self.caller.tableView.register(UINib(nibName: String(describing: TransactionCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TransactionCell.self))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.viewModel.sections[section]
        let date = section.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: date)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.sections[section]
        return section.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TransactionCell.self), for: indexPath) as! TransactionCell
        let section = self.sections[indexPath.section]
        let transaction = section.transactions[indexPath.row]
        cell.accountHolderLabel?.text = transaction.receipient.accountHolder
        cell.accountNoLabel?.text = transaction.receipient.accountNo
        cell.amountLabel?.text = String(format: "%1.f", transaction.amount)

        return cell
    }
    
}
