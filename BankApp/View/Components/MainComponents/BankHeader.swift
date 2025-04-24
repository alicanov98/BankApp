//
//  BankHeader.swift
//  BankApp
//
//  Created by Malik Alijanov on 24.04.25.
//

import SwiftUI

struct BankHeader: View {
    var body: some View {
        HStack {
                Image("profile")
                    .frame(width: 60,height: 60)
                    .clipShape(Circle())
            VStack(alignment:.leading,spacing: 7){ Text("Welcome back,")
                    .font(.system(size: 12,weight: .light))
                    .foregroundColor(.black.opacity(0.6))
                Text("Məlik Əlicanov")
                    .font(.system(size: 27,weight: .medium))
                    .foregroundColor(.black)
            }
            Spacer()
            Button {
                // Profile action
            } label: {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                    .frame(width: 40, height: 40)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
            }
        }
        .padding()
        .background(Color.white)
    
    }
}

#Preview {
    BankHeader()
}
