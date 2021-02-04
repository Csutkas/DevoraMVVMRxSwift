//
//  ViewController.swift
//  DevoraMVVMRxSwift
//
//  Created by Géza MacBook Pro on 2021. 02. 04..
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    private var viewModel: AlbumsListViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    static func instantiate(viewModel: AlbumsListViewModel) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        //tableView.contentInsetAdjustmentBehavior = .never
        
        viewModel.fetchAlbumViewModels().observe(on: MainScheduler.instance).bind(to: tableView.rx.items(cellIdentifier: "cell")) {
            index, viewModel, cell in cell.textLabel?.text = viewModel.displayText
        }.disposed(by: disposeBag)
        
        // let service = AlbumService()
        // service.fetchAlbums().subscribe(onNext: { albums in print(albums)}).disposed(by: disposeBag)
    }


}

