//
//  ThemeTabController.swift
//  CodingChallenge
//
//  Created by Gustavo Colaco on 11/09/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import UIKit

/*
 This class, prepare the tabBar controller from the app to be able to have the option of getting a dark mode.
 */

class ThemeTabController: UITabBarController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        ThemeManager.addDarkModeObserver(to: self, selector: #selector(handleDarkModeAction))
        handleDarkModeAction()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleDarkModeAction () {
        handleDarkMode(theme: ThemeManager.currentTheme)
    }
    
    //pass the currente theme for the handler, so it could know what color use.

    func handleDarkMode(theme: Theme) {
        tabBar.barTintColor = theme.backgroundColor
    }
    // it returns the theme controller, because changes in the status bar are made. And the ThemeController is responsible for that
    override var childForStatusBarStyle: UIViewController? {
        return ThemeController()
    }
    
    
    
}
