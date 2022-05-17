//
//  CharactersViewModel.swift
//  MarvelOpen
//
//  Created by Mamatha on 06/05/22.
//


import Foundation


struct CharactersModel: Codable, Equatable {
    var id: Int?
    let name: String?
    let description: String?
    let modified: String?
    let thumbnail: CharacterImageModel?
    let resourceURI: String?
}

struct CharacterImageModel: Equatable, Codable {
    let path: String?
    let imageExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case imageExtension = "extension"
    }
}

