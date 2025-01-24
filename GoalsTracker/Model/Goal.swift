//
//  Goal.swift
//  GoalsTracker
//
//  Created by Norbert Agoston on 27.12.2024.
//

import Foundation


class Goal: Identifiable, ObservableObject {
    let id = UUID()
    var totalIterations: Int
    @Published var title: String
    @Published var description: String
    @Published var finishedIterations: Int
    @Published var dueDate: Date
    var progress: Float {
        let value = min(1.0, Float(finishedIterations)/Float(totalIterations))
        print("progress value update = \(value)")
        return value
    }
    
    init(title: String = "", description: String = "", totalIterations: Int = 1, finishedIterations: Int = 0, dueDate: Date = Date()) {
        self.title = title
        self.description = description
        self.totalIterations = totalIterations
        self.finishedIterations = finishedIterations
        self.dueDate = dueDate
    }

    func updateFinishedIterations(with newNumberOfInterations: Int) {
        finishedIterations += newNumberOfInterations
        print("New finished iterations = \(finishedIterations)")
    }
}

//struct Goal: Identifiable {
//    let id = UUID()
//    var title: String
//    var description: String
//    var totalIterations: Int
//    var finishedIterations: Int
//    var dueDate: Date
//    var progress: Float {
//        let value = min(1.0, Float(finishedIterations)/Float(totalIterations))
//        print("progress value update = \(value)")
//        return value
//    }
//    
//    init(title: String = "", description: String = "", totalIterations: Int = 1, finishedIterations: Int = 0, dueDate: Date = Date()) {
//        self.title = title
//        self.description = description
//        self.totalIterations = totalIterations
//        self.finishedIterations = finishedIterations
//        self.dueDate = dueDate
//    }
//
//    mutating func updateFinishedIterations(with newNumberOfInterations: Int) {
//        finishedIterations += newNumberOfInterations
//        print("New finished iterations = \(finishedIterations)")
//    }
//}

struct MockData {
    static let goal =
        Goal(title: "Goal5",
             description: "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
             totalIterations: 4,
             dueDate: Date().addingTimeInterval(4 * 24 * 60 * 60))

    static var goals = [
        Goal(title: "Goal1",
             description: "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
             totalIterations: 5,
             dueDate: Date().addingTimeInterval(4 * 24 * 60 * 60)),
        Goal(title: "Goal2",
             description: "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
             totalIterations: 6,
             dueDate: Date().addingTimeInterval(3 * 24 * 60 * 60)),
        Goal(title: "Goal3",
             description: "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
             totalIterations: 7,
             dueDate: Date().addingTimeInterval(2 * 24 * 60 * 60)),
        Goal(title: "Goal4",
             description: "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
             totalIterations: 8,
             dueDate: Date().addingTimeInterval(1 * 24 * 60 * 60))
    ]
}
