//
//  DotsIndicatorTapInteractionViewModifier.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

/// The interactions of the dots indicator (only when it is interactive):
/// - **Tap**: tapping before the active dot shows the previous page,
///   tapping after it shows the next page (one step per tap).
/// - **Swipe**: swiping to the left/right shows the next/previous page.
/// - **Long press and move**: after a long press, moving the finger changes the page dot after dot.
///
/// Each page change triggers a selection feedback.
/// A dimmed background is displayed and the view is scaled during the long press.
private struct DotsIndicatorTapInteractionViewModifier: ViewModifier {

    // MARK: - Properties

    let isInteractive: Bool
    let numberOfPages: Int
    @Binding var currentPage: Int

    @Environment(\.theme) private var theme
    @Environment(\.dotsIndicatorSize) private var size
    @Environment(\.dotsIndicatorIntent) private var intent
    @Environment(\.isEnabled) private var isEnabled

    /// True while the finger touches the view.
    /// A *GestureState* is automatically reset when the gesture ends **or is cancelled**.
    @GestureState private var isTouching = false

    /// The page and the translation when the long press started (nil when there is no long press in progress).
    @State private var longPress: (startPage: Int, startTranslation: CGFloat)?
    /// The timer which starts the long press.
    @State private var longPressTask: Task<Void, Never>?
    /// True when the finger moved enough to be a swipe (before the long press).
    @State private var isSwiping = false
    /// The last horizontal translation (positive to the right).
    @State private var lastTranslation: CGFloat = 0

    /// Incremented on each page change made by the user (triggers the feedback).
    /// The external page changes (e.g. a bound TabView) don't trigger the feedback.
    @State private var userPageChangeCount = 0

    /// The measured frames of the first, last and active dots (in the *coordinateSpaceName*).
    @State private var dotFrames: [Int: CGRect] = [:]

    // MARK: - Private Properties

    private var isLongPressing: Bool {
        self.longPress != nil
    }

    private var hasInteraction: Bool {
        self.isInteractive && self.isEnabled
    }

    private var selectedPage: Int {
        self.currentPage.clampedPage(numberOfPages: self.numberOfPages)
    }

    /// The width of one step (an inactive dot and its spacing), measured from the layout (Dynamic Type proof).
    private var stepWidth: CGFloat {
        self.dotFrames.dotsIndicatorStepWidth(selectedPage: self.selectedPage, numberOfPages: self.numberOfPages)
    }

    // MARK: - View

    func body(content: Content) -> some View {
        if self.hasInteraction {
            content
                .coordinateSpace(name: DotsIndicatorDotFramesPreferenceKey.coordinateSpaceName)
                .onPreferenceChange(DotsIndicatorDotFramesPreferenceKey.self) { frames in
                    self.dotFrames = frames
                }
                .background {
                    if self.isLongPressing {
                        Capsule()
                            .foregroundStyle(self.theme.colors.longPressBackground(intent: self.intent))
                            .padding(self.theme.layout.longPressBackgroundPadding(size: self.size))
                            .transition(.opacity)
                    }
                }
                .scaleEffect(self.isLongPressing ? self.theme.layout.longPressScale : 1)
                .optionalAnimation(self.theme.animation.activeDot, value: self.isLongPressing)
                .contentShape(Rectangle())
                .gesture(self.interactionGesture)
                .onChange(of: self.isTouching) { _, isTouching in
                    // Cancelled gesture (onEnded not called): reset after the possible onEnded.
                    guard !isTouching else { return }
                    DispatchQueue.main.async { self.resetInteraction() }
                }
                .sparkSensoryFeedback(.selection, trigger: self.userPageChangeCount)
        } else {
            content
        }
    }

    // MARK: - Gesture

    /// A single gesture for all the interactions (no conflict between several gestures):
    /// - **Tap**: the finger is lifted before the long press and without moving.
    /// - **Swipe**: the finger moved before the long press.
    /// - **Long press and move**: the finger stayed down without moving during the long press duration.
    private var interactionGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .named(DotsIndicatorDotFramesPreferenceKey.coordinateSpaceName))
            .updating(self.$isTouching) { _, state, _ in
                state = true
            }
            .onChanged { value in
                self.touchChanged(value)
            }
            .onEnded { value in
                self.touchEnded(value)
            }
    }

    private func touchChanged(_ value: DragGesture.Value) {
        let translation = value.translation.width
        self.lastTranslation = translation

        // First event: start the long press timer.
        if self.longPressTask == nil, !self.isSwiping, !self.isLongPressing {
            self.startLongPressTimer()
        }

        // Long press and move: change the page dot after dot.
        if let longPress = self.longPress {
            self.setPage(longPress.startPage.longPressPage(
                translation: translation,
                startTranslation: longPress.startTranslation,
                stepWidth: self.stepWidth,
                numberOfPages: self.numberOfPages
            ))
            return
        }

        // Moved before the long press: it is a swipe.
        if value.translation.isDotsIndicatorSwipe {
            self.isSwiping = true
            self.longPressTask?.cancel()
        }
    }

    private func touchEnded(_ value: DragGesture.Value) {
        defer { self.resetInteraction() }

        guard !self.isLongPressing else { return }

        if self.isSwiping || value.translation.isDotsIndicatorSwipe {
            self.swipe(translation: value.translation.width)
        } else {
            self.tap(locationX: value.location.x)
        }
    }

    private func startLongPressTimer() {
        self.longPressTask = Task { @MainActor in
            try? await Task.sleep(for: .seconds(DotsIndicatorConstants.longPressMinimumDuration))
            guard !Task.isCancelled, self.isTouching, !self.isSwiping else { return }

            self.longPress = (self.selectedPage, self.lastTranslation)
        }
    }

    private func resetInteraction() {
        guard !self.isTouching else { return }

        self.longPressTask?.cancel()
        self.longPressTask = nil
        self.longPress = nil
        self.isSwiping = false
        self.lastTranslation = 0
    }

    /// Tap before the active dot shows the previous page, after it shows the next page.
    private func tap(locationX: CGFloat) {
        guard let activeDotFrame = self.dotFrames[self.selectedPage],
              let firstDotFrame = self.dotFrames[0] else { return }

        self.setPage(self.selectedPage.tappedPage(
            tapLocationX: locationX,
            activeDotFrame: activeDotFrame,
            firstDotFrame: firstDotFrame,
            numberOfPages: self.numberOfPages
        ))
    }

    /// Swipe to the left shows the next page, swipe to the right shows the previous page.
    private func swipe(translation: CGFloat) {
        self.setPage(self.selectedPage.swipedPage(translation: translation, numberOfPages: self.numberOfPages))
    }

    // MARK: - Setter

    private func setPage(_ page: Int) {
        guard page != self.selectedPage else { return }
        self.currentPage = page
        self.userPageChangeCount += 1
    }
}

extension View {

    func dotsIndicatorTapInteraction(
        isInteractive: Bool,
        numberOfPages: Int,
        currentPage: Binding<Int>
    ) -> some View {
        self.modifier(DotsIndicatorTapInteractionViewModifier(
            isInteractive: isInteractive,
            numberOfPages: numberOfPages,
            currentPage: currentPage
        ))
    }
}
