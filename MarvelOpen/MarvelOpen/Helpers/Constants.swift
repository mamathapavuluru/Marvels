//
//  Constants.swift
//  MarvelOpen
//
//  Created by Mamatha on 12/05/22.
//

import Foundation
import UIKit


let kCharactersCellIdentifier = "CharacterCell"
let kComicCollectionCell = "ComicCollectionCell"
let nameLabelFontSize: CGFloat = 20
let kCharacterCellCornerRadius: CGFloat = 16


enum Shadow {
    static let opacity: Float = 0.15
    static let offset = CGSize(width: 0, height: 6)
    static let radius: CGFloat = 10
}
let kAlertControllerTag:Int = 999
let kHttpStatusCode200:Int = 200
let kHttpStatusCode300:Int = 300

let kAppBaseUrl = "https://gateway.marvel.com/v1/public/"
let kAPIPrivateKey = "PRIVATEKEY"
let kAPIPublicKey = "PUBLICKEY"
let kCharactersAPIURL = kAppBaseUrl + "characters"

let kCharactersTitle = "Characters"
let kOKText = "OK"
let kAlertTitle = "kAlertTitle"
let kParsingErrorMessage = "kParsingErrorMessage"
let kRequestFailureError = "kRequestFailureError"
