//
//  Location.swift
//  TodoTDD
//
//  Created by QDSG on 2019/8/1.
//  Copyright © 2019 unitTao. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let coordinate: CLLocationCoordinate2D?
    
    // plist
    private let nameKey = "nameKey"
}
