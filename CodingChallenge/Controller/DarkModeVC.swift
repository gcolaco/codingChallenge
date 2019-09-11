//
//  DarkModeVC.swift
//  CodingChallenge
//
//  Created by Gustavo Colaco on 11/09/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import UIKit

class DarkModeVC: UIViewController {
    let darkModeLabel = UILabel()
    let darkModeSwitch = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        setupDarkModeLabel()
        setupDarkModeSwitch()
    }
    
    func setupDarkModeLabel() {
        view.addSubview(darkModeLabel)
        darkModeLabel.translatesAutoresizingMaskIntoConstraints = false
        darkModeLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -50).isActive = true
        darkModeLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        darkModeLabel.numberOfLines = 0
        
        darkModeLabel.text = "Enable Dark Mode?"
    }
    
    func setupDarkModeSwitch() {
        view.addSubview(darkModeSwitch)
        
        darkModeSwitch.translatesAutoresizingMaskIntoConstraints = false
        darkModeSwitch.topAnchor.constraint(equalTo: darkModeLabel.bottomAnchor, constant: 10).isActive = true
        darkModeSwitch.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        
        
    }
    
}

