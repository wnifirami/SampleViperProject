//
//  Router.swift
//  SampleViperProject
//
//  Created by Rami Ounifi on 1/8/2021.
//

import Foundation
import UIKit
// object
// EntryPoint
typealias EntryPoint = AnyView & UIViewController
protocol AnyRouter {
    var entry: EntryPoint? { get set}
    static func start() -> AnyRouter
}


class UserRouter: AnyRouter {
    var entry: EntryPoint?
    
    
    static func start() -> AnyRouter {
        let router = UserRouter()
        // Assign VIP
        var view: AnyView = UserViewController()
            var presenter: AnyPresenter = UserPresenter()
            var interactor: AnyInteractor = UserInteractor()
            
            view.presenter = presenter
            
        interactor.userService = UserService()
            interactor.presenter = presenter
            
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor

            router.entry = view as? EntryPoint
            
        return router
    }
}
