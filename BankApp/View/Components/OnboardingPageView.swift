//
//  OnboardingPageView.swift
//  BankApp
//
//  Created by Malik Alijanov on 24.04.25.
//

import SwiftUI

struct OnboardingPageView: View {
    let page: Onboarding
    let totalPages: Int
    let currentPage: Int

    var body: some View {
        VStack(spacing:24){
            Image(page.image)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width, height: 248)

            HStack(spacing: 8) {
                ForEach(0..<totalPages, id: \.self) { index in
                    Rectangle()
                        .fill(index == currentPage ? Color("Blue") : Color.gray.opacity(0.4))
                        .frame(width: index == currentPage ? 19 : 6, height: 6)
                        .cornerRadius(10)
                }
            }
            .padding(.top)

            Text(page.title)
                .font(.system(size: 26))
                .bold()
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
                .padding(.horizontal,27)

            Text(page.subtitle)
                .font(.system(size:14))
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal,55)
        }
    }
}



