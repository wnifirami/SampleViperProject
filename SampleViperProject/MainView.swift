//
//  MainView.swift
//  SampleViperProject
//
//  Created by Rami Ounifi on 1/8/2021.
//

import SwiftUI

struct MainView: View, AnyView {
    func update(with users: Users) {}
    func update(with error: String) {}
    
    var presenter: AnyPresenter?
    

    @State var users: Users
    var body: some View {
        if users.isEmpty {
            showLabelError()
        } else {
            ScrollView {
                showContent()
            }.padding(.top, 50)
           
        }
    }
    
    @ViewBuilder private func showContent() -> some View {
        VStack {
            list(of: users)
            Spacer(minLength: 20)
        }
    }
    
    private func list(of users: Users) -> some View {
      return  LazyVGrid(columns: gridLayoutUsers, spacing: 15, content:  {
            ForEach(users) { item in
                UserItem(user: item)
            }// Loop
        })
    }
    private func showLabelError() -> some View {
        return  Text("Ooops nodata!".uppercased())
            .font(.title)
            .fontWeight(.bold)
    }
}


