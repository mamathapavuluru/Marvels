//
//  MainCoordinator.swift
//  MarvelOpen
//
//  Created by Mamatha on 06/05/22.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childs: [Coordinator]
    weak var delegate: CoordinatorDelegate?

    private let navigationController: UINavigationController
    private let dependencyContainer: AppDependency

    init(navigationController: UINavigationController, dependencyContainer: AppDependency) {
        self.navigationController = navigationController
        childs = []
        self.dependencyContainer = dependencyContainer
    }

    func start() {
        showCharacters()
    }
}

private extension MainCoordinator {
    func showCharacters() {
        
        let charactersDependencies = CharactersDependenciesAdapter(environment: dependencyContainer.scheme)
        
        
        let charactersCoordinator = CharactersCoordinator(
            navigationController: navigationController,
            dependencies: charactersDependencies
        )
        charactersCoordinator.start()
        childs.append(charactersCoordinator)
    }
}
