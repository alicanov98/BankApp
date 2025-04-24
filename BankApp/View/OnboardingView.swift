//
//  OnboardingView.swift
//  BankApp
//
//  Created by Malik Alijanov on 22.04.25.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    @Binding var isOnboardingCompleted: Bool
    var onFinish: () -> Void    
    var body: some View {
        VStack {
            TabView(selection: $viewModel.currentPage) {
                ForEach(0..<viewModel.pages.count, id: \.self) { index in
                    OnboardingPageView(
                        page: viewModel.pages[index],
                        totalPages: viewModel.pages.count,
                        currentPage: viewModel.currentPage
                    )
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .animation(.easeInOut, value: viewModel.currentPage)
            
            Button {
                if viewModel.isLastPage{
                    onFinish()
                    UserDefaults.standard.set(true, forKey: "isOnboardingCompleted")
                }else{
                    viewModel.nextPage()
                }
            } label: {
                Text(viewModel.isLastPage ? "Get Started" : "Next")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Blue"))
                    .foregroundColor(.white)
                    .cornerRadius(16)
                    .padding(.horizontal)
            }
            .padding(.bottom)
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
            .ignoresSafeArea()
        
    }
       
}

#Preview {
    OnboardingView(
            isOnboardingCompleted: .constant(false),
            onFinish:{}
        )
}


