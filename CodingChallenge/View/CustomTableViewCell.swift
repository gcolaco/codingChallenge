//
//  CustomTableViewCell.swift
//  CodingChallenge
//
//  Created by Gustavo Colaco on 11/09/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//


import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var safeArea: UILayoutGuide!

    let nameLabel = UILabel()

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        safeArea = layoutMarginsGuide
        setupNameLabel()
    }
    

    private func setupNameLabel(){
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 8).isActive = true
        nameLabel.font = UIFont(name: "Verdana-Bold", size: 12)
    }

}

