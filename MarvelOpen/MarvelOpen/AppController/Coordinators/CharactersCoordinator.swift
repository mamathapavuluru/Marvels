//
//  CharactersCoordinator.swift
//  MarvelOpen
//
//  Created by Mamatha on 06/05/22.
//

import Foundation
import UIKit

class CharactersCoordinator: Coordinator {

    
    var childs: [Coordinator]
    
    weak var delegate: CoordinatorDelegate?

    private let navigationController: UINavigationController
    private let dependencies: CharactersDependencies

    init(navigationController: UINavigationController, dependencies: CharactersDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
        childs = []
    }

    func start() {
        showCharactersViewController()
    }
}


private extension CharactersCoordinator {
    func showCharactersViewController() {
        let charactersViewController = createCharactersViewController()
        navigationController.pushViewController(charactersViewController, animated: false)
    }

    func createCharactersViewController() -> UIViewController {
        let viewcontroller = CharactersViewController(nibName: "CharactersViewController", bundle: nil)
        viewcontroller.coordinatorDelegate = self
        return viewcontroller
    }
}

extension CharactersCoordinator: CharactersCoordinatorDelegate
{
    func didSelectCharacter(characterId: Int) {
        let characterDetailCoordinator = CharacterDetailCoordinator(navigationController: navigationController, characterID: characterId)
        characterDetailCoordinator.delegate = self
        characterDetailCoordinator.start()
        childs.append(characterDetailCoordinator)
    }
    
    
}
