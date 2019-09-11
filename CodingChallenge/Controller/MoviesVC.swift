//
//  MoviesVC.swift
//  CodingChallenge
//
//  Created by Gustavo Colaco on 11/09/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//


import UIKit

class MoviesVC: UIViewController {
    let tableView = UITableView()
    
    var feed = "us/movies/top-movies/all/50/explicit.json"
    var movies = [ApiDetails]() {
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
    
    private func setupTableView(){
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: MOVIE_CELL)
    }
    
    func getResponse (feedUrl: String) {
        let movieRequest = ApiRequest(feedUrl: feed)
        movieRequest.getApiDatas {[weak self] result in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let movies):
                self?.movies = movies
            }
        }
    }
    
}


extension MoviesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MOVIE_CELL, for: indexPath)
        
        guard let movieCell = cell as? CustomTableViewCell else {
            return cell
        }
        movieCell.isUserInteractionEnabled = false
        
        let movie = movies[indexPath.row]
        
        if let url = URL(string: movie.artworkUrl100) {
            movieCell.imageIV.loadImage(from: url)
        }
        
        
        movieCell.artistNameLabel.text = movie.artistName
        movieCell.releaseDateLabel.text = movie.releaseDate
        movieCell.nameLabel.text = movie.name
        
        return cell
        
    }
}

extension MoviesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
