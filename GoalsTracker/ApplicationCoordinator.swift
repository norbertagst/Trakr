//
//  ApplicationCoordinator.swift
//  GoalsTracker
//
//  Created by Norbert Agoston on 26.12.2024.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    let window: UIWindow
    var childCoordinators = [Coordinator]()
    
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let mainCoordinator = MainCoordinator()
        mainCoordinator.start()
        childCoordinators = [mainCoordinator]
        window.rootViewController = mainCoordinator.rootViewController
    }
}
