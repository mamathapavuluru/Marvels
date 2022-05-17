//
//  CharacterService.swift
//  MarvelOpen
//
//  Created by Mamatha on 12/05/22.
//

import Foundation

var apiAuthenticator: MD5Authenticator {
    MD5Authenticator(keyData: APIAuthenticationKeyRetriever())
}


protocol CharactersServiceProtocol {
    func getCharacters(completion: @escaping (_ success: Bool, _ results: [CharactersModel]?, _ error: String?) -> ())
    func getCharacterDetails(characterID:String, completion: @escaping (_ success: Bool, _ results: CharactersModel?, _ error: String?) -> ())
}

class CharactersService: CharactersServiceProtocol {
    func getCharacterDetails(characterID:String, completion: @escaping (Bool, CharactersModel?, String?) -> ()) {
        guard let params = apiAuthenticator.authenticate(with: Date().timeIntervalSince1970) else { return}
        HttpRequestHelper().GET(url: kCharactersAPIURL + "/\(characterID)", params: params, httpHeader: .application_json) { success, data in
            if success {
                do {
                    let characterDetailResponse = try JSONDecoder().decode(ResponseModel.self, from: data!)
                    let model = characterDetailResponse.data?.results?.first
                    completion(true, model, nil)
                } catch {
                    completion(false, nil, kParsingErrorMessage)
                }
            } else {
                completion(false, nil, kRequestFailureError)
            }
        }
    }
    
    func getCharacters(completion: @escaping (Bool, [CharactersModel]?, String?) -> ()) {
        guard let params = apiAuthenticator.authenticate(with: Date().timeIntervalSince1970) else {return}
            HttpRequestHelper().GET(url: kCharactersAPIURL, params: params, httpHeader: .application_json) { success, data in
                if success {
                    do {
                        let characterResponse = try JSONDecoder().decode(ResponseModel.self, from: data!)
                        let model = characterResponse.data?.results
                        completion(true, model, nil)
                    } catch {
                        completion(false, nil, kParsingErrorMessage)
                    }
                } else {
                    completion(false, nil, kRequestFailureError)
                }
            }
        
    }
    
   
}
