//
//  StoriesTabView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 23.01.2025.
//

import SwiftUI

struct StoriesTabView: View {
    @Binding var stories: [StoryModel]
    @Binding var currentStoryIndex: Int

    var body: some View {
        TabView(selection: $currentStoryIndex) {
            ForEach(stories.indices, id: \.self) { index in
                StoryView(story: stories[index])
                    .tag(index)
                    .onTapGesture {
                        didTapStory()
                    }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }

    private func didTapStory() {
        currentStoryIndex = min(currentStoryIndex + 1, stories.count - 1)
    }
}
