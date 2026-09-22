//
//  BellAnimationModifier.swift
//  SparkCommon
//
//  Created by robin.lemaire on 15/11/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI

internal struct BellAnimationModifier: ViewModifier {

    // MARK: - Properties

    private let rotation: CGFloat = 10
    @State private var ringBell: Bool = false
    @State private var counter: Int = 0

    private let delay: TimeInterval
    private let `repeat`: SparkAnimationRepeat
    private var completion: (() -> Void)?

    // MARK: - Initialization

    init(
        delay: TimeInterval,
        `repeat`: SparkAnimationRepeat,
        completion: (() -> Void)? = nil
    ) {
        self.delay = delay
        self.`repeat` = `repeat`
        self.completion = completion
    }

    // MARK: - Content

    func body(content: Content) -> some View {
        content
            .rotationEffect(
                .degrees(self.ringBell ? -self.rotation : self.rotation)
            )
            .animation(
                .interpolatingSpring(stiffness: 400, damping: 4),
                value: self.ringBell
            )
            .rotationEffect(
                .degrees(self.ringBell ? self.rotation : -self.rotation)
            )
            .animation(.easeOut, value: self.ringBell)
            .onAppear() {
                // If we go back to the view, to avoid a multiple animation, we check if the rightBell is always false.
                guard !self.ringBell else { return }

                Task { @MainActor in
                    let nanoseconds = UInt64(self.delay * 1_000_000_000)
                    try await Task.sleep(nanoseconds: nanoseconds)
                    self.ringBell.toggle()
                }
            }
            .onChange(of: self.ringBell) { _ in
                Task { @MainActor in
                    let nanoseconds = UInt64(3 * 1_000_000_000)
                    try await Task.sleep(nanoseconds: nanoseconds)

                    self.counter += 1
                    if self.repeat.canContinue(counter: self.counter) {
                        self.ringBell.toggle()
                    } else {
                        self.completion?()
                    }
                }
            }
            .id("bell-animation-\(self.counter)") // Needed to reload the animation from the initial position
    }
}
