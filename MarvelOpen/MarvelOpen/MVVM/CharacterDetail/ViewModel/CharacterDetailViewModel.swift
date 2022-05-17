//
//  CharacterDetailViewModel.swift
//  MarvelOpen
//
//  Created by Mamatha on 13/05/22.
//

import UIKit


class CharacterDetailViewModel: NSObject {

    private var characterService: CharactersServiceProtocol
    private var characterDetail: CharactersModel?
    
    init(characterService: CharactersServiceProtocol = CharactersService()) {
        self.characterService = characterService
    }
    func getCharacterDetails(idVal: String, completionBlock: @escaping (Result<Bool,Error>) -> Void) {
        characterService.getCharacterDetails(characterID: idVal) { success, model, error in
            if success, let characterDetailObject = model {
                self.characterDetail = characterDetailObject
                completionBlock(.success(true))
            } else {
                completionBlock(.success(false))
            }
        }
       
    }
    

    
    var characterDetailName: String {
        guard let charactersData = characterDetail, let name = charactersData.name else {return ""}
        return name
    }
    
    var characterDetailDescription: String {
        guard let charactersData = characterDetail, let description = charactersData.description else {return ""}
        return description
    }
    
    var characterDetailImageURLString: String {
        guard let charDetail = characterDetail, let charThumbnail = charDetail.thumbnail, let path = charThumbnail.path, let imageExtension = charThumbnail.imageExtension else {return ""}
        let imageURLString = path + ".\(imageExtension)"
        return imageURLString
    }
    

}
