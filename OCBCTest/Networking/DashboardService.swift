//
//  DashboardService.swift
//  OCBCTest
//
//  Created by Denny Arfansyah on 02/07/22.
//

import Foundation
import Alamofire

protocol DashboardService {
    
    func fetchBalance(completion: @escaping (Result<Balance, ServerError>) -> Void)
    func fetchTransaction(completion: @escaping (Result<[Transaction], ServerError>) -> Void)
    
}

class DashboardServiceImplementation: DashboardService {
    
    typealias BalanceResult = Result<Balance, ServerError>
    typealias BalanceCompletion = (_ result: BalanceResult) -> Void
    
    func fetchBalance(completion: @escaping BalanceCompletion) {
        let url = URL(string: Constant.baseUrl + Constant.balance)!
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: Request.getAuthorizationHeader(), interceptor: nil, requestModifier: nil).responseJSON { response in

            print(response)

            switch response.result {
            case .success:
                do {
                    guard let data = response.data else {
                        completion(.failure(.unknownError))
                        return
                    }

                    let balance = try JSONDecoder().decode(Balance.self, from: data)
                    completion(.success(balance))
                } catch {
                    if let statusCode = response.response?.statusCode {
                        completion(.failure(ServerError(code: statusCode)))
                    }
                }
            case .failure(_):
                if let statusCode = response.response?.statusCode {
                    completion(.failure(ServerError(code: statusCode)))
                }
                completion(.failure(.unknownError))
            }

        }
    }
    
    typealias TransactionsResult = Result<[Transaction], ServerError>
    typealias TransactionsCompletion = (_ result: TransactionsResult) -> Void
    
    func fetchTransaction(completion: @escaping TransactionsCompletion) {
        let url = URL(string: Constant.baseUrl + Constant.transaction)!
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: Request.getAuthorizationHeader(), interceptor: nil, requestModifier: nil).responseJSON { response in

            print(response)
            
            switch response.result {
            case .success:
                do {
                    guard let data = response.data else {
                        completion(.failure(.unknownError))
                        return
                    }
                    
                    let result = try JSONDecoder().decode(Transactions.self, from: data)
                    let transactions = result.data.map { return Transaction(transactionId: $0.transactionId, amount: $0.amount,
                                                                            transactionDate: $0.transactionDate, description: $0.description, transactionType: $0.transactionType, receipient: $0.receipient) }
                    completion(.success(transactions))
                } catch {
                    if let statusCode = response.response?.statusCode {
                        completion(.failure(ServerError(code: statusCode)))
                    }
                }
            case .failure(_):
                if let statusCode = response.response?.statusCode {
                    completion(.failure(ServerError(code: statusCode)))
                }
                completion(.failure(.unknownError))
            }

        }
    }
    
}
