//
//  AppDependency.swift
//  MarvelOpen
//
//  Created by Mamatha on 06/05/22.
//

import Foundation


protocol AppDependency {
    var scheme: AppEnvironmentModes { get }
}

class MarvelDependency: AppDependency {
    private let configuration: ConfigurationValues

    init(configuration: ConfigurationValues) {
        self.configuration = configuration
    }
    lazy var scheme: AppEnvironmentModes = {
        configuration.environentMode
    }()
}

