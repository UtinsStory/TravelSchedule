//
//  StoryView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 22.01.2025.
//

import SwiftUI

struct StoryView: View {
    let story: StoryModel
    
    var body: some View {
        ZStack {
            Image(story.image)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .ignoresSafeArea()
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 10) {
                    Text(story.title)
                        .font(.bold34)
                        .foregroundColor(.white)
                    Text(story.description)
                        .font(.regular20)
                        .lineLimit(3)
                        .foregroundColor(.white)
                }
                .padding(.init(top: 0, leading: 16, bottom: 40, trailing: 16))
            }
        }
    }
}

#Preview {
    StoryView(story: MockData.stories[0])
}
