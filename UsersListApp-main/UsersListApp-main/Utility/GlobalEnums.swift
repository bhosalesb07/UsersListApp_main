//
//  UsersListApp_main.swift
//  UsersListApp-main
//
//  Created by Swapnil B on 09/03/27.
//

import Foundation

enum DataLoadingStates<T>{
    case idle
    case loading
    case loaded(T)
    case failure(Error)
}
