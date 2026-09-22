//
//  CommonGroupUIViewModel.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 10/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// ViewModel only used by **UIKit** View.
// sourcery: AutoPublisherTest, AutoViewModelStub
internal class CommonGroupUIViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var spacing: CGFloat = 0

    // MARK: - Properties

    private var alreadyUpdateAll = false

    var theme: any Theme {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setSpacing()
        }
    }

    var axis: SelectionControlsAxis = .default {
        didSet {
            guard oldValue != self.axis, self.alreadyUpdateAll else { return }

            self.setSpacing()
        }
    }

    var isAccessibilitySize: Bool = false {
        didSet {
            guard oldValue != self.isAccessibilitySize, self.alreadyUpdateAll else { return }

            self.setSpacing()
        }
    }

    // MARK: - Use Case Properties

    private let getSpacingUseCase: any CommonGroupGetSpacingUseCaseable

    // MARK: - Initialization

    init(
        theme: any Theme,
        getSpacingUseCase: any CommonGroupGetSpacingUseCaseable = CommonGroupGetSpacingUseCase()
    ) {
        self.theme = theme
        self.getSpacingUseCase = getSpacingUseCase
    }

    // MARK: - Load

    func load(
        isAccessibilitySize: Bool
    ) {
        self.isAccessibilitySize = isAccessibilitySize

        self.setSpacing()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setSpacing() {
        self.spacing = self.getSpacingUseCase.execute(
            theme: self.theme,
            axis: self.axis,
            isAccessibilitySize: self.isAccessibilitySize
        )
    }
}
