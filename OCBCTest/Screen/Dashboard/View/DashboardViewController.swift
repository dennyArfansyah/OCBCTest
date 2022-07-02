//
//  DashboardViewController.swift
//  OCBCTest
//
//  Created by Denny Arfansyah on 02/07/22.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var accountNoLabel: UILabel!
    @IBOutlet weak var accountHolderLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: DashboardViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        viewModel = DashboardViewModel(caller: self)
        
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.register(UINib(nibName: String(describing: TransactionCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TransactionCell.self))
    }
    
}

extension DashboardViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.viewModel.sections[section]
        let date = section.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: date)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = viewModel.sections[section]
        return section.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TransactionCell.self), for: indexPath) as! TransactionCell
        let section = viewModel.sections[indexPath.section]
        let transaction = section.transactions[indexPath.row]
        cell.setData(with: transaction)

        return cell
    }
    
}

// Actions Handlers
extension DashboardViewController {
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
