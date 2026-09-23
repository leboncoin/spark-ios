//
//  CommonGroupViewModel.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// ViewModel only used by **SwiftUI** View.
// sourcery: AutoPublisherTest, AutoViewModelStub
internal class CommonGroupViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var spacing: CGFloat = 0

    // MARK: - Properties

    private var alreadyUpdateAll = false

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setSpacing()
        }
    }

    var axis: SelectionControlsAxis? {
        didSet {
            guard oldValue != self.axis, self.alreadyUpdateAll else { return }

            self.setSpacing()
        }
    }

    var isAccessibilitySize: Bool? {
        didSet {
            guard oldValue != self.isAccessibilitySize, self.alreadyUpdateAll else { return }

            self.setSpacing()
        }
    }

    // MARK: - Use Case Properties

    private let getSpacingUseCase: any CommonGroupGetSpacingUseCaseable

    // MARK: - Initialization

    init(
        getSpacingUseCase: any CommonGroupGetSpacingUseCaseable = CommonGroupGetSpacingUseCase()
    ) {
        self.getSpacingUseCase = getSpacingUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        axis: SelectionControlsAxis,
        isAccessibilitySize: Bool
    ) {
        self.theme = theme
        self.axis = axis
        self.isAccessibilitySize = isAccessibilitySize

        self.setSpacing()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setSpacing() {
        guard let theme, let axis, let isAccessibilitySize else {
            return
        }

        self.spacing = self.getSpacingUseCase.execute(
            theme: theme,
            axis: axis,
            isAccessibilitySize: isAccessibilitySize
        )
    }
}
