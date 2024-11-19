//
//  NavigationState.swift
//  Quiz
//
//  Created by Dmytro Yermolenko on 15.11.2024.
//

import Foundation

class NavigationState: ObservableObject {
    @Published var routes: [Routes] = []
}
