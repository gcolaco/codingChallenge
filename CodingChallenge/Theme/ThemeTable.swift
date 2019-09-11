//
//  ThemeTable.swift
//  CodingChallenge
//
//  Created by Gustavo Colaco on 11/09/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import UIKit

class ThemeTable: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
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
        backgroundColor = theme.backgroundColor
    }
    
    
}
