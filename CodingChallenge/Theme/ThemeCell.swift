//
//  ThemeCell.swift
//  CodingChallenge
//
//  Created by Gustavo Colaco on 11/09/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import UIKit

/*
 This class, prepare any tableView Cell from the app to be able to have the option of getting a dark mode.
 */

class ThemeCell: UITableViewCell {
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        ThemeManager.addDarkModeObserver(to: self, selector: #selector(handleDarkModeAction))
        handleDarkModeAction()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc private func handleDarkModeAction () {
        handleDarkMode(theme: ThemeManager.currentTheme)
    }
    
    func handleDarkMode(theme: Theme) {
        
    }
    
    
}

