//
//  MainViewViewModel.swift
//  GoalsTracker
//
//  Created by Norbert Agoston on 27.12.2024.
//

import SwiftUI
import Combine

class MainViewViewModel: ObservableObject {
    @Published var goals = [Goal]()
//    @Published var selectedGoal = Goal() {
//        didSet {
//            // Automatically update the corresponding goal in the goals array
//            if let index = goals.firstIndex(where: { $0.id == selectedGoal.id }) {
//                goals[index] = selectedGoal
//            }
//        }
//    }
    
    func addNewGoal(_ goal: Goal) {
        goals.append(goal)
    }
    
//    func makeProgress(with newNumberOfIterations: Int) {
//        selectedGoal.updateProgress(with: newNumberOfIterations)
//    }
}
