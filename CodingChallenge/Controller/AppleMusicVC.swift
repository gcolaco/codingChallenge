//
//  AppleMusicVC.swift
//  CodingChallenge
//
//  Created by Gustavo Colaco on 11/09/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import UIKit

class AppleMusicVC: ThemeController {
    let tableView = ThemeTable()
    
    var feed = "us/apple-music/top-albums/all/50/explicit.json"
    //feeding the array, with the objects from the API, Using DispatchQueue for a faster loading
    var musics = [ApiDetails]() {
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
    
    //MARK: - TableView constraints
    private func setupTableView(){
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: APPLE_MUSIC_CELL)
    }
    
    //MARK: - API Request
    // it makes a request to the API, and gives us a response back, it can be a success(we got that data from the API), or a failure (couldn't get data from the API)
    func getResponse (feedUrl: String) {
        let musicRequest = ApiRequest(feedUrl: feed)
        musicRequest.getApiDatas {[weak self] result in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let musics):
                self?.musics = musics
            }
        }
    }
    
    
}
//MARK: -  TableView DataSource
extension AppleMusicVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: APPLE_MUSIC_CELL, for: indexPath)
        
        guard let musicCell = cell as? CustomTableViewCell else {
            return cell
        }
        musicCell.isUserInteractionEnabled = false
        
        let music = musics[indexPath.row]
        
        if let url = URL(string: music.artworkUrl100) {
            musicCell.imageIV.loadImage(from: url)
        }
        
        
        musicCell.artistNameLabel.text = music.artistName
        musicCell.releaseDateLabel.text = music.releaseDate
        musicCell.nameLabel.text = music.name
        
        return cell
        
    }
}
//MARK: -  TableView Delegate
extension AppleMusicVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

