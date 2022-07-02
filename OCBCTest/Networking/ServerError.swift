//
//  ServerError.swift
//  OCBCTest
//
//  Created by Denny Arfansyah on 02/07/22.
//

import Foundation

enum ServerError: Error {
    
    case unknownError
    case invalidCredentials
    case notFound
    case serverError

    init(code : Int) {
        switch code {
        case 400...402:
            self = .invalidCredentials
        case 404:
            self = .notFound
        case 500:
            self = .serverError
        default:
            self = .unknownError
        }
    }
    
}

extension ServerError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .unknownError:
            return "Unknown error"
        case .invalidCredentials:
            return "Invalid Credentials"
        case .notFound:
            return "Not Found"
        case .serverError:
            return "Server Error"
        default :
            return "Unkown Error"
        }
    }
    
}
