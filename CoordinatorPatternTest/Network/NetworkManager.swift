//
//  NetworkManager.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/19/24.
//

import UIKit

fileprivate enum EndPoints {
    static let users = "https://jsonplaceholder.typicode.com/users"
}

class NetworkManager {
    
    func fetchUsersData(completion: @escaping (Result<[User], NetworkError>) -> Void) -> Void {
        guard let url = URL(string: EndPoints.users) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.badServerResponse))
            }
            
            do {
                let respond = try JSONDecoder().decode([User].self, from: data)
                completion(.success(respond))
            } catch {
                completion(.failure(.badParsing))
            }
        }.resume()
        
    }
    
}


