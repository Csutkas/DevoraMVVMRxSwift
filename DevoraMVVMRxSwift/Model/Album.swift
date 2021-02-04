//
//  Album.swift
//  DevoraMVVMRxSwift
//
//  Created by Géza MacBook Pro on 2021. 02. 04..
//

import Foundation

struct Album: Decodable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
