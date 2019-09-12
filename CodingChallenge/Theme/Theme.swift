//
//  Theme.swift
//  CodingChallenge
//
//  Created by Gustavo Colaco on 11/09/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import UIKit

//set the colors for the background and texts from all the views.
struct Theme {
    let textColor: UIColor
    let backgroundColor: UIColor
    
    static let light = Theme(textColor: .black, backgroundColor: .white)
    static let dark = Theme(textColor: .white, backgroundColor: .black)
}
