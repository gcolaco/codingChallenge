//
//  ThemeNavigation.swift
//  CodingChallenge
//
//  Created by Gustavo Colaco on 11/09/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import UIKit

class ThemeNavigation: UINavigationController {
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        ThemeManager.addDarkModeObserver(to: self, selector: #selector(handleDarkModeAction))
        handleDarkModeAction()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleDarkModeAction () {
        handleDarkMode(theme: ThemeManager.currentTheme)
    }
    
    func handleDarkMode(theme: Theme) {
        navigationBar.barTintColor = theme.backgroundColor
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: theme.textColor]
    }
    
    
    
}
