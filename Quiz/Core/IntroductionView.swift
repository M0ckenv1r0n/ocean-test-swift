//
//  IndroductionView.swift
//  Quiz
//
//  Created by Dmytro Yermolenko on 14.11.2024.
//

import SwiftUI

struct IntroductionView: View {
    @EnvironmentObject private var navigationState: NavigationState
    @StateObject private var viewModel = IntroductionViewModel()
    
    var body: some View {
        
        VStack(spacing: 20) {
            Image(.introPeople)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .accessibilityLabel("Illustration of people")
            
            Text("Welcome to Quite Therapy")
                .foregroundColor(AppColors.primaryText)
                .font(.title)
                .bold()
            
            Text("Your personal space for emotional support and growth. Get started to explore tools, insights, and conversations tailored just for you.")
                .foregroundColor(AppColors.secondaryText)
                .font(.callout)
                .padding()
                .multilineTextAlignment(.center)
                
            
            Button(action: {
                navigationState.routes.append(
                    .mainNavigation(.question(viewModel.quiz.questions, 0, [:]))
                    )
            })
            {
                HStack(spacing: 8) {
                    Text("Begin My Journey")
                        .foregroundColor(.white)
                        .bold()
                    Image(systemName:"arrow.forward")
                        .foregroundColor(.white)
                }
                .padding(EdgeInsets(top: 14, leading: 24, bottom: 14, trailing: 24))
                .background(AppColors.accent)
                .cornerRadius(15)
            }
            .accessibilityLabel("Begin My Journey")
            Spacer()

            Text("Powered by AI, guided by empathy ✨").foregroundColor(AppColors.footerText)
                .font(.footnote)
            
        }
        .onAppear {
            viewModel.loadQuiz()
        }
    }
}

#Preview {
    IntroductionView()
        .environmentObject(NavigationState())
}
