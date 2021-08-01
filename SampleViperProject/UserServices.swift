//
//  UserServices.swift
//  SampleViperProject
//
//  Created by Rami Ounifi on 1/8/2021.
//

import Combine
import Foundation

protocol UserServiceProtocol: AnyObject {
    func fetchUsers() -> AnyPublisher<Users, Error>
}

class UserService: UserServiceProtocol {

    func fetchUsers() -> AnyPublisher<Users, Error> {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return Future<Users, Error>(){ promise in
                promise(.failure(FetchError.failed))
            }.eraseToAnyPublisher()
        }
        
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .map({$0.data})
            .decode(type: Users.self,
                    decoder: JSONDecoder())
            .catch { error in
                Future<Users, Error>(){ promise in
                    promise(.failure(error))
                }
            }.eraseToAnyPublisher()
        return publisher
    }
}

