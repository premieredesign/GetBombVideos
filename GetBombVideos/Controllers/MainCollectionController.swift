//
//  ViewController.swift
//  GetBombVideos
//
//  Created by Clinton Johnson on 11/7/18.
//  Copyright © 2018 Clinton Johnson. All rights reserved.
//

import UIKit

class MainCollectionController: UIViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Setup Navigation
        setupNavigationBar()
        
        // Setup Search Bar
        setupSearchBar()
        searchWhatUserTypes(searchController.searchBar, textDidChange: "")
    }
    
    //MARK: - Properties
    let searchController = UISearchController(searchResultsController: nil)
    
    
    //MARK: - Methods()
    
    //MARK: -- Nav Bar
    func setupNavigationBar() {
        navigationItem.title = "Get Bomb Videos"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //MARK: -- Search Bar
    func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        
        searchController.dimsBackgroundDuringPresentation = true
        searchController.searchBar.delegate = self
    }
    var timer: Timer?
    func searchWhatUserTypes(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            APIService.shared.fetchSearchResults(search: searchText, completion: { (Games: APIModel) in
                print(Games.description)
            })
        })
    }
}

