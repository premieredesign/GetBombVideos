//
//  ViewController.swift
//  GetBombVideos
//
//  Created by Clinton Johnson on 11/7/18.
//  Copyright © 2018 Clinton Johnson. All rights reserved.
//

import UIKit

class MainCollectionController: UITableViewController, UISearchControllerDelegate,UISearchBarDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    //MARK: - Properties
    let cellId = "cell"
    var timer: Timer?
    var searchResults = [SearchResults]()
    let searchController = UISearchController(searchResultsController: nil)
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cc = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cc.delegate = self
//        cc.dataSource = self
        cc.translatesAutoresizingMaskIntoConstraints = false
        
        return cc
    }()
    

    
    
    //MARK: - Methods()
    
    //MARK: -- TableView
    func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    
    //MARK: -- Nav Bar
    func setupNavigationBar() {
        navigationItem.title = "Get Bomb Videos"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //MARK: -- Search Bar
    func setupSearchBar() {
        self.definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        
        searchController.dimsBackgroundDuringPresentation = true
        searchController.searchBar.delegate = self
    }
  
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            APIService.shared.fetchSearchResults(search: searchText, completion: { (SearchResults: SearchModel) in
                self.searchResults = SearchResults.results
                self.tableView.reloadData()
            })
        })
    }
        
    //MARK: -- TableView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        
        cell.searchResults = searchResults[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.searchResults.count > 0 ? 0 : 250
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Please Enter a Search Term"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        return label
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.modalTransitionStyle = .coverVertical
        print(indexPath.row)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        // Setup Navigation
        setupNavigationBar()
        
        // Setup Search Bar
        setupSearchBar()
       
        
        // Setup TableView
        setupTableView()
        searchBar(searchController.searchBar, textDidChange: "Call")

    }
}

