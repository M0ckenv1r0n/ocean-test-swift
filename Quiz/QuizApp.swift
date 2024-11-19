//
//  QuizApp.swift
//  Quiz
//
//  Created by Dmytro Yermolenko on 14.11.2024.
//

import SwiftUI

@main
struct QuizApp: App {
    @StateObject private var navigationState = NavigationState()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationState.routes) {
                IntroductionView()
                    .navigationDestination(for: Routes.self) { route in
                        switch route {
                        case .mainNavigation(let routes):
                            MainRouter(routes: routes).configure()
                        
                        }
                        
                    }
            }
            .environmentObject(navigationState)
            
        }
    }
}
