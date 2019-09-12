//
//  ThemeController.swift
//  CodingChallenge
//
//  Created by Gustavo Colaco on 11/09/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import UIKit

/*
 This class, prepare the viewController from the app to be able to have the option of getting a dark mode.
 */

class ThemeController: UIViewController {
    var current = UIStatusBarStyle.default
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return current
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
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
    
    //sets the background and text color of the statusBar

    func handleDarkMode(theme: Theme) {
        view.backgroundColor = theme.backgroundColor
        
        current = ThemeManager.isDarkMode() ? .lightContent : .default
        setNeedsStatusBarAppearanceUpdate()
    }
}

