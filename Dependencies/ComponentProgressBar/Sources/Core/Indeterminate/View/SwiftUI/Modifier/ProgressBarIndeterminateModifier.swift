//
//  ProgressBarIndeterminateModifier.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import Combine

struct ProgressBarIndeterminateModifier: ViewModifier {

    // MARK: - Properties

    let viewModel: ProgressBarIndeterminateViewModel

    @State private var animationStepTimer = Self.createTimer()
    @State private var width: CGFloat = .zero

    // MARK: - Body

    func body(content: Content) -> some View {
        GeometryReader { geometryReader in

            content
                .frame(width: self.viewModel.animationData.indicatorWidth)
                .offset(x: self.viewModel.animationData.leadingSpaceWidth)
                .opacity(self.viewModel.indicatorOpacity)
                .onAppear {
                    self.width = geometryReader.size.width
                }
                .onChange(of: geometryReader.size) { newSize in
                    self.width = newSize.width
                }
        }
        .onReceive(self.viewModel.$animationType) { type in
            let animation: Animation?
            switch type {
            case .easeIn:
                animation = .easeIn(duration: ProgressBarIndeterminateConstants.Animation.duration)
            case .easeOut:
                animation = .easeOut(duration: ProgressBarIndeterminateConstants.Animation.duration)
            default:
                animation = .none
            }

            withAnimation(animation) {
                self.viewModel.updateAnimatedData(
                    from: self.width
                )
            }
        }
        .onReceive(self.animationStepTimer) { time in
            self.viewModel.animationStepIsDone()
        }
        .onReceive(self.viewModel.$animationStatus) { status in
            switch status {
            case .start:
                self.animationStepTimer = Self.createTimer()
            case .stop:
                self.animationStepTimer.upstream.connect().cancel()
            }
        }
    }

    // MARK: - Timer

    private static func createTimer() -> Publishers.Autoconnect<Timer.TimerPublisher> {
        return Timer.publish(
            every: ProgressBarIndeterminateConstants.Animation.duration,
            on: .main,
            in: .common
        )
        .autoconnect()
    }
}
