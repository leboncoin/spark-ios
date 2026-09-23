//
//  SegmentedGaugeViewModel.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
final class SegmentedGaugeViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var colors = SegmentedGaugeColors()
    @Published private(set) var labelsStyle = SegmentedGaugeLabelsStyle()
    @Published private(set) var layout = SegmentedGaugeLayout()
    @Published private(set) var levels = SegmentedGaugeLevels()
    @Published private(set) var segmentBorder = SegmentedGaugeSegmentBorder()
    @Published private(set) var sizes = SegmentedGaugeSizes()

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setColors()
            self.setLabelsStyle()
            self.setLayout()
            self.setSegmentBorder()
        }
    }

    var alignment: SegmentedGaugeAlignment? {
        didSet {
            guard oldValue != self.alignment, self.alreadyUpdateAll else { return }

            self.setLayout()
        }
    }

    var segments: SegmentedGaugeSegments? {
        didSet {
            guard oldValue != self.segments, self.alreadyUpdateAll else { return }

            self.setColors()
            self.setLevels()
        }
    }

    var size: SegmentedGaugeSize? {
        didSet {
            guard oldValue != self.size, self.alreadyUpdateAll else { return }

            self.setSizes()
        }
    }

    var type: SegmentedGaugeType? {
        didSet {
            guard oldValue != self.type, self.alreadyUpdateAll else { return }

            self.setColors()
            self.setLevels()
        }
    }

    // MARK: - Private properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getColorsUseCase: any SegmentedGaugeGetColorsUseCaseable
    private let getLabelsStyleUseCase: any SegmentedGaugeGetLabelsStyleUseCaseable
    private let getLayoutUseCase: any SegmentedGaugeGetLayoutUseCaseable
    private let getLevelsUseCase: any SegmentedGaugeGetLevelsUseCaseable
    private let getSegmentBorderUseCase: any SegmentedGaugeGetSegmentBorderUseCaseable
    private let getSizesUseCase: any SegmentedGaugeGetSizesUseCaseable

    // MARK: - Initialization

    init(
        getColorsUseCase: any SegmentedGaugeGetColorsUseCaseable = SegmentedGaugeGetColorsUseCase(),
        getLabelsStyleUseCase: any SegmentedGaugeGetLabelsStyleUseCaseable = SegmentedGaugeGetLabelsStyleUseCase(),
        getLayoutUseCase: any SegmentedGaugeGetLayoutUseCaseable = SegmentedGaugeGetLayoutUseCase(),
        getLevelsUseCase: any SegmentedGaugeGetLevelsUseCaseable = SegmentedGaugeGetLevelsUseCase(),
        getSegmentBorderUseCase: any SegmentedGaugeGetSegmentBorderUseCaseable = SegmentedGaugeGetSegmentBorderUseCase(),
        getSizesUseCase: any SegmentedGaugeGetSizesUseCaseable = SegmentedGaugeGetSizesUseCase()
    ) {
        self.getColorsUseCase = getColorsUseCase
        self.getLabelsStyleUseCase = getLabelsStyleUseCase
        self.getLayoutUseCase = getLayoutUseCase
        self.getLevelsUseCase = getLevelsUseCase
        self.getSegmentBorderUseCase = getSegmentBorderUseCase
        self.getSizesUseCase = getSizesUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        alignment: SegmentedGaugeAlignment,
        segments: SegmentedGaugeSegments,
        size: SegmentedGaugeSize,
        type: SegmentedGaugeType
    ) {
        self.theme = theme
        self.alignment = alignment
        self.segments = segments
        self.size = size
        self.type = type

        self.setColors()
        self.setLabelsStyle()
        self.setLayout()
        self.setLevels()
        self.setSegmentBorder()
        self.setSizes()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setColors() {
        guard let theme, let type, let segments else { return }

        self.colors = self.getColorsUseCase.execute(
            theme: theme,
            type: type,
            segments: segments
        )
    }

    private func setLabelsStyle() {
        guard let theme else { return }

        self.labelsStyle = self.getLabelsStyleUseCase.execute(
            theme: theme
        )
    }

    private func setLayout() {
        guard let theme, let alignment else { return }

        self.layout = self.getLayoutUseCase.execute(
            theme: theme,
            alignment: alignment
        )
    }

    private func setLevels() {
        guard let segments, let type else { return }

        self.levels = self.getLevelsUseCase.execute(
            segments: segments,
            type: type
        )
    }

    private func setSegmentBorder() {
        guard let theme else { return }

        self.segmentBorder = self.getSegmentBorderUseCase.execute(
            theme: theme
        )
    }

    private func setSizes() {
        guard let size else { return }

        self.sizes = self.getSizesUseCase.execute(
            size: size
        )
    }
}
