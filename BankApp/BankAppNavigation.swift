//
//  BankAppApp.swift
//  BankApp
//
//  Created by Malik Alijanov on 16.04.25.
//

import SwiftUI

@main
struct BankAppNavigation: App {
    @State private var path: [Route] = []
    @State private var isOnboardingCompleted = UserDefaults.standard.bool(forKey: "isOnboardingCompleted")

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                ZStack { // Bu ZStack sadəcə müxtəlif View-ləri eyni blokda qaytarmaq üçündür
                    if isOnboardingCompleted {
                        SignIn(path: $path)
                    } else {
                        OnboardingView(
                            isOnboardingCompleted: $isOnboardingCompleted,
                            onFinish: {
                                isOnboardingCompleted = true
                            }
                        )
                    }
                }
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .signIn:
                        SignIn(path: $path)
                    case .signUp:
                        SignUp(path: $path)
                    case .home:
                        ContentView(path: $path)
                    case .transfer:
                        TransferView()
                    case .pay:
                        PayView()
                    case .card:
                        CardView()
                    case .stats:
                        StatsView()
                    }
                }
            }
        }
    }
}


