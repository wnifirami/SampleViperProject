//
//  View.swift
//  SampleViperProject
//
//  Created by Rami Ounifi on 1/8/2021.
//

import Foundation
import UIKit
import SwiftUI
// MARK: - View

// ViewController
// Protocol
// ref to presenter

// MARK: - Protocol
protocol AnyView {
    var presenter: AnyPresenter? { get set}
    func update(with users: Users)
    func update(with error: String)
}
// MARK: - View
class UserViewController: UIViewController, AnyView {
    var contenant: MainView?
    
    var presenter: AnyPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    
    private func setup(with users: Users) {
        contenant = MainView( users: users)
        let child = UIHostingController(rootView:contenant)
        if !view.subviews.filter({$0 is MainView}).isEmpty {
            _ = view.subviews.map({$0.removeFromSuperview()})
        }
        child.view.translatesAutoresizingMaskIntoConstraints = false
        child.view.frame = self.view.bounds
        self.view.addSubview(child.view)
        self.addChild(child)
    }
    
    func update(with users: Users) {
        DispatchQueue.main.async {
            self.setup(with: users)
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.setup(with: [])
        }
        
    }
}
