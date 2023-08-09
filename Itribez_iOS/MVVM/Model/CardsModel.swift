//
//  CardsModel.swift
//  Itribez_iOS
//
//  Created by Admin on 09/09/23.
//

import Foundation

// MARK: - Card
struct Card: Identifiable,Codable,Hashable {
    let id, author: String
    let width, height: Int
    let url, downloadURL: String

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}

