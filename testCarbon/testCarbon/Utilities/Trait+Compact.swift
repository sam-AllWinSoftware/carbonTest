//
//  Trait+Compact.swift
//  testCarbon
//
//  Created by User on 4/5/22.
//

import Foundation
import UIKit

extension UITraitCollection {
    var isCompact: Bool {
        return horizontalSizeClass == .compact || verticalSizeClass == .compact
    }
}

extension UIView {
    var isLandscapePhone: Bool {
        if traitCollection.isCompact, let size = window?.bounds.size, size.height < size.width {
            return true
        }
        return false
    }
}
