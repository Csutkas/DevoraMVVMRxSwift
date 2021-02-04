//
//  SceneDelegate.swift
//  DevoraMVVMRxSwift
//
//  Created by Géza MacBook Pro on 2021. 02. 04..
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)        
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
    }

}

