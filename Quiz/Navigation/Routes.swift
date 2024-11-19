//
//  Routes.swift
//  Quiz
//
//  Created by Dmytro Yermolenko on 15.11.2024.
//

import Foundation
import SwiftUI

enum Routes: Hashable {
    case mainNavigation(QuizRoutes)
    
    enum QuizRoutes: Hashable {
        case question([Question], Int, [Int:Int])
        case results([Int:Int])
    }
}
