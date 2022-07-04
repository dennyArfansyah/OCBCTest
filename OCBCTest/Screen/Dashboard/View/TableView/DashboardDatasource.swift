//
//  DashboardDatasource.swift
//  OCBCTest
//
//  Created by Denny Arfansyah on 04/07/22.
//

import UIKit
import Combine
import Toast_Swift

class DashboardDatasource: NSObject, UITableViewDataSource {
    
    private(set) var caller: DashboardViewController
    private(set) var viewModel: DashboardViewModel!
    private var subscriptions = Set<AnyCancellable>()
    private(set) var sections = [TransactionSection]()
    
    init(caller: DashboardViewController, viewModel: DashboardViewModel) {
        self.caller = caller
        self.viewModel = viewModel
        super.init()
        self.subscription()
        self.registerCell()
    }
    
    func subscription() {
        self.subscriptions = [
            self.viewModel.$sections.sink(receiveValue: { value in
                self.sections = value
            }),
            self.viewModel.$errorMessage.sink(receiveValue: { value in
                if !(value?.isEmpty ?? false) {
                    self.caller.view.makeToast(value)
                }
            })
        ]
    }
    
    private func registerCell() {
        self.caller.tableView.register(UINib(nibName: TransactionCell.reusedIdentifier, bundle: nil), forCellReuseIdentifier: TransactionCell.reusedIdentifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Constant.getHeaderTitle(with: self.sections[section])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.sections[section]
        return section.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionCell.reusedIdentifier, for: indexPath) as! TransactionCell
        cell.selectionStyle = .none
        let section = self.sections[indexPath.section]
        let transaction = section.transactions[indexPath.row]
        cell.setData(with: transaction)
        return cell
    }
    
}
