//
//  AppsVC.swift
//  CodingChallenge
//
//  Created by Gustavo Colaco on 11/09/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import UIKit

class AppsVC: UIViewController {
    let tableView = UITableView()
    
    var feed = "us/apple-music/top-albums/all/50/explicit.json"
    
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
        self.tableView.reloadData()
    }
    
    //MARK: - TableView UI constraints
    private func setupTableView(){
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "appCell")
    }
    
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

    
}


//MARK: - TableView DataSource
extension AppsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "appCell", for: indexPath)
        
        guard let appCell = cell as? CustomTableViewCell else {
            return cell
        }
        appCell.isUserInteractionEnabled = false
        
        let app = apps[indexPath.row]
        
        if let url = URL(string: app.artworkUrl100) {
            appCell.imageIV.loadImage(from: url)
        }
        
        appCell.artistNameLabel.text = app.artistName
        appCell.nameLabel.text = app.name
        appCell.releaseDateLabel.text = app.releaseDate
        
        
        return cell
        
    }
}

//MARK: - TableView Delegate
extension AppsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }

}

