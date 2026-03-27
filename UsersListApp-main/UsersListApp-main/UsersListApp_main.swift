//
//  UsersListApp_main.swift
//  UsersListApp-main
//
//  Created by Mac on 23/03/26.
//

import SwiftUI

@main
struct UsersListApp_main: App {
    var body: some Scene {
        WindowGroup {
            let vm = UserListViewModel(userService: UsersServices())
            UsersListView(viewModel: vm)
        }
    }
}
