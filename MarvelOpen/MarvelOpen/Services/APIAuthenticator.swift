//
//  APIAuthenticator.swift
//  MarvelOpen
//
//  Created by Mamatha on 5/13/22.
//

import Foundation
import CryptoKit

protocol APIAuthenticator {
    
    func authenticate(with timestamp: TimeInterval) -> [String: String]?
}

class MD5Authenticator: APIAuthenticator {
    
    private let keys: APIKeysRetriver
    init(keyData: APIKeysRetriver) {
        keys = keyData
    }
    
    func authenticate(with timestamp: TimeInterval) -> [String: String]? {
        guard let publicKey = keys.publicKey, let privateKey = keys.privateKey else { return nil }
        let ts = String(Int(timestamp))
        let fullKey = ts + privateKey + publicKey
        guard let data = fullKey.data(using: .utf8) else { return nil }
        let hashValueMD5 = Insecure.MD5.hash(data: data).map { String(format: "%02hhx", $0) }.joined()
        return ["hash": hashValueMD5, "apikey": publicKey, "ts": ts]
    }
}
