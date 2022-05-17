//
//  ResultsModel.swift
//  MarvelOpen
//
//  Created by Mamatha on 13/05/22.
//

import Foundation

struct ResultsModel: Codable, Equatable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [CharactersModel]?
}
