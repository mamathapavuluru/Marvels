//
//  CharactersViewModel.swift
//  MarvelOpen
//
//  Created by Mamatha on 12/05/22.
//

import UIKit

class CharactersViewModel: NSObject {
    private var characterService: CharactersServiceProtocol
    private var characters: [CharactersModel]?
    init(characterService: CharactersServiceProtocol = CharactersService()) {
        self.characterService = characterService
    }
    func getCharacters(completionBlock: @escaping (Result<Bool,Error>) -> Void) {
        characterService.getCharacters { success, model, error in
            if success, let charactersArray = model {
                self.characters = charactersArray
                completionBlock(.success(true))
            } else {
                completionBlock(.success(false))
            }
        }
    }
    var charactersCount: Int {
        guard let charactersData = characters else{return 0}
        return charactersData.count
    }
    
    func character(at index: Int) -> CharactersModel? {
        guard let charactersData = characters else{return nil}
        return charactersData[index]
    }
    
    func selectedCharacterID(at index: Int) -> Int? {
        guard let charactersData = characters else{return 0}
        return charactersData[index].id
    }
}
