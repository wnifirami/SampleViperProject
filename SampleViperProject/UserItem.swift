//
//  UserItem.swift
//  SampleViperProject
//
//  Created by Rami Ounifi on 1/8/2021.
//

import SwiftUI

struct UserItem: View {
    var user: User
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            Header()
            EmailField()
            AdressField()
        }).padding()
        .background(
            LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .leading, endPoint: .trailing)
        )
        .cornerRadius(8)
        .padding()
    }
    
    @ViewBuilder private func Header() -> some View {
        HStack {
            Text(user.name)
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .lineLimit(2)
            Spacer()
            Text(user.username)
                .font(.caption)
                .fontWeight(.light)
                .foregroundColor(.white)
                .padding()
        }
    }
    
    @ViewBuilder private func EmailField() -> some View {
        Text(user.email)
            .font(.caption)
            .fontWeight(.medium)
            .foregroundColor(.white)
    }
    
    @ViewBuilder private func AdressField() -> some View {
        Text(prepareAdress(with: user.address))
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundColor(.gray)
    }
    
    func prepareAdress(with adress: Address) -> String {
        return "\(adress.street) + , \(adress.city), \(adress.zipcode)"
    }
}
