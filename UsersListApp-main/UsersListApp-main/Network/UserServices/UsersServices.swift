//
//  UsersServices.swift
//  UsersListApp-main
//
//  Created by Mac on 27/03/26.
//

import Foundation


class UsersServices: UsersServicesProtocol {
    
    private var networkService : NetworkServiceProtocol
    
    init(networkServices: NetworkServiceProtocol = NetworkServices()) {
        self.networkService = networkServices
    }
    
    func loadUsers() async throws -> [Users] {
        return try await networkService.fetchUsers(url: APIEndpoints.getUsers, type: [Users].self)
    }
}
