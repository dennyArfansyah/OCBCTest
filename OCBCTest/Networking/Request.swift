//
//  Request.swift
//  OCBCTest
//
//  Created by Denny Arfansyah on 03/07/22.
//

import Alamofire

struct Request {
    
    static func getAuthorizationHeader() -> HTTPHeaders {
        let token = UserDefaults.standard.string(forKey: Constant.token) ?? ""
        let headers: HTTPHeaders = [
                   .authorization(token),
                   .accept("application/json"),
                   .contentType("application/json")
               ]
        return headers
    }
    
}
