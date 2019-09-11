//
//  AppleMusicVC.swift
//  CodingChallenge
//
//  Created by Gustavo Colaco on 11/09/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import Foundation

import UIKit

class AppleMusicVC: UIViewController {
    let tableView = UITableView()
    
    var musics = ["aaa", "bbbb", "cccc", "ddd"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self

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
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "musicCell")

    }

    
    
}
//MARK: - TableView Data Source
extension AppleMusicVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath)
        
        guard let musicCell = cell as? CustomTableViewCell else {
            return cell
        }
        musicCell.isUserInteractionEnabled = false
        
        let music = musics[indexPath.row]
        
        musicCell.nameLabel.text = music
        
        return cell
        
    }
}

//MARK: - TableView Delegate
extension AppleMusicVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
