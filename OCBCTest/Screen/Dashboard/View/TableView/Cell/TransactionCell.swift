//
//  TransactionCell.swift
//  OCBCTest
//
//  Created by Denny Arfansyah on 03/07/22.
//

import UIKit

class TransactionCell: UITableViewCell {
    
    
    @IBOutlet weak var accountNoLabel: UILabel!
    @IBOutlet weak var accountHolderLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(with transaction: Transaction) {
        accountHolderLabel?.text = transaction.receipient.accountHolder
        accountNoLabel?.text = transaction.receipient.accountNo
        amountLabel?.text = String(format: "%1.f", transaction.amount)
    }
    
}
