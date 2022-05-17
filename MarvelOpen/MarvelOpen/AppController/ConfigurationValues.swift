//
//  ConfigurationValues.swift
//  MarvelOpen
//
//  Created by Mamatha on 06/05/22.
//

import Foundation


protocol ConfigurationValues {
    var apiBaseURLString: String { get }
    var environentMode: AppEnvironmentModes { get }
}


class MarvelOpenConfigurationValues: ConfigurationValues {
    lazy var environentMode: AppEnvironmentModes =  environmentMode(fromConfigurationKey: "ENVIRONMENT")
    lazy var apiBaseURLString: String = apiBaseURLString(fromConfigurationKey: "API_BASE_URL")
}


private extension MarvelOpenConfigurationValues {
    func environmentMode(fromConfigurationKey configurationKey: String) -> AppEnvironmentModes {
        guard let environmentMode = AppEnvironmentModes(rawValue: value(forConfigurationKey: configurationKey)) else {
            fatalError("Environemnt value \(String(describing: value)) not in \(String(describing: AppEnvironmentModes.self))")
        }
        return environmentMode
    }

    func apiBaseURLString(fromConfigurationKey configurationKey: String) -> String {
        value(forConfigurationKey: configurationKey)
    }

    func value(forConfigurationKey configurationKey: String) -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: configurationKey) as? String else {
            fatalError("Could not retrieve configuration value for key \(configurationKey)")
        }
        return value
    }
}
