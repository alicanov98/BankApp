//
//  OnboardingViewModel.swift
//  BankApp
//
//  Created by Malik Alijanov on 22.04.25.
//

import Foundation



class OnboardingViewModel: ObservableObject {
    @Published var currentPage = 0

    let pages: [Onboarding] = [
        Onboarding(image: "Onboarding1", title: "Fastest Payment in the world", subtitle: "Integrate multiple payment methoods to help you up the process quickly"),
           Onboarding(image: "Onboarding2", title: "The most Secoure Platfrom for Customer", subtitle: "Built-in Fingerprint, face recognition and more, keeping you completely safe"),
           Onboarding(image: "Onboarding3", title: "Paying for Everything is Easy and Convenient", subtitle: "Built-in Fingerprint, face recognition and more, keeping you completely safe")
       ]


    var isLastPage: Bool {
        return currentPage == pages.count - 1
    }

    func nextPage() {
        if currentPage < pages.count - 1 {
            currentPage += 1
        }
    }
}

