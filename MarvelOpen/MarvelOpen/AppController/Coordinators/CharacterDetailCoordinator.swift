//
//  CharacterDetailCoordinator.swift
//  MarvelOpen
//
//  Created by admin on 5/26/22.
//

import Foundation
import UIKit

class CharacterDetailCoordinator: NSObject, Coordinator {
    var childs: [Coordinator]
    weak var delegate: CoordinatorDelegate?

    private let navigationController: UINavigationController
    private let characterId: Int

    init(navigationController: UINavigationController, characterID: Int) {
        self.navigationController = navigationController
        self.characterId = characterID
        childs = []
    }

    func start() {
        self.displayCharacterDetailViewController()
    }
}

private extension CharacterDetailCoordinator {
    func displayCharacterDetailViewController() {
        let characterDetailViewController = createCharacterDetailViewController()
        navigationController.pushViewController(characterDetailViewController, animated: true)
    }

    func createCharacterDetailViewController() -> UIViewController {
        let viewcontroller = CharacterDetailViewController(nibName: "CharacterDetailViewController", bundle: nil)
        viewcontroller.characterID = self.characterId
        viewcontroller.detailCoordinatorDelegate = self
        return viewcontroller
    }
}

extension CharacterDetailCoordinator: CharacterDetailCoordinatorDelegate
{
    func didPopCharacterDetailViewController() {
        delegate?.coordinatorDidFinish(self)
    }
    
    
}

