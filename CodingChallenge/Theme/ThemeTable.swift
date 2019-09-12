//
//  ThemeTable.swift
//  CodingChallenge
//
//  Created by Gustavo Colaco on 11/09/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import UIKit

/*
 This class, prepare any tableView from the app to be able to have the option of getting a dark mode.
 */


class ThemeTable: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        ThemeManager.addDarkModeObserver(to: self, selector: #selector(handleDarkModeAction))
        handleDarkModeAction()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //pass the currente theme for the handler, so it could know what color use.
    @objc private func handleDarkModeAction () {
        handleDarkMode(theme: ThemeManager.currentTheme)
    }
    
    //sets the background color
    func handleDarkMode(theme: Theme) {
        backgroundColor = theme.backgroundColor
    }
    
    
}
