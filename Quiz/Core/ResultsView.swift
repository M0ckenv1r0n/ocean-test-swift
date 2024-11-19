//
//  ResultsView.swift
//  Quiz
//
//  Created by Dmytro Yermolenko on 16.11.2024.
//

import SwiftUI
import Charts

struct ResultsView: View {
    let answerDict: [Int: Int]
    
    let traitColors: [String: Color] = [
        "Extraversion": Color(red: 104/255, green: 178/255, blue: 187/255), // Pastel Teal
        "Agreeableness": Color(red: 174/255, green: 140/255, blue: 193/255), // Soft Lavender
        "Conscientiousness": Color(red: 245/255, green: 180/255, blue: 148/255), // Muted Peach
        "Neuroticism": Color(red: 156/255, green: 175/255, blue: 136/255), // Pale Olive Green
        "Openness": Color(red: 129/255, green: 163/255, blue: 196/255) // Dusty Blue
    ]

    
    let traitDescriptions: [String: String] = [
        "Extraversion": "A trait reflecting one's tendency to seek stimulation in the company of others, marked by sociability, assertiveness, and energy.",
        "Agreeableness": "This trait reflects a person’s tendency to be compassionate and cooperative towards others, valuing kindness and empathy.",
        "Conscientiousness": "A trait that indicates self-discipline, responsibility, and goal-directed behavior, with a preference for planned over spontaneous actions.",
        "Neuroticism": "This trait reflects emotional sensitivity and the tendency to experience negative emotions, such as anxiety, sadness, or irritability.",
        "Openness": "A trait showing openness to new experiences, imagination, creativity, and an appreciation for art and novel ideas."
    ]

    
    
    private var evaluatedResponse: [String: Int] {
        calculateBFIScores(responses: answerDict)
    }
    
    var body: some View {
        VStack() {
            Text("Personality Trait Scores")
                .font(.title)
                .padding(.bottom, 8)
            Spacer()
            Chart(evaluatedResponse.sorted(by: { $0.key < $1.key }), id: \.key) { dataPoint in
                BarMark(
                    x: .value("Trait", dataPoint.key),
                    y: .value("Score", dataPoint.value)
                )
                .foregroundStyle(traitColors[dataPoint.key] ?? .gray) // Apply color based on trait
            }
            .chartXAxis(.hidden)
            .chartYAxis {
                AxisMarks(position: .leading) {
                    AxisValueLabel()
                }
            }
            .frame(height: 300)
            .padding()
            
            Spacer()
            

            ForEach(evaluatedResponse.keys.sorted(), id: \.self) { trait in
                VStack(alignment: .leading) {
                    HStack {
                        Circle()
                            .fill(traitColors[trait] ?? .gray)
                            .frame(width: 10, height: 10)
                        Text(trait)
                            .font(.caption)
                    }
                    .padding(.horizontal, 4)
                    
                    Text(traitDescriptions[trait] ?? "No description available")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.leading, 24)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 4)
            }
        }
        .padding()
    }
}
