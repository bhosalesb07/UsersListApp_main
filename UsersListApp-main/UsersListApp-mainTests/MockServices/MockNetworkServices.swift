//
//  UsersListApp_main.swift
//  UsersListApp-main
//
//  Created by Swapnil B on 09/03/27.
//

import Foundation
@testable import UsersListApp_main

class MockNetworkServices: NetworkServiceProtocol {
    
    var error: NetworkError?
    var mockdata: Decodable?
    
    func fetchUsers<T>(url: String, type: T.Type) async throws -> T {
        if let error = error {
            throw error
        }
        if let data = mockdata as? T {
            return data
        }
        throw NetworkError.requestFailed
    }

}
