//
//  RoadMap.swift
//  IDev
//
//  Created by Татьяна Касперович on 6.09.23.
//

import SwiftUI

struct Level: Identifiable, Hashable {
    let id = UUID().uuidString
    let title: String
    var isSelect: Bool
    let categories: [Category]
}

struct Category: Identifiable, Hashable {
    let id = UUID().uuidString
    let title: String
    let subTitle: String
    let description: String
    let color: Color
    let category: CategoriesBlock_2
    let roadMap: [RoadMap]
}

struct RoadMap: Identifiable, Hashable {
    let id: Int
    let title: String
    let descriptio: String
    let url: String?
    let rating: Int
}



enum CategoriesBlock_2: String, CaseIterable {
    case swift = "Swift"
    case swiftUI = "SwiftUI"
    case uIKit = "UIKit"
    
    case noCategory = "No Category"
        
    var categoryKey: String? {
        if self == .noCategory {
            return nil
        }
        return self.rawValue
    }
}
