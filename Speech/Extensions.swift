//
//  Extensions.swift
//  speak2me
//
//  Created by Omar Al-Ejel on 9/15/17.
//  Copyright © 2017 Omar Al-Ejel. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("button pressed: " + (self.titleLabel?.text ?? "label has no title"))
        super.touchesBegan(touches, with: event)
    }
}