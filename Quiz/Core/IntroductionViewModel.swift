//
//  IntroductionViewModel.swift
//  Quiz
//
//  Created by Dmytro Yermolenko on 17.11.2024.
//

import Foundation

class IntroductionViewModel: ObservableObject {
    @Published var quiz: Quiz = .empty

    func loadQuiz() {
        do {
            let jsonData = questionMock.data(using: .utf8)!
            self.quiz = try JSONDecoder().decode(Quiz.self, from: jsonData)
        } catch {
            print("Error: \(error)")
        }
    }
}
