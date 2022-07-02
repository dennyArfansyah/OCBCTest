//
//  Request.swift
//  OCBCTest
//
//  Created by Denny Arfansyah on 03/07/22.
//

import Alamofire

struct Request {
    
    static func setParams(data: Data?) -> Parameters? {
        if let d = data {
            do {
                return try JSONSerialization.jsonObject(with: d , options: []) as? [String : Any]
            } catch {
                return nil
            }
        }
        return nil
    }
    
    static func getAuthorizationHeader() -> HTTPHeaders {
        let headers: HTTPHeaders = [
                   .authorization("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MTZlNzNlMDYyYWY0ZGQ5YmMyYzYxMWQiLCJ1c2VybmFtZSI6InRlc3QiLCJhY2NvdW50Tm8iOiIyOTcwLTExMS0zNjQ4IiwiaWF0IjoxNjU2NzgyNzc5LCJleHAiOjE2NTY3OTM1Nzl9.PTRS6yy-KgYlrEm6mN36FZT_orWXbxinvcPqzA0NdK8"),
                   .accept("application/json"),
                   .contentType("application/json")
               ]
        return headers
    }
    
}
