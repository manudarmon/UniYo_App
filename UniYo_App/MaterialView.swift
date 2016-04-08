//
//  MaterialView.swift
//  UniYo_App
//
//  Created by Emmanuel Darmon on 08/04/2016.
//  Copyright © 2016 Emmanuel Darmon. All rights reserved.
//

import UIKit

class FacebookLogin: UIButton {
    override func awakeFromNib() {
        layer.cornerRadius = 5.0
    }
}

class EmailLogin: UIButton {
    override func awakeFromNib() {
        layer.cornerRadius = 5.0
        layer.borderColor = UNIYO_GREEN.CGColor
        layer.borderWidth = 1.0
    }
}