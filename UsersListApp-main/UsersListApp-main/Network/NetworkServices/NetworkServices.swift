//
//  UsersListApp_main.swift
//  UsersListApp-main
//
//  Created by Swapnil B on 09/03/27.
//

import Foundation


class NetworkServices: NetworkServiceProtocol {
    
    func fetchUsers<T>(url: String,type: T.Type) async throws -> T where T : Decodable {
        
        guard let urlString = URL(string: url) else{
            throw NetworkError.invalidUrl}
        
        let (data,response) =  try await URLSession.shared.data(from: urlString)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode,(200...299).contains(statusCode) else{ throw NetworkError.requestFailed}
        
        do{
            return try JSONDecoder().decode(T.self, from: data)
        }catch{
            throw NetworkError.decodingFailed
        }
    }
}
