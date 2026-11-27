//
//  DotsIndicatorDotFrameViewModifier.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

/// The frames of the dots needed by the interactions (first, last and active dots).
struct DotsIndicatorDotFramesPreferenceKey: PreferenceKey {

    // MARK: - Properties

    /// The name of the coordinate space used to measure the dots frames.
    static let coordinateSpaceName = "DotsIndicatorCoordinateSpace"
    static let defaultValue: [Int: CGRect] = [:]

    static func reduce(value: inout [Int: CGRect], nextValue: () -> [Int: CGRect]) {
        value.merge(nextValue()) { $1 }
    }
}

private struct DotsIndicatorDotFrameViewModifier: ViewModifier {

    // MARK: - Properties

    let index: Int
    let isReported: Bool

    // MARK: - View

    /// The background is always applied (no *if/else* on the content):
    /// changing the structure would recreate the dot and break its animation.
    func body(content: Content) -> some View {
        content.background {
            GeometryReader { proxy in
                let frame = proxy.frame(in: .named(DotsIndicatorDotFramesPreferenceKey.coordinateSpaceName))
                Color.clear.preference(
                    key: DotsIndicatorDotFramesPreferenceKey.self,
                    value: self.isReported ? [self.index: frame] : [:]
                )
            }
        }
    }
}

extension View {

    /// Report the frame of the dot when it is needed by the interactions (first, last and active dots).
    func dotsIndicatorDotFrame(index: Int, selectedPage: Int, numberOfPages: Int) -> some View {
        self.modifier(DotsIndicatorDotFrameViewModifier(
            index: index,
            isReported: index.isDotFrameReported(selectedPage: selectedPage, numberOfPages: numberOfPages)
        ))
    }
}
