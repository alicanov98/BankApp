//
//  MainTabView.swift
//  BankApp
//
//  Created by Malik Alijanov on 25.04.25.
//

import SwiftUI

struct MainTabView: View {
    @Binding var path: [Route]
    @StateObject private var viewModel = BankViewModel()

    var body: some View {
        TabView {
            BankApp(path: $path)
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            CardView()
                .tabItem {
                    Label("My Cards", systemImage: "creditcard")
                }

            StatisticaView()
                .tabItem {
                    Label("Statistics", systemImage: "list.bullet.clipboard")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}



#Preview {
    struct PreviewWrapper: View {
        @State var testPath: [Route] = []

        var body: some View {
            MainTabView(path: $testPath)
        }
    }

    return PreviewWrapper()
}
