//
//  UsersListApp_main.swift
//  UsersListApp-main
//
//  Created by Swapnil B on 09/03/27.
//

import Foundation
@MainActor
class UserListViewModel: ObservableObject, UsersListViewModelProtocol {
    
    @Published private(set) var loadingState: DataLoadingStates<[Users]> = .idle
    
    
    var userService: UsersServicesProtocol
    init(userService: UsersServicesProtocol) {
        self.userService = userService
    }
    
    
    func loadUsers() async {
        loadingState = .loading
        
        do {
            loadingState = .loaded(try await userService.loadUsers())
        } catch{
            loadingState = .failure(error)
        }
    }
}
