//
//  AlbumsListViewModel.swift
//  DevoraMVVMRxSwift
//
//  Created by Géza MacBook Pro on 2021. 02. 04..
//

import Foundation
import RxSwift

final class AlbumsListViewModel {
    let title = "Devora Albums"
    
    private let albumService: AlbumServiceProtocol
    
    init(albumService: AlbumServiceProtocol = AlbumService()) {
        self.albumService = albumService
    }
    
    func fetchAlbumViewModels() -> Observable<[AlbumViewModel]> {
        albumService.fetchAlbums().map { $0.map { AlbumViewModel(album: $0) } }
    }
    
}
