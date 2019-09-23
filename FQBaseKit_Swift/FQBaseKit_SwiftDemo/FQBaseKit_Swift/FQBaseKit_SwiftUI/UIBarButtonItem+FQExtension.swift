//
//  UIBarButtonItem+FQExtension.swift
//  FQBaseKit_SwiftDemo
//
//  Created by owen on 2019/8/29.
//  Copyright © 2019 owen. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIBarButtonItem extension

public var fq_badge: UILabel?
// Badge value to be display
public var fq_badgeValue = ""
// Badge background color
public var fq_badgeBGColor: UIColor?
// Badge text color
public var fq_badgeTextColor: UIColor?
// Badge font
public var fq_badgeFont: UIFont?
// Padding value for the badge
public var fq_badgePadding: CGFloat = 0.0
// Minimum size badge to small
public var fq_badgeMinSize: CGFloat = 0.0
// Values for offseting the badge over the BarButtonItem you picked
public var fq_badgeOriginX: CGFloat = 0.0
public var fq_badgeOriginY: CGFloat = 0.0
// In case of numbers, remove the badge when reaching zero
public var fq_shouldHideBadgeAtZero = false
// Badge has a bounce animation when value changes
public var fq_shouldAnimateBadge = false

public extension UIBarButtonItem {
    
    convenience init(barButtonSpaceType space: UIBarButtonItem.SystemItem, width: CGFloat = 0.0) {
        if space == .fixedSpace || space == .flexibleSpace {
            self.init(barButtonSystemItem: space, target: nil, action: nil)
            
            if space == .fixedSpace {
                self.width = width
            }
        } else {
            self.init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        }
    }
    
    
    
    
}

