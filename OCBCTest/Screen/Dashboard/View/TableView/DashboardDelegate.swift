//
//  DashboardDelegate.swift
//  OCBCTest
//
//  Created by Denny Arfansyah on 04/07/22.
//

import UIKit
import Combine

class DashboardDelegate: NSObject, UITableViewDelegate {
    
    private(set) var caller: DashboardViewController
    private(set) var viewModel: DashboardViewModel!
    private var subscriptions = Set<AnyCancellable>()
    private(set) var sections = [TransactionSection]()
    
    init(caller: DashboardViewController, viewModel: DashboardViewModel) {
        self.caller = caller
        self.viewModel = viewModel
        super.init()
        self.subscription()
    }
    
    func subscription() {
        self.subscriptions = [
            self.viewModel.$sections.sink(receiveValue: { value in
                self.sections = value
            })
        ]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .lightGray
        headerView.layer.cornerRadius = 8
        headerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        let dayLabel = UILabel()
        dayLabel.text = Constant.getHeaderTitle(with: self.sections[section])
        dayLabel.textColor = .black
        dayLabel.font = UIFont.boldSystemFont(ofSize: 17)
        dayLabel.frame = CGRect(x: 16, y: 0, width: 250, height: 50)
        headerView.addSubview(dayLabel)

        return headerView
    }
    
}

