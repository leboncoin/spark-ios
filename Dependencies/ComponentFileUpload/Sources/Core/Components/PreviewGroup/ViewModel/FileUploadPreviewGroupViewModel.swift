//
//  FileUploadPreviewGroupViewModel.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
final class FileUploadPreviewGroupViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var layout = FileUploadPreviewGroupLayout()

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setLayout()
        }
    }

    // MARK: - Private Properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getLayoutUseCase: any FileUploadPreviewGroupGetLayoutUseCaseable

    // MARK: - Initialization

    init(
        getLayoutUseCase: any FileUploadPreviewGroupGetLayoutUseCaseable = FileUploadPreviewGroupGetLayoutUseCase()
    ) {
        self.getLayoutUseCase = getLayoutUseCase
    }

    // MARK: - Setup

    func setup(theme: any Theme) {
        self.theme = theme

        self.setLayout()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setLayout() {
        guard let theme else { return }

        self.layout = self.getLayoutUseCase.execute(theme: theme)
    }
}
