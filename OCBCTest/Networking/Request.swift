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
                   .authorization("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MTZlNzNlMDYyYWY0ZGQ5YmMyYzYxMWQiLCJ1c2VybmFtZSI6InRlc3QiLCJhY2NvdW50Tm8iOiIyOTcwLTExMS0zNjQ4IiwiaWF0IjoxNjU2OTIwNjg1LCJleHAiOjE2NTY5MzE0ODV9.raoNNcQIu6W9Y62xhxVPqf_iNw5fBLIIYstjE8WI8Mo"),
                   .accept("application/json"),
                   .contentType("application/json")
               ]
        return headers
    }
    
}
