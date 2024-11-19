//
//  QuestionView.swift
//  Quiz
//
//  Created by Dmytro Yermolenko on 15.11.2024.
//

import SwiftUI

enum AnswerType {
    case unvoted
    case voted
}

struct QuestionView: View {
    @EnvironmentObject private var navigationState: NavigationState
    @State private var selectedOption: String = ""
    @State private var selectedAnswer: AnswerType = .unvoted
    @State var answerDict: [Int: Int]
    
    let questions: [Question]
    let questionNumber: Int
    
    var body: some View {
        VStack{
            Text("\(questionNumber + 1) of \(questions.count)")
            Spacer()
            Text(questions[questionNumber].question)
                .font(.title)
                .bold()
                .foregroundColor(AppColors.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            
            VStack(spacing: 15) {
                ForEach(0..<questions[questionNumber].options.count, id: \.self) { index in
                    optionButton(questions[questionNumber].options[index])
                }
            }
            
        }
        .padding()
    }
}

private extension QuestionView {
    func optionButton(_ option: String) -> some View {
        Button(action: {
            optionButtonAction(option: option)
        }) {
            Label {
                Text(option)
                    .font(.callout)
                    .foregroundColor(AppColors.secondaryText)
                    .padding(.horizontal, 25)
            } icon: {
                Image(systemName: "hexagon")
            }
            .frame(maxWidth: .infinity, minHeight: 100)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(AppColors.primaryBackgroung)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(AppColors.secondaryAccent, lineWidth: 1))
            )
        }
        .accessibilityLabel(Text("Option: \(option)"))
    }
}


private extension QuestionView{
    func optionButtonAction(option: String){
        answerDict[questionNumber+1]=(getNumericValue(s: option))
        print(answerDict)
        if questionNumber < questions.count - 1 {
            navigationState.routes.append(.mainNavigation(.question(questions, questionNumber + 1, answerDict)))
        }else {
            navigationState.routes.append(
                .mainNavigation(
                    .results(answerDict)
                )
            )
        }
    }
}

//#Preview {
//    QuestionView()
//}
