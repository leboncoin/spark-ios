//
//  SnackbarSnapshotTests.swift
//  SparkComponentSnackbarSnapshotTests
//
//  Created by robin.lemaire on 18/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentSnackbar
import SparkTheming
import SparkTheme
import SparkComponentButton

final class SnackbarSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = SnackbarScenario.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = self.component(configuration: configuration)
                    .sparkTheme(self.theme)
                    .sparkSnackbarIntent(configuration.intent)
                    .sparkSnackbarAlignment(configuration.alignment)
                    .frame(width: 375)
                    .padding(.vertical, 40)
                    .padding(.horizontal, 20)
                    .background(.background)

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

    @ViewBuilder
    private func component(configuration: SnackbarScenarioConfiguration) -> some View {
        let icon = configuration.hasIcon ? Image(systemName: "checkmark.circle.fill") : nil

        switch (configuration.titleContent, configuration.descriptionContent) {
        case (.none, .text):
            if configuration.hasButton {
                Snackbar(
                    icon,
                    titleLabel: { EmptyView() },
                    descriptionLabel: { Text(String.mock) }
                ) {
                    self.button()
                }
            } else {
                Snackbar(
                    icon,
                    titleLabel: { EmptyView() },
                    descriptionLabel: { Text(String.mock) },
                    button: { EmptyView() }
                )
            }

        case (.none, .label):
            if configuration.hasButton {
                Snackbar(
                    icon,
                    titleLabel: {
                        EmptyView()
                    },
                    descriptionLabel: {
                        CustomDescriptionView(text: String.mock)
                    }
                ) {
                    self.button()
                }
            } else {
                Snackbar(
                    icon,
                    titleLabel: {
                        EmptyView()
                    },
                    descriptionLabel: {
                        CustomDescriptionView(text: String.mock)
                    },
                    button: {
                        EmptyView()
                    }
                )
            }

        case (.text, .text):
            if configuration.hasButton {
                Snackbar(
                    icon,
                    titleLabel: {
                        Text(String.mock)
                    },
                    descriptionLabel: {
                        Text(String.longMock)
                    }
                ) {
                    self.button()
                }
            } else {
                Snackbar(
                    icon,
                    titleLabel: {
                        Text(String.mock)
                    },
                    descriptionLabel: {
                        Text(String.longMock)
                    },
                    button: { EmptyView() }
                )
            }

        case (.text, .label):
            if configuration.hasButton {
                Snackbar(
                    icon,
                    titleLabel: {
                        Text(String.mock)
                    },
                    descriptionLabel: {
                        CustomDescriptionView(text: String.longMock)
                    }
                ) {
                    self.button()
                }
            } else {
                Snackbar(
                    icon,
                    titleLabel: {
                        Text(String.mock)
                    },
                    descriptionLabel: {
                        CustomDescriptionView(text: String.longMock)
                    },
                    button: { EmptyView() }
                )
            }

        case (.label, .text):
            if configuration.hasButton {
                Snackbar(
                    icon,
                    titleLabel: {
                        CustomTitleView(text: String.mock)
                    },
                    descriptionLabel: {
                        Text(String.longMock)
                    }
                ) {
                    self.button()
                }
            } else {
                Snackbar(
                    icon,
                    titleLabel: {
                        CustomTitleView(text: String.mock)
                    },
                    descriptionLabel: {
                        Text(String.longMock)
                    },
                    button: { EmptyView() }
                )
            }

        case (.label, .label):
            if configuration.hasButton {
                Snackbar(
                    icon,
                    titleLabel: {
                        CustomTitleView(text: String.mock)
                    },
                    descriptionLabel: {
                        CustomDescriptionView(text: String.longMock)
                    }
                ) {
                    self.button()
                }
            } else {
                Snackbar(
                    icon,
                    titleLabel: {
                        CustomTitleView(text: String.mock)
                    },
                    descriptionLabel: {
                        CustomDescriptionView(text: String.longMock)
                    },
                    button: { EmptyView() }
                )
            }
        }
    }

    @ViewBuilder
    private func button() -> some View {
        SparkButton("Action") {
            // Action
        }
        .sparkButtonVariant(.ghost)
    }
}

// MARK: - Custom Title View

private struct CustomTitleView: View {
    let text: String

    var body: some View {
        HStack(spacing: 4) {
            Text(self.text)
            Text("(*)")
                .bold()
                .foregroundColor(.red)
        }
    }
}

// MARK: - Custom Description View

private struct CustomDescriptionView: View {
    let text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(self.text)
            Text("(Custom)")
                .font(.caption)
                .foregroundStyle(.red)
                .italic()
        }
    }
}
