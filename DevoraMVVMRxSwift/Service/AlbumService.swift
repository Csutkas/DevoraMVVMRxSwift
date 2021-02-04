//
//  AlbumService.swift
//  DevoraMVVMRxSwift
//
//  Created by Géza MacBook Pro on 2021. 02. 04..
//

import Foundation
import RxSwift

protocol AlbumServiceProtocol {
    func fetchAlbums() -> Observable<[Album]>
}

class AlbumService: AlbumServiceProtocol {
    
    func fetchAlbums() -> Observable<[Album]> {
        
        return Observable.create { observer -> Disposable in
            
            let task = URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/photos")!) { (data, _, _) in
                
            
            
            // get the path
            guard let data = data else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return
            }
            
            // read the path
            do{
                let albums = try JSONDecoder().decode([Album].self, from: data)
                
                observer.onNext(albums)
                
            } catch {
                observer.onError(error)
            }
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
