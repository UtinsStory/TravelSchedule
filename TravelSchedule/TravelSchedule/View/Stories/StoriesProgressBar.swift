//
//  StoriesProgressBar.swift
//  TravelSchedule
//
//  Created by Гена Утин on 22.01.2025.
//

import SwiftUI
import Combine

struct StoriesProgressBar: View {
    
    private let storiesCount: Int
    let timerConfiguration: TimerConfiguration
    @Binding var currentProgress: CGFloat
    @State private var timer: Timer.TimerPublisher
    @State private var cancellable: Cancellable?
    var onComplete: () -> Void
    
    init(
        storiesCount: Int,
        timerConfiguration: TimerConfiguration,
        currentProgress: Binding<CGFloat>,
        onComplete: @escaping () -> Void
    ) {
        self.storiesCount = storiesCount
        self.timerConfiguration = timerConfiguration
        self._currentProgress = currentProgress
        self._timer = State(initialValue: Self.makeTimer(configuration: timerConfiguration))
        self.onComplete = onComplete
    }
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    StoriesProgressBar()
}
