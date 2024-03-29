//
//  CustomTableViewCell.swift
//  CodingChallenge
//
//  Created by Gustavo Colaco on 11/09/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import UIKit

class CustomTableViewCell: ThemeCell {
    
    var safeArea: UILayoutGuide!
    let imageIV = CustomImageView()
    let artistNameLabel = UILabel()
    let releaseDateLabel = UILabel()
    let nameLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func handleDarkMode(theme: Theme) {
        backgroundColor = theme.backgroundColor
        artistNameLabel.textColor = theme.textColor
        releaseDateLabel.textColor = theme.textColor
        nameLabel.textColor = theme.textColor
    }
    
    private func setupView() {
        safeArea = layoutMarginsGuide
        setupImageView()
        setupNameLabel()
        setupArtistNameLabel()
        setupReleaseDateLabel()
    }
    //MARK: - ImageView Constraints
    private func setupImageView() {
        addSubview(imageIV)
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        
        imageIV.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        imageIV.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageIV.widthAnchor.constraint(equalToConstant: 95).isActive = true
        imageIV.heightAnchor.constraint(equalToConstant: 95).isActive = true
        imageIV.layer.cornerRadius = 25
        imageIV.contentMode = .scaleAspectFit
        imageIV.clipsToBounds = true
    }
    //MARK: -  Name Label Constraints
    private func setupNameLabel(){
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: imageIV.trailingAnchor, constant: 5).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        nameLabel.font = UIFont(name: "Verdana-Bold", size: 14)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.numberOfLines = 0
        nameLabel.minimumScaleFactor = 0.2
    }
    //MARK: -  Artist Label Constraints
    private func setupArtistNameLabel(){
        addSubview(artistNameLabel)
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        artistNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        artistNameLabel.font = UIFont(name: "Verdana-Bold", size: 12)
    }
    
    //MARK: -  Release Label Constraints
    private func setupReleaseDateLabel(){
        addSubview(releaseDateLabel)
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        releaseDateLabel.leadingAnchor.constraint(equalTo: artistNameLabel.leadingAnchor).isActive = true
        releaseDateLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 8).isActive = true
        releaseDateLabel.font = UIFont(name: "Verdana", size: 10)
    }
    
}


