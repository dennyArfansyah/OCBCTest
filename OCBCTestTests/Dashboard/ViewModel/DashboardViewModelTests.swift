//
//  DashboardViewModelTests.swift
//  OCBCTestTests
//
//  Created by Denny Arfansyah on 02/07/22.
//

import XCTest
@testable import OCBCTest

class DashboardViewModelTests: XCTestCase {
    
    var vc: DashboardViewController!
    var viewModel: DashboardViewModel!
    var fakeService: MockDashboardService!
    
    override func setUp() {
        super.setUp()
    
        vc = DashboardViewController()
        fakeService = MockDashboardService()
        viewModel = DashboardViewModel(caller: vc, service: fakeService)
        vc.viewModel = viewModel
        vc.loadViewIfNeeded()
    }

    func test_getBalanceGetTransactions_returnSuccess() {
        self.fakeService.balance = Balance.with()
        self.fakeService.transactions = [Transaction.with()]
        self.viewModel.getBalance()
        self.viewModel.getTransactions()
    }

    func test_getBalanceGetTransactions_returnFailure() {
        self.fakeService = nil
        self.viewModel.getBalance()
        self.viewModel.getTransactions()
    }
    
    override func tearDown() {
        self.vc = nil
        self.viewModel = nil
        self.fakeService = nil
        super.tearDown()
    }

}

class MockDashboardService: DashboardService {
    
    var balance: Balance?
    var transactions: [Transaction]?
    
    func fetchBalance(completion: @escaping (Result<Balance, ServerError>) -> Void) {
        if let balance = balance {
            completion(.success(balance))
        } else {
            completion(.failure(ServerError.invalidCredentials))
        }
    }
    
    func fetchTransaction(completion: @escaping (Result<[Transaction], ServerError>) -> Void) {
        if let transactions = transactions {
            completion(.success(transactions))
        } else {
            completion(.failure(ServerError.invalidCredentials))
        }
    }
    
}
