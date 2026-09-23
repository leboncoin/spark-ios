//
//  SegmentedGaugeColors.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming
import Foundation

struct SegmentedGaugeColors: Equatable {

    // MARK: - Properties

    var plainSegmentBackground: any ColorToken = ColorTokenClear()
    var otherSegmentBackground: any ColorToken = ColorTokenClear()

    var plainSegmentBorder: any ColorToken = ColorTokenClear()
    var otherSegmentBorder: any ColorToken = ColorTokenClear()

    var markerOuterBackground: any ColorToken = ColorTokenClear()
    var markerInnerBackground: any ColorToken = ColorTokenClear()

    var plainSegmentOpacity: CGFloat = .zero

    // MARK: - Methods

    func segmentBackground(isPlain: Bool) -> any ColorToken {
        return isPlain ? self.plainSegmentBackground : self.otherSegmentBackground
    }

    func segmentBorder(isPlain: Bool) -> any ColorToken {
        return isPlain ? self.plainSegmentBorder : self.otherSegmentBorder
    }

    func segmentIsOpacity(isPlain: Bool) -> Bool {
        return self.segmentOpacity(isPlain: isPlain) < 1.0
    }

    func segmentOpacity(isPlain: Bool) -> CGFloat {
        return isPlain ? self.plainSegmentOpacity : 1.0
    }

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.plainSegmentBackground.equals(rhs.plainSegmentBackground) &&
        lhs.otherSegmentBackground.equals(rhs.otherSegmentBackground) &&
        lhs.plainSegmentBorder.equals(rhs.plainSegmentBorder) &&
        lhs.otherSegmentBorder.equals(rhs.otherSegmentBorder) &&
        lhs.markerOuterBackground.equals(rhs.markerOuterBackground) &&
        lhs.markerInnerBackground.equals(rhs.markerInnerBackground)
    }
}
