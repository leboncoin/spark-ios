//
//  SegmentedGaugeMarkedSegmentView.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 21/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkTheming

struct SegmentedGaugeMarkedSegmentView: View {

    // MARK: - Properties

    @ScaledMetric private var markerSize: CGFloat

    private var fillColor: any ColorToken = ColorTokenClear()

    // MARK: - Initialization

    init(markerSize: CGFloat) {
        self._markerSize = .init(wrappedValue: markerSize, relativeTo: .largeTitle)
    }

    // MARK: - View

    var body: some View {
        CapsuleWithCircle(
            circleSize: self.markerSize
        )
        .fill(self.fillColor.color)
    }

    // MARK: - Mofidier

    func fill(_ colorToken: any ColorToken) -> Self {
        var copy = self
        copy.fillColor = colorToken
        return copy
    }
}

// MARK: - Shape

private struct CapsuleWithCircle: Shape {

    // MARK: - Properties

    let circleSize: CGFloat

    // MARK: - Path

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Capsule
        let capsuleRect = CGRect(
            x: 0,
            y: 0,
            width: rect.width,
            height: rect.height
        )
        path.addRoundedRect(
            in: capsuleRect,
            cornerSize: CGSize(
                width: rect.height / 2,
                height: rect.height / 2
            )
        )

        // Circle
        let circleRect = CGRect(
            x: rect.midX - self.circleSize / 2,
            y: rect.midY - self.circleSize / 2,
            width: self.circleSize,
            height: self.circleSize
        )
        path.addEllipse(in: circleRect)

        return path
    }
}
