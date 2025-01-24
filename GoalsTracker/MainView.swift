//
//  MainView.swift
//  GoalsTracker
//
//  Created by Norbert Agoston on 26.12.2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewViewModel
    var handleNavigationTo: (Screen) -> ()
    
    var body: some View {
        ZStack {
            Color.appBackground
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
    //            List($viewModel.goals) { $goal in
    //                GoalListCell(goal: goal)
    //                    .onTapGesture {
    //                        handleNavigationTo(.GoalDetails(goal: $goal))
    //                    }
    //            }
    //            .listStyle(.plain)
    //            .border(Color.pink, width: 2)
                
                List(viewModel.goals) { goal in
                    GoalListCell(goal: goal)
                        .onTapGesture {
                            print("main view - \(goal.id)")
                            handleNavigationTo(.GoalDetails(goal: goal))
                        }
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .background(.clear)
//                .border(Color.blue, width: 2)
                
                HStack {
                    Button {
                        handleNavigationTo(.AddNewGoal)
                    } label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                            Text("New Goal")
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(.buttonBackground)
                    }
                    .cornerRadius(12)
                    .clipped()
                    .padding(.leading, 10)
                    
//                    .border(Color.red, width: 2)
                    Spacer()
                }
            }
//            .border(Color.green, width: 2)
            
        }
    }

}

#Preview {
    MainView(viewModel: MainViewViewModel(), handleNavigationTo: {_ in })
}
