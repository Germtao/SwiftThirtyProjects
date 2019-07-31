//
//  TableKeys.swift
//  FacebookMe
//
//  Created by QDSG on 2019/7/30.
//  Copyright © 2019 unitTao. All rights reserved.
//

import Foundation

public struct TableKeys {
    static let section = "section"
    static let rows = "rows"
    static let imageName = "imageName"
    static let title = "title"
    static let subTitle = "subTitle"
    static let seeMore = "See More..."
    static let addFavorites = "Add Favorites..."
    static let logout = "Log Out..."
    
    static func populate(with user: User) -> [[String: Any]] {
        return [
            [
                TableKeys.rows: [
                    [TableKeys.imageName: user.avatarName, TableKeys.title: user.name, TableKeys.subTitle: "View your profile"]
                ]
            ],
            [
                TableKeys.rows: [
                    [TableKeys.imageName: Specs.imageName.friends, TableKeys.title: "Friends"],
                    [TableKeys.imageName: Specs.imageName.events, TableKeys.title: "Events"],
                    [TableKeys.imageName: Specs.imageName.groups, TableKeys.title: "Groups"],
                    [TableKeys.imageName: Specs.imageName.education, TableKeys.title: "Education"],
                    [TableKeys.imageName: Specs.imageName.townHall, TableKeys.title: "Town Hall"],
                    [TableKeys.imageName: Specs.imageName.instantGames, TableKeys.title: "Instant Games"],
                    [TableKeys.title: TableKeys.seeMore]
                ]
            ],
            [
                TableKeys.section: "FAVORITES",
                TableKeys.rows: [
                    [TableKeys.title: TableKeys.addFavorites]
                ]
            ],
            [
                TableKeys.rows: [
                    [TableKeys.imageName: Specs.imageName.settings, TableKeys.title: "Settings"],
                    [TableKeys.imageName: Specs.imageName.privacyShortcuts, TableKeys.title: "Privacy Shortcuts"],
                    [TableKeys.imageName: Specs.imageName.helpSupport, TableKeys.title: "Help And Support"]
                ]
            ],
            [
                TableKeys.rows: [
                    [TableKeys.title: TableKeys.logout]
                ]
            ]
        ]
    }
}
