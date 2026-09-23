//
//  SparkAvatarSnapshotTests.swift
//  SparkComponentAvatarSnapshotTests
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentAvatar
import SparkComponentBadge
import SparkTheming
import SparkTheme

final class SparkAvatarSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = AvatarScenarioSnapshotTests.allCases
        self.loadScenarios(scenarios)
    }

    // MARK: - Scenarios

    private func loadScenarios(_ scenarios: [AvatarScenarioSnapshotTests]) {
        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = self.component(for: configuration)
                    .sparkTheme(self.theme)
                    .sparkAvatarSize(configuration.size)
                    .sparkAvatarActionType(configuration.actionType)
                    .sparkAvatarIsBorder(configuration.isBorder)
                    .disabled(configuration.isDisabled)
                    .padding(configuration.size.padding)
                    .background(.background)
                    .fixedSize()
                    .sparkIsSnapshot(true)

                self.assertSnapshot(
                    matching: view,
                    named: configuration.name,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName,
                    forDocumentation: scenario.isDocumentation
                )
            }
        }
    }

    // MARK: - View Builder

    @ViewBuilder
    private func component(for configuration: AvatarConfigurationSnapshotTests) -> some View {
        switch (configuration.contentType, configuration.isImage) {
        case (.company, true):
            self.imageCompanyComponent(for: configuration)
        case (.company, false):
            self.urlCompanyComponent(for: configuration)
        case (.user, true):
            self.imageUserComponent(for: configuration)
        case (.user, false):
            self.urlUserComponent(for: configuration)
        }
    }

    // MARK: - With URL

    @ViewBuilder
    private func urlCompanyComponent(for configuration: AvatarConfigurationSnapshotTests) -> some View {
        switch configuration.cornerViewType {
        case .badge:
            SparkCompanyAvatar(url: .mock) {
                SparkBadge()
            }

        case .button:
            SparkCompanyAvatar(
                url: .mock,
                action: {
                    // Action
                }
            )

        case .none:
            SparkCompanyAvatar(url: .mock)
        }
    }

    @ViewBuilder
    private func urlUserComponent(for configuration: AvatarConfigurationSnapshotTests) -> some View {
        switch configuration.cornerViewType {
        case .badge:
            SparkUserAvatar(
                url: .mock,
                placeholder: .mock
            ) {
                SparkBadge()
            }

        case .button:
            SparkUserAvatar(
                url: .mock,
                placeholder: .mock,
                action: {
                    // Action
                }
            )

        case .none:
            SparkUserAvatar(
                url: .mock,
                placeholder: .mock
            )
        }
    }

    // MARK: - With Image

    @ViewBuilder
    private func imageCompanyComponent(for configuration: AvatarConfigurationSnapshotTests) -> some View {
        switch configuration.cornerViewType {
        case .badge:
            SparkCompanyAvatar(image: .companyMock) {
                SparkBadge()
            }

        case .button:
            SparkCompanyAvatar(
                image: .companyMock,
                action: {
                    // Action
                }
            )

        case .none:
            SparkCompanyAvatar(image: .companyMock)
        }
    }

    @ViewBuilder
    private func imageUserComponent(for configuration: AvatarConfigurationSnapshotTests) -> some View {
        switch configuration.cornerViewType {
        case .badge:
            SparkUserAvatar(
                image: .userMock,
                placeholder: .mock
            ) {
                SparkBadge()
            }

        case .button:
            SparkUserAvatar(
                image: .userMock,
                placeholder: .mock,
                action: {
                    // Action
                }
            )

        case .none:
            SparkUserAvatar(
                image: .userMock,
                placeholder: .mock
            )
        }
    }
}

// MARK: - Extension

private extension String {
    static var mock = "Bunny"
}

private extension AvatarSize {

    var padding: CGFloat {
        switch self {
        case .xs: 14
        case .sm: 20
        case .md: 24
        case .lg: 34
        case .xl: 40
        case .xxl: 56
        case .xxxl: 72
        }
    }
}
