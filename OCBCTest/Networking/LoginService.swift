//
//  LoginService.swift
//  OCBCTest
//
//  Created by Denny Arfansyah on 02/07/22.
//

import Foundation
import Alamofire

protocol LoginService {
    
    func doLogin(with param: Login, completion: @escaping (Result<LoginRespons, ServerError>) -> Void)
    
}

class LoginServiceImplementation: LoginService {
    
    typealias LoginResult = Result<LoginRespons, ServerError>
    typealias LoginCompletion = (_ result: LoginResult) -> Void
    
    func doLogin(with param: Login, completion: @escaping LoginCompletion) {
        
//        guard let encoded = try? JSONEncoder().encode(param) else { return }
//        let parameters = Request.setParams(data: encoded)
        
        let params = ["username": param.username,
                      "password": param.password]
        
        let url = URL(string: Constant.baseUrl + Constant.login)!
        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseJSON { response in

            print(response)

            switch response.result {
            case .success:
                do {
                    guard let data = response.data else {
                        completion(.failure(.unknownError))
                        return
                    }

                    let response = try JSONDecoder().decode(LoginRespons.self, from: data)
                    completion(.success(response))
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
