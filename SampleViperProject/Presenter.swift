//
//  Presenter.swift
//  SampleViperProject
//
//  Created by Rami Ounifi on 1/8/2021.
//

import Foundation

// object
// protocol
// ref to interactor, router and view
enum FetchError: Error {
    case failed
}

protocol AnyPresenter {
    var router: AnyRouter? { get set}
    var interactor: AnyInteractor? { get set}
    var view: AnyView? { get set}
    
    func interactorDidFetchUsers(with result: Result<Users, Error>)
}

class UserPresenter: AnyPresenter {
    var router: AnyRouter?
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getUsers()
        }
    }
    var view: AnyView?
    
    func interactorDidFetchUsers(with result: Result<Users, Error>) {
        switch  result {
        case let .success(users):
            view?.update(with: users)
        case .failure:
            view?.update(with: "something went wrong")
        }
    }
}
