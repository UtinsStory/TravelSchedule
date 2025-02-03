//
//  Mock.swift
//  TravelSchedule
//
//  Created by Гена Утин on 10.01.2025.
//

import Foundation

enum TimeIntervalEnum: String, CaseIterable {
    case morning = "Утро 08:00 - 12:00"
    case day = "День 12:00 - 18:00"
    case evening = "Вечер 18:00 - 00:00"
    case night = "Ночь 00:00 - 06:00"
}

enum MockData {
    
    static let stories: [StoryModel] = [
            StoryModel(id: 0, image: "storyImage1", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
            StoryModel(id: 1, image: "storyImage2", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
            StoryModel(id: 2, image: "storyImage3", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
            StoryModel(id: 3, image: "storyImage4", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
            StoryModel(id: 4, image: "storyImage5", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
            StoryModel(id: 5, image: "storyImage6", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
            StoryModel(id: 6, image: "storyImage7", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
            StoryModel(id: 7, image: "storyImage8", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
            StoryModel(id: 8, image: "storyImage9", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
            StoryModel(id: 9, image: "storyImage10", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
            StoryModel(id: 10, image: "storyImage11", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
            StoryModel(id: 11, image: "storyImage12", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
            StoryModel(id: 12, image: "storyImage13", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
            StoryModel(id: 13, image: "storyImage14", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
            StoryModel(id: 14, image: "storyImage15", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
            StoryModel(id: 15, image: "storyImage16", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
            StoryModel(id: 16, image: "storyImage17", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
            StoryModel(id: 17, image: "storyImage18", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
            
        ]
}
