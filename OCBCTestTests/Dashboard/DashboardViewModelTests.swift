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
    
    override func setUp() {
        super.setUp()
        vc = DashboardViewController()
        vc.loadViewIfNeeded()
        viewModel = DashboardViewModel(caller: vc)
    }

    func test_getBalanceGetTransactions_returnSuccess() {
        let service = MockDashboardService()
        service.fetchBalanceResult = .success(Balance.with())
        service.fetchTransactionsResult = .success([Transaction.with()])

        let viewModel = DashboardViewModel(caller: vc, service: service)
        viewModel.getBalance()
        viewModel.getTransactions()
    }

    func test_getBalanceGetTransactions_returnFailure() {
        let service = MockDashboardService()
        service.fetchBalanceResult = .failure(ServerError.invalidCredentials)
        service.fetchTransactionsResult = .failure(ServerError.invalidCredentials)

        let viewModel = DashboardViewModel(caller: vc, service: service)
        viewModel.getBalance()
        viewModel.getTransactions()
    }

}

class MockDashboardService: DashboardServiceImplementation {
    
    var fetchBalanceResult: DashboardServiceImplementation.BalanceResult? = nil
    var fetchTransactionsResult: DashboardServiceImplementation.TransactionsResult? = nil
    
    override func fetchBalance(completion: @escaping DashboardServiceImplementation.BalanceCompletion) {
        completion(fetchBalanceResult!)
    }
    
    override func fetchTransaction(completion: @escaping DashboardServiceImplementation.TransactionsCompletion) {
        completion(fetchTransactionsResult!)
    }

}
