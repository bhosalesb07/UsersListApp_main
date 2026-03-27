//
//  UsersListApp_main.swift
//  UsersListApp-main
//
//  Created by Swapnil B on 09/03/27.
//

import SwiftUI

struct UsersListView: View {
    @StateObject var viewModel: UserListViewModel
    var body: some View {
        NavigationStack{
            Group{
                VStack{
                    switch viewModel.loadingState {
                    case .idle,.loading:
                        ContentUnavailableView("", image: "person.fill")
                        ProgressView("Loading...")
                    case .loaded(let userList):
                        List(userList) { user in
                            Text(user.name)
                        }
                    case .failure(let error):
                        ContentUnavailableView(error.localizedDescription, systemImage: "person.crop.circle.badge.exclamationmark")
                    }
                   
                }
            }
            .navigationTitle("Users")
        }
        .task {
            await viewModel.loadUsers()
        }
    }
}

#Preview {
    let vm = UserListViewModel(userService: UsersServices())
    UsersListView(viewModel: vm)
}
