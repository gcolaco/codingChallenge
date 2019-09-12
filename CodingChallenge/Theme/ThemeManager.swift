//
//  ThemeManager.swift
//  CodingChallenge
//
//  Created by Gustavo Colaco on 11/09/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import Foundation

struct ThemeManager {
    static let isDarkModeKey = "isDarkMode"
    
    //get info about the current Theme
    static var currentTheme: Theme {
        return isDarkMode() ? Theme.dark : Theme.light
    }
    
    static func isDarkMode() -> Bool {
        return UserDefaults.standard.bool(forKey: isDarkModeKey)
    }
    
    static func enableDarkMode() {
        UserDefaults.standard.set(true, forKey: isDarkModeKey)
        NotificationCenter.default.post(name: .darkModeHasChanged, object: nil)
    }
    
    static func disableDarkMode() {
        UserDefaults.standard.set(false, forKey: isDarkModeKey)
        NotificationCenter.default.post(name: .darkModeHasChanged, object: nil)
    }
    
    static func addDarkModeObserver(to observer: Any, selector: Selector) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: .darkModeHasChanged, object: nil)
    }
    
}

extension Notification.Name {
    static let darkModeHasChanged = Notification.Name("darkModeHasChanged")
}
