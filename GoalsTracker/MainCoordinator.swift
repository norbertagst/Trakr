//
//  MainCoordinator.swift
//  GoalsTracker
//
//  Created by Norbert Agoston on 26.12.2024.
//

import UIKit
import SwiftUI

enum Screen {
//    case GoalDetails(goal: Binding<Goal>)
    case GoalDetails(goal: Goal)
    case AddNewGoal
}


class MainCoordinator: NSObject, Coordinator {
    var rootViewController = UINavigationController()
    private var viewModel = MainViewViewModel()
    
    override init() {
        super.init()
        viewModel.goals = MockData.goals
    }
    
    func start() {
        rootViewController.setViewControllers([mainViewController], animated: false)
        rootViewController.navigationBar.prefersLargeTitles = true
        // Customize appearance
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.shadowColor = nil
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white, // Large title color
            .font: UIFont.boldSystemFont(ofSize: 34) // Customize font if needed
        ]
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white // Small title color
        ]
        UINavigationBar.appearance().tintColor = .white

        rootViewController.navigationBar.standardAppearance = appearance
        rootViewController.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private lazy var mainViewController = {
        let mainViewController = UIHostingController(rootView: MainView(
            viewModel: viewModel,
            handleNavigationTo: handleNavigationTo))
        mainViewController.title = "Goals"
        return mainViewController
    }()
    
    private func handleNavigationTo(screen: Screen) {
        switch screen {
        case .GoalDetails(let goal):
            showDetail(for: goal)
        case .AddNewGoal:
            showAddNewGoalPage()
        }
    }
    
    private func showDetail(for goal: Goal) {
        let detailViewController = UIHostingController(rootView: DetailView(selectedGoal: goal))
            rootViewController.pushViewController(detailViewController, animated: true)
    }
        
    private func showAddNewGoalPage() {
        let addNewGoalView = AddNewGoalView(viewModel: viewModel, done: { [weak self] in
            self?.rootViewController.dismiss(animated: true)
        }, cancel: { [weak self] in
            self?.rootViewController.dismiss(animated: true)
        })

        rootViewController.present(UIHostingController(rootView: addNewGoalView), animated: true)
    }
}
