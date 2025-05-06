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
        NavigationStack{
            TabView {
                BankApp(path: $path)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .background(Color.white)
                
                MyCardsView(viewModel: viewModel, path: $path)
                    .tabItem {
                        Label("My Cards", systemImage: "creditcard")
                    }
                    .background(Color.white)
                
                StatisticaView(viewModel:viewModel)
                    .tabItem {
                        Label("Statistics", systemImage: "list.bullet.clipboard")
                    }
                
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape")
                    }
            }
            .background(Color.white)
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
