//
//  TextEditorViewModel.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 16/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// UseCase only used by **SwiftUI** TextEditor View.
// sourcery: AutoPublisherTest, AutoViewModelStub
internal final class TextEditorViewModel: TextInputViewModel {

    // MARK: - Published Properties

    @Published private(set) var horizontalPadding: CGFloat = 0

    // MARK: - Use Case Properties

    private let getHorizontalPaddingUseCase: any TextEditorGetHorizontalPaddingUseCaseable

    // MARK: - Initialization

    init(
        getHorizontalPaddingUseCase: any TextEditorGetHorizontalPaddingUseCaseable = TextEditorGetHorizontalPaddingUseCase()
    ) {
        self.getHorizontalPaddingUseCase = getHorizontalPaddingUseCase
    }

    // MARK: - Private Setter

    private func setHorizontalPadding() {
        self.horizontalPadding = self.getHorizontalPaddingUseCase.execute(spacings: self.spacings)
    }

    // MARK: - Update

    override func spacingDidUpdate() {
        self.setHorizontalPadding()
    }
}
