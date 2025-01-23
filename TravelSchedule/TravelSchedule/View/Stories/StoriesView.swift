//
//  StoriesView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 22.01.2025.
//

import SwiftUI
import Combine

struct StoriesView: View {
    @Binding var stories: [StoryModel]
    @Binding var isPresented: Bool
    @Binding var currentProgress: CGFloat
    @State var currentStoryIndex: Int
    @Environment(\.presentationMode) var presentationMode
    private let timerConfiguration: TimerConfiguration
    
    init(stories: Binding<[StoryModel]>, isPresented: Binding<Bool>, currentStoryIndex: Int, currentProgress: Binding<CGFloat>) {
        self._stories = stories
        self._isPresented = isPresented
        self._currentStoryIndex = State(initialValue: currentStoryIndex)
        self._currentProgress = currentProgress
        self.timerConfiguration = TimerConfiguration(storiesCount: stories.wrappedValue.count)
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.ypBlackUniversal
                .ignoresSafeArea()
            
            StoriesTabView(stories: $stories, currentStoryIndex: $currentStoryIndex)
                .onChange(of: currentStoryIndex) { oldValue, newValue in
                    didChangeCurrentIndex(oldIndex: oldValue, newIndex: newValue)
                }
            
            StoriesProgressBar(
                storiesCount: stories.count,
                timerConfiguration: timerConfiguration,
                currentProgress: $currentProgress,
                onComplete: moveToNextStory
            )
            .padding(.top, 28)
            .onChange(of: currentProgress) { _, newValue in
                didChangeCurrentProgress(newProgress: newValue)
            }
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
                isPresented = false
            }) {
                Image("closeButton")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.top, 50)
                    .padding(.trailing, 16)
            }
        }
        .onAppear {
            resetProgress()
            markCurrentStoryAsViewed()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func resetProgress() {
        currentProgress = CGFloat(currentStoryIndex) / CGFloat(stories.count)
    }
    
    private func didChangeCurrentIndex(oldIndex: Int, newIndex: Int) {
        guard oldIndex != newIndex else { return }
        let progress = timerConfiguration.progress(for: newIndex)
        guard abs(progress - currentProgress) >= 0.01 else { return }
        withAnimation {
            currentProgress = progress
        }
        markCurrentStoryAsViewed()
    }
    
    private func didChangeCurrentProgress(newProgress: CGFloat) {
        let index = timerConfiguration.index(for: newProgress)
        guard index != currentStoryIndex else { return }
        withAnimation {
            currentStoryIndex = index
        }
        markCurrentStoryAsViewed()
    }
    
    private func markCurrentStoryAsViewed() {
        if !stories[currentStoryIndex].isViewed {
            stories[currentStoryIndex] = stories[currentStoryIndex].update(isNewViewed: true)
        }
    }
    
    private func moveToNextStory() {
        if currentStoryIndex < stories.count - 1 {
            currentStoryIndex += 1
            resetProgress()
        } else {
            if currentProgress >= 1 {
                presentationMode.wrappedValue.dismiss()
                isPresented = false
            } else {
                resetProgress()
            }
        }
    }
}
