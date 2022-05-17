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

let kAppBaseUrl = "https://gateway.marvel.com/v1/public/"
let kAPIPrivateKey = "PRIVATEKEY"
let kAPIPublicKey = "PUBLICKEY"
let kCharactersAPIURL = kAppBaseUrl + "characters"

let kAlertTitle = "Alert..!"
let kParsingErrorMessage = "Error occured while parsing the data"
let kRequestFailureError = "GET Request failed"
