//
//  ResponseModel.swift
//  MarvelOpen
//
//  Created by Mamatha on 13/05/22.
//

import Foundation

struct ResponseModel: Codable, Equatable {
    let code: Int?
    let status: String?
    let copyright: String?
    let data: ResultsModel?
}
