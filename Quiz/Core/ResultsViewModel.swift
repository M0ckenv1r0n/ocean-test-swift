//
//  ResultsViewModel.swift
//  Quiz
//
//  Created by Dmytro Yermolenko on 18.11.2024.
//


import Foundation

// Function to calculate BFI-10 trait scores
func calculateBFIScores(responses: [Int: Int]) -> [String: Int] {
    
    // Mapping of traits to their respective questions
    let scoring: [String: [Int]] = [
        "Extraversion": [1, 6],
        "Agreeableness": [2, 7],
        "Conscientiousness": [3, 8],
        "Neuroticism": [4, 9],
        "Openness": [5, 10]
    ]
    
    // Reverse-scored questions
    let reverseScoredQuestions: Set<Int> = [1, 3, 4, 5, 7]
    
    var scores = ["Extraversion": 0, "Agreeableness": 0, "Conscientiousness": 0, "Neuroticism": 0, "Openness": 0]
    
    // Calculate trait scores
    for (trait, questions) in scoring {
        for question in questions {
            guard let answer = responses[question], (1...5).contains(answer) else {
                print("Invalid or missing response for question \(question). Skipping.")
                continue
            }
            
            // Reverse scoring logic
            let score = reverseScoredQuestions.contains(question) ? (6 - answer) : answer
            scores[trait, default: 0] += score
        }
    }
    
    return scores
}





