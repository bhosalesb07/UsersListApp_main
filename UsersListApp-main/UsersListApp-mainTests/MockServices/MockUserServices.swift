//
//  MockUserServices.swift
//  UsersListApp-mainTests
//
//  Created by Mac on 27/03/26.
//

import Foundation
@testable import UsersListApp_main

class MockUserService: UsersServicesProtocol {
   
    var mockUser: [Users] = []
    var showFail = false
    
    func loadUsers() async throws -> [Users] {
        if showFail {
            throw URLError(.notConnectedToInternet)
        }
        return mockUser
    }
}
