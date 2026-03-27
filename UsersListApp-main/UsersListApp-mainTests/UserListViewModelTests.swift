//
//  UsersListApp_main.swift
//  UsersListApp-main
//
//  Created by Swapnil B on 09/03/27.
//

import XCTest
@testable import UsersListApp_main

@MainActor
final class UserListViewModelTests: XCTestCase {

    var sut : UserListViewModel!
    var mockService: MockUserService!
    
    override func setUp() {
            super.setUp()
            mockService = MockUserService()
            sut = UserListViewModel(userService: mockService)
        }

        override func tearDown() {
            sut = nil
            mockService = nil
            super.tearDown()
        }
    
    func testloadUsers_success() async {
        
        let expectedUser = [Users(id: 1, name: "Swapnil")]
        mockService.mockUser = expectedUser
        
        await sut.loadUsers()
        
        if case .loaded(let user) =  sut.loadingState{
            XCTAssertEqual(user.count, 1)
        }
    }
    
    func testloadUsers_Failure() async {
        mockService.showFail = true
        
        await sut.loadUsers()
        
        if case .failure(let error) =  sut.loadingState {
            XCTAssertEqual(error as? NetworkError, .invalidUrl)
        } else {
            XCTFail("Expected .failure state")
        }
    }
}
