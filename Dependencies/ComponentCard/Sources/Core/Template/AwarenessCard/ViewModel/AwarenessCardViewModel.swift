//
//  AwarenessCardViewModel.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 17/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
final class AwarenessCardViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var layout = AwarenessCardLayout()
    @Published private(set) var typographies = AwarenessCardTypographies()

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setLayout()
            self.setTypographies()
        }
    }

    // MARK: - Private Properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getLayoutUseCase: any AwarenessCardGetLayoutUseCaseable
    private let getTypographiesUseCase: any AwarenessCardGetTypographiesUseCaseable

    // MARK: - Initialization

    init(
        getLayoutUseCase: any AwarenessCardGetLayoutUseCaseable = AwarenessCardGetLayoutUseCase(),
        getTypographiesUseCase: any AwarenessCardGetTypographiesUseCaseable = AwarenessCardGetTypographiesUseCase()
    ) {
        self.getLayoutUseCase = getLayoutUseCase
        self.getTypographiesUseCase = getTypographiesUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme
    ) {
        self.theme = theme

        self.setLayout()
        self.setTypographies()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setLayout() {
        guard let theme else { return }

        self.layout = self.getLayoutUseCase.execute(
            theme: theme
        )
    }

    private func setTypographies() {
        guard let theme else { return }

        self.typographies = self.getTypographiesUseCase.execute(
            theme: theme
        )
    }
}
