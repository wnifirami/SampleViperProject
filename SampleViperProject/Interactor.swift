//
//  Interactor.swift
//  SampleViperProject
//
//  Created by Rami Ounifi on 1/8/2021.
//

import Foundation
import Combine
// object
// protocol
// ref to presenter
protocol AnyInteractor {
    var presenter: AnyPresenter? { get set}
    var userService: UserServiceProtocol? { get set }
    func getUsers()
}

class UserInteractor: AnyInteractor {
    var userService: UserServiceProtocol?
    var presenter: AnyPresenter?
    private var cancallables = Set<AnyCancellable>()
    
    func getUsers() {
        userService?.fetchUsers()
            .receive(on: DispatchQueue.main)
            .sink { response in
                switch response {
                case .failure(let error):
                    self.presenter?.interactorDidFetchUsers(with: .failure(error))
                case .finished:
                    debugPrint("process Finished")
                }
            } receiveValue: { entities in
                self.presenter?.interactorDidFetchUsers(with: .success(entities))
            }
            .store(in: &self.cancallables)
        
        
    }
}
