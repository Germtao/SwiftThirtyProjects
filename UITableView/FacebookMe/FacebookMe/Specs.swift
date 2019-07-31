//
//  Specs.swift
//  FacebookMe
//
//  Created by QDSG on 2019/7/30.
//  Copyright © 2019 unitTao. All rights reserved.
//

import UIKit

public struct Specs {
    struct Color {
        let tint = UIColor(hex: 0x3b5998)
        let red = UIColor.red
        let white = UIColor.white
        let black = UIColor.black
        let lightGray = UIColor.lightGray
    }
    
    struct FontSize {
        let tiny: CGFloat = 10
        let small: CGFloat = 12
        let regular: CGFloat = 14
        let large: CGFloat = 16
    }
    
    struct Font {
        
        private struct FontName {
            static let regularName = "Helvetica Neue"
            static let boldName = "Helvetica Neue Bold"
        }
        
        let tiny = UIFont(name: FontName.regularName, size: Specs.fontSize.tiny)
        let small = UIFont(name: FontName.regularName, size: Specs.fontSize.small)
        let regular = UIFont(name: FontName.regularName, size: Specs.fontSize.regular)
        let large = UIFont(name: FontName.regularName, size: Specs.fontSize.large)
        
        let smallBold = UIFont(name: FontName.boldName, size: Specs.fontSize.small)
        let regularBold = UIFont(name: FontName.boldName, size: Specs.fontSize.regular)
        let largeBold = UIFont(name: FontName.boldName, size: Specs.fontSize.large)
    }
    
    struct ImageName {
        let friends = "fb_friends"
        let events = "fb_events"
        let groups = "fb_groups"
        let education = "fb_education"
        let townHall = "fb_town_hall"
        let instantGames = "fb_games"
        let settings = "fb_settings"
        let privacyShortcuts = "fb_privacy_shortcuts"
        let helpSupport = "fb_help_and_support"
        let placeholder = "fb_placeholder"
    }
    
    static var color: Color {
        return Color()
    }
    
    static var font: Font {
        return Font()
    }
    
    static var fontSize: FontSize {
        return FontSize()
    }
    
    static var imageName: ImageName {
        return ImageName()
    }
}
