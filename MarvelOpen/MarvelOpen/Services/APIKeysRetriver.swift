//
//  APIKeysRetriver.swift
//  MarvelOpen
//
//  Created by Mamatha on 5/13/22.
//

import Foundation


protocol  APIKeysRetriver {
    
    var publicKey: String? {get}
    var privateKey: String? {get}
}


class APIAuthenticationKeyRetriever: APIKeysRetriver {
    
    var publicKey: String? {
        ProcessInfo.processInfo.environment[kAPIPublicKey]
    }
    var privateKey: String? {
        ProcessInfo.processInfo.environment[kAPIPrivateKey]
    }
}
