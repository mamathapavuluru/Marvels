//
//  CharactersDependencies.swift
//  MarvelOpen
//
//  Created by Mamatha on 06/05/22.
//

import Foundation

protocol CharactersDependencies {
    var environment: AppEnvironmentModes { get }
}

class CharactersDependenciesAdapter: CharactersDependencies {
    let environment: AppEnvironmentModes

    init(environment: AppEnvironmentModes) {
        self.environment = environment
    }
}
