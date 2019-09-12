//
//  AppsVC.swift
//  CodingChallenge
//
//  Created by Gustavo Colaco on 11/09/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import UIKit

class AppsVC: ThemeController {
    let tableView = ThemeTable()
    var feed = "us/ios-apps/new-apps-we-love/all/50/explicit.json"
    
    //feeding the array, with the objects from the API, Using DispatchQueue for a faster loading
    var apps = [ApiDetails]() {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        getResponse(feedUrl: feed)
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupDarkMode()
        self.tableView.reloadData()
    }
    
    //MARK: - TableView constraints
    private func setupTableView(){
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: APP_CELL)
    }
    
    //MARK: - API Request
    // it makes a request to the API, and gives us a response back, it can be a success(we got that data from the API), or a failure (couldn't get data from the API)
    func getResponse (feedUrl: String) {
        let movieRequest = ApiRequest(feedUrl: feed)
        movieRequest.getApiDatas {[weak self] result in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let apps):
                self?.apps = apps
            }
        }
    }
    
    //MARK: - DarkMode setup
    private func setupDarkMode() {
        ThemeManager.addDarkModeObserver(to: self, selector: #selector(enableDarkMode))
    }
    //it changes the colors from the labels and background of this view acording to the Theme selected
    @objc func enableDarkMode() {
        let currentTheme = ThemeManager.currentTheme
        view.backgroundColor = currentTheme.backgroundColor
        tableView.backgroundColor = currentTheme.backgroundColor
        navigationController?.navigationBar.barTintColor = currentTheme.backgroundColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: currentTheme.textColor]
    }
    
}

//MARK: -  TableView DataSource
extension AppsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: APP_CELL, for: indexPath)
        
        guard let appCell = cell as? CustomTableViewCell else {
            return cell
        }
        appCell.isUserInteractionEnabled = false
        
        let app = apps[indexPath.row]
        
        //since the image is from a URL, we make sure it doesn't give us back nil and crash the app
        if let url = URL(string: app.artworkUrl100) {
            appCell.imageIV.loadImage(from: url)
        }
        
        
        appCell.artistNameLabel.text = app.artistName
        appCell.releaseDateLabel.text = app.releaseDate
        appCell.nameLabel.text = app.name
        
        
        return cell
        
    }
}

//MARK: - TabkeView Delegate
extension AppsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

