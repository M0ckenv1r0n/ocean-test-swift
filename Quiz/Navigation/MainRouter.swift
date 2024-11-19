//
//  MainRouter.swift
//  Quiz
//
//  Created by Dmytro Yermolenko on 15.11.2024.
//

import Foundation
import SwiftUI

struct MainRouter {
    let routes: Routes.QuizRoutes
    
    @ViewBuilder
    func configure() -> some View {
        switch routes {
        case .question(let questions, let questionNumber, let answerDict):
            QuestionView(answerDict: answerDict, questions: questions, questionNumber: questionNumber)
            
        case .results(let answerDict):
            ResultsView(answerDict: answerDict)
        }
    }
}
