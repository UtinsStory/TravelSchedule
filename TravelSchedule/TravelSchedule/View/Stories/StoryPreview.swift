//
//  StoryPreview.swift
//  TravelSchedule
//
//  Created by Гена Утин on 23.01.2025.
//

import SwiftUI

struct StoryPreview: View {
    let story: StoryModel
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(story.image)
                .resizable()
                .scaledToFill()
                .frame(width: 92, height: 140)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: 16 ).stroke(story.isViewed ? Color.clear : Color.blue, lineWidth: 8)
                )
                .opacity(story.isViewed ? 0.5 : 1.0)
            
            Text(story.title)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.white)
                .lineLimit(3)
                .padding(.init(top: 83, leading: 8, bottom: 12, trailing: 8))
                .frame(width: 92, height: 140, alignment: .bottomLeading)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}


#Preview {
    StoryPreview(story: MockData.stories[0])
}
