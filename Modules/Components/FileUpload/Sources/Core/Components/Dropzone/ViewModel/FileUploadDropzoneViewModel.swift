//
//  FileUploadDropzoneViewModel.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoViewModelStub
@Observable final class FileUploadDropzoneViewModel {

    // MARK: - Observable Properties

    private(set) var border = FileUploadDropzoneBorder()
    private(set) var colors = FileUploadDropzoneColors()
    private(set) var fonts = FileUploadDropzoneFonts()
    private(set) var layout = FileUploadDropzoneLayout()

    // MARK: - Properties

    @ObservationIgnored var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setColors()
            self.setFonts()
            self.setLayout()
        }
    }

    @ObservationIgnored var isTargeted: Bool = false {
        didSet {
            guard oldValue != self.isTargeted, self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    // MARK: - Private Properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getBorderUseCase: any FileUploadDropzoneGetBorderUseCaseable
    private let getColorsUseCase: any FileUploadDropzoneGetColorsUseCaseable
    private let getFontsUseCase: any FileUploadDropzoneGetFontsUseCaseable
    private let getLayoutUseCase: any FileUploadDropzoneGetLayoutUseCaseable

    // MARK: - Initialization

    init(
        getBorderUseCase: any FileUploadDropzoneGetBorderUseCaseable = FileUploadDropzoneGetBorderUseCase(),
        getColorsUseCase: any FileUploadDropzoneGetColorsUseCaseable = FileUploadDropzoneGetColorsUseCase(),
        getFontsUseCase: any FileUploadDropzoneGetFontsUseCaseable = FileUploadDropzoneGetFontsUseCase(),
        getLayoutUseCase: any FileUploadDropzoneGetLayoutUseCaseable = FileUploadDropzoneGetLayoutUseCase()
    ) {
        self.getBorderUseCase = getBorderUseCase
        self.getColorsUseCase = getColorsUseCase
        self.getFontsUseCase = getFontsUseCase
        self.getLayoutUseCase = getLayoutUseCase
    }

    // MARK: - Setup

    func setup(theme: any Theme) {
        self.theme = theme

        self.setBorder()
        self.setColors()
        self.setFonts()
        self.setLayout()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setBorder() {
        guard let theme else { return }

        self.border = self.getBorderUseCase.execute(theme: theme)
    }

    private func setColors() {
        guard let theme else { return }

        self.colors = self.getColorsUseCase.execute(
            theme: theme,
            isTargeted: self.isTargeted
        )
    }

    private func setFonts() {
        guard let theme else { return }

        self.fonts = self.getFontsUseCase.execute(theme: theme)
    }

    private func setLayout() {
        guard let theme else { return }

        self.layout = self.getLayoutUseCase.execute(theme: theme)
    }
}
