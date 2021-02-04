//
//  AlbumViewModel.swift
//  DevoraMVVMRxSwift
//
//  Created by Géza MacBook Pro on 2021. 02. 04..
//

import Foundation

struct AlbumViewModel {
    
    private let album: Album
    
    var displayText: String {
        return album.title
    }
    
    init(album: Album) {
        self.album = album
    }
}
