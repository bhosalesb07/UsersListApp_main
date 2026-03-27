//
//  UserServiceTests.swift
//  UsersListApp-mainTests
//
//  Created by Mac on 27/03/26.
//

import Foundation
@testable import UsersListApp_main
import XCTest

final class UserServiceTests: XCTestCase {

    var sut = UsersServices()
    var mockNetwork = MockNetworkServices()
    
    override func setUp() {
        super.setUp()
        mockNetwork = MockNetworkServices()
        sut = UsersServices(networkServices: mockNetwork)
    }
    
    func testLoaduser_Success() async throws {
        let mockUser = [Users(id: 1, name: "TEST")]
        mockNetwork.mockdata = mockUser
        
        let users = try await sut.loadUsers()
        XCTAssertEqual(users.count, 1)
    }
    
    
    func testLoadUser_Failure() async {
        mockNetwork.error = .requestFailed
        
        do {
           _ =  try await sut.loadUsers()
            XCTFail("Success not expected")
        }catch{
            XCTAssertNotNil(error
            )
        }
    }
}
