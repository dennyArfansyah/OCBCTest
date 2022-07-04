//
//  DashboardViewController.swift
//  OCBCTest
//
//  Created by Denny Arfansyah on 02/07/22.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var balanceView: UIView!
    @IBOutlet weak var transactionHistoryLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var accountNoLabel: UILabel!
    @IBOutlet weak var accountHolderLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatroView: UIActivityIndicatorView!
    
    private(set) var dataSource: DashboardDatasource!
    private(set) var delegate: DashboardDelegate!
    var viewModel: DashboardViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
//        self.dataSource = DashboardDatasource(caller: self, viewModel: viewModel)
        self.delegate = DashboardDelegate(caller: self, viewModel: viewModel)
        
        self.tableView.dataSource = dataSource
        self.tableView.delegate = delegate
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.sectionFooterHeight = 8
        self.tableView.sectionHeaderHeight = 50
    }
    
}

// Actions Handlers
extension DashboardViewController {
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
