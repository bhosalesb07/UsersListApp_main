//
//  UsersListApp_main.swift
//  UsersListApp-main
//
//  Created by Swapnil B on 09/03/27.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchUsers<T: Decodable>(url: String,type: T.Type) async throws -> T
}

protocol UsersListViewModelProtocol {
    func loadUsers() async
}

protocol UsersServicesProtocol {
    func loadUsers() async throws -> [Users]
}
