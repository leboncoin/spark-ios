//
//  SparkAwarenessCardSnapshotTests.swift
//  SparkComponentCardSnapshotTests
//
//  Created by robin.lemaire on 17/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentCard
import SparkResources
import SparkTheming
import SparkTheme
import SparkComponentButton
import SparkComponentTextLink

final class SparkAwarenessCardSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = AwarenessCardScenarioSnapshotTests.allCases
        self.loadScenarios(scenarios)
    }

    // MARK: - Scenarios

    private func loadScenarios(_ scenarios: [AwarenessCardScenarioSnapshotTests]) {
        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = self.component(configuration: configuration)
                    .sparkTheme(self.theme)
                    .sparkCardIntent(configuration.intent)
                    .frame(
                        width: AwarenessCardConstantsSnapshotsTests.size.width
                    )
                    .padding(.horizontal, 20)
                    .padding(.vertical, 60)
                    .background(.gray)
                    .fixedSize()

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

    // MARK: - Component

    @ViewBuilder
    private func component(
        configuration: AwarenessCardConfigurationSnapshotTests
    ) -> some View {
        let icon: Image? = configuration.isIcon ? Image(spark: \.warningOutline) : nil

        switch (configuration.content, configuration.contentType) {
        // Title only
        case (.title, .native):
            self.componentWithOnlyNativeTitle(
                configuration: configuration,
                icon: icon
            )

        case (.title, .custom):
            self.componentWithOnlyCustomTitle(
                configuration: configuration,
                icon: icon
            )

        // Description only
        case (.description, .native):
            self.componentWithOnlyNativeDescription(
                configuration: configuration,
                icon: icon
            )

        case (.description, .custom):
            self.componentWithOnlyCustomDescription(
                configuration: configuration,
                icon: icon
            )

        // All only
        case (.all, .native):
            self.componentWithNativeAll(
                configuration: configuration,
                icon: icon
            )

        case (.all, .custom):
            self.componentWithCustomAll(
                configuration: configuration,
                icon: icon
            )
        }
    }

    // MARK: - With Title Component

    @ViewBuilder
    private func componentWithOnlyNativeTitle(
        configuration: AwarenessCardConfigurationSnapshotTests,
        icon: Image?
    ) -> some View {
        if configuration.isAction {
            SparkAwarenessCard(
                icon: icon,
                title: .titleMock,
                actionLabel: {
                    self.actionContent()
                }
            )
        } else {
            SparkAwarenessCard(
                icon: icon,
                title: .titleMock
            )
        }
    }

    @ViewBuilder
    private func componentWithOnlyCustomTitle(
        configuration: AwarenessCardConfigurationSnapshotTests,
        icon: Image?
    ) -> some View {
        if configuration.isAction {
            SparkAwarenessCard(
                icon: icon,
                titleLabel: {
                    self.titleLabel()
                },
                actionLabel: {
                    self.actionContent()
                }
            )
        } else {
            SparkAwarenessCard(
                icon: icon,
                titleLabel: {
                    self.titleLabel()
                }
            )
        }
    }

    // MARK: - With Description Component

    @ViewBuilder
    private func componentWithOnlyNativeDescription(
        configuration: AwarenessCardConfigurationSnapshotTests,
        icon: Image?
    ) -> some View {
        if configuration.isAction {
            SparkAwarenessCard(
                icon: icon,
                description: .descriptionMock,
                actionLabel: {
                    self.actionContent()
                }
            )
        } else {
            SparkAwarenessCard(
                icon: icon,
                description: .descriptionMock
            )
        }
    }

    @ViewBuilder
    private func componentWithOnlyCustomDescription(
        configuration: AwarenessCardConfigurationSnapshotTests,
        icon: Image?
    ) -> some View {
        if configuration.isAction {
            SparkAwarenessCard(
                icon: icon,
                descriptionLabel: {
                    self.descriptionLabel()
                },
                actionLabel: {
                    self.actionContent()
                }
            )
        } else {
            SparkAwarenessCard(
                icon: icon,
                descriptionLabel: {
                    self.descriptionLabel()
                }
            )
        }
    }

    // MARK: - All Subviews Component

    @ViewBuilder
    private func componentWithNativeAll(
        configuration: AwarenessCardConfigurationSnapshotTests,
        icon: Image?
    ) -> some View {
        if configuration.isAction {
            SparkAwarenessCard(
                icon: icon,
                title: .titleMock,
                description: .descriptionMock,
                actionLabel: {
                    self.actionContent()
                }
            )
        } else {
            SparkAwarenessCard(
                icon: icon,
                title: .titleMock,
                description: .descriptionMock
            )
        }
    }

    @ViewBuilder
    private func componentWithCustomAll(
        configuration: AwarenessCardConfigurationSnapshotTests,
        icon: Image?
    ) -> some View {
        if configuration.isAction {
            SparkAwarenessCard(
                icon: icon,
                titleLabel: {
                    self.titleLabel()
                },
                descriptionLabel: {
                    self.descriptionLabel()
                },
                actionLabel: {
                    self.actionContent()
                }
            )
        } else {
            SparkAwarenessCard(
                icon: icon,
                titleLabel: {
                    self.titleLabel()
                },
                descriptionLabel: {
                    self.descriptionLabel()
                }
            )
        }
    }

    // MARK: - Helper Views

    private func titleLabel() -> some View {
        Group {
            Text(String.titleMock)

            Text("!!!")
                .foregroundColor(.green)
        }
    }

    private func descriptionLabel() -> some View {
        Group {
            Text(String.descriptionMock)

            Text("???")
                .foregroundColor(.green)
        }
    }

    private func actionContent() -> some View {
        SparkTextLink("Learn More") {
        }
    }
}

// MARK: - Extension

private extension String {

    static let titleMock = "Important Update"
    static let descriptionMock = "Your account has been updated. Please review the changes."
}
