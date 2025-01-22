//
//  StoryModel.swift
//  TravelSchedule
//
//  Created by Гена Утин on 22.01.2025.
//

import Foundation

struct StoryModel: Identifiable, Hashable {
    let id: Int
    let image: String
    let isViewed: Bool
    let title: String
    let description: String
    
    func update(isNewViewed: Bool) -> StoryModel {
        .init(id: id, image: image, isViewed: isNewViewed, title: title, description: description)
    }
}
