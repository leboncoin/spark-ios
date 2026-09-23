//
//  SparkTabSnapshotTests.swift
//  SparkComponentTabSnapshotTests
//
//  Created by robin.lemaire on 02/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentTab
import SparkTheming
import SparkTheme

final class SparkTabSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = TabScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = self.component(configuration: configuration)
                    .sparkTheme(self.theme)
                    .sparkTabIntent(configuration.intent)
                    .sparkTabSize(configuration.size)
                    .sparkTabApportionsSegmentWidthsByContent(configuration.apportionsSegmentWidthsByContent)
                    .frame(width: .width(apportionsSegmentWidthsByContent: configuration.apportionsSegmentWidthsByContent))
                    .padding(.vertical, 20)
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
    private func component(configuration: TabConfigurationSnapshotTests) -> some View {
        switch configuration.content {
        case .text:
            self.componentWithText(configuration: configuration)

        case .icon:
            self.componentWithIcon(configuration: configuration)

        case .textAndIcon:
            self.componentWithTextAndIcon(configuration: configuration)

        case .textAndExtraView:
            self.componentWithTextAndExtraView(configuration: configuration)

        case .iconAndExtraView:
            self.componentWithIconAndExtraView(configuration: configuration)

        case .allValues:
            self.componentWithAllValues(configuration: configuration)
        }
    }

    @ViewBuilder
    private func componentWithText(configuration: TabConfigurationSnapshotTests) -> some View {
        @State var selection: Int = configuration.selectedIndex

        switch configuration.contentType {
        case .text:
            SparkTab(selection: $selection) {
                SparkTabItem(tag: 1, text: .mock1)
                SparkTabItem(tag: 2, text: .mock2)
                SparkTabItem(tag: 3, text: .mock3)
            }

        case .custom:
            SparkTab(selection: $selection) {
                SparkTabItem(tag: 1) {
                    CustomLabelView(text: .mock1)
                }
                SparkTabItem(tag: 2) {
                    CustomLabelView(text: .mock2)
                }
                SparkTabItem(tag: 3) {
                    CustomLabelView(text: .mock3)
                }
            }
        }
    }

    @ViewBuilder
    private func componentWithIcon(configuration: TabConfigurationSnapshotTests) -> some View {
        @State var selection: Int = configuration.selectedIndex

        SparkTab(selection: $selection) {
            SparkTabItem(tag: 1, icon: .mock1)
            SparkTabItem(tag: 2, icon: .mock2)
            SparkTabItem(tag: 3, icon: .mock3)
        }
    }

    @ViewBuilder
    private func componentWithTextAndIcon(configuration: TabConfigurationSnapshotTests) -> some View {
        @State var selection: Int = configuration.selectedIndex

        switch configuration.contentType {
        case .text:
            SparkTab(selection: $selection) {
                SparkTabItem(tag: 1, text: .mock1, icon: .mock1)
                SparkTabItem(tag: 2, text: .mock2, icon: .mock2)
                SparkTabItem(tag: 3, text: .mock3, icon: .mock3)
            }

        case .custom:
            SparkTab(selection: $selection) {
                SparkTabItem(tag: 1, icon: .mock1) {
                    CustomLabelView(text: .mock1)
                }
                SparkTabItem(tag: 2, icon: .mock2) {
                    CustomLabelView(text: .mock2)
                }
                SparkTabItem(tag: 3, icon: .mock3) {
                    CustomLabelView(text: .mock3)
                }
            }
        }
    }

    @ViewBuilder
    private func componentWithTextAndExtraView(configuration: TabConfigurationSnapshotTests) -> some View {
        @State var selection: Int = configuration.selectedIndex

        switch configuration.contentType {
        case .text:
            SparkTab(selection: $selection) {
                SparkTabItem(tag: 1, text: .mock1) {
                    ExtraLabelView(text: "2")
                }
                SparkTabItem(tag: 2, text: .mock2) {
                    ExtraLabelView(text: "5")
                }
                SparkTabItem(tag: 3, text: .mock3)
            }

        case .custom:
            SparkTab(selection: $selection) {
                SparkTabItem(tag: 1) {
                    CustomLabelView(text: .mock1)
                } extraLabel: {
                    ExtraLabelView(text: "2")
                }
                SparkTabItem(tag: 2) {
                    CustomLabelView(text: .mock2)
                } extraLabel: {
                    ExtraLabelView(text: "5")
                }
                SparkTabItem(tag: 3) {
                    CustomLabelView(text: .mock3)
                }
            }
        }
    }

    @ViewBuilder
    private func componentWithIconAndExtraView(configuration: TabConfigurationSnapshotTests) -> some View {
        @State var selection: Int = configuration.selectedIndex

        switch configuration.contentType {
        case .text:
            SparkTab(selection: $selection) {
                SparkTabItem(tag: 1, icon: .mock1) {
                    ExtraLabelView(text: "2")
                }
                SparkTabItem(tag: 2, icon: .mock2) {
                    ExtraLabelView(text: "5")
                }
                SparkTabItem(tag: 3, icon: .mock3)
            }

        case .custom:
            SparkTab(selection: $selection) {
                SparkTabItem(tag: 1, icon: .mock1) {
                    CustomLabelView(text: "Icon 1")
                } extraLabel: {
                    ExtraLabelView(text: "2")
                }
                SparkTabItem(tag: 2, icon: .mock2) {
                    CustomLabelView(text: "Icon 2")
                } extraLabel: {
                    ExtraLabelView(text: "5")
                }
                SparkTabItem(tag: 3, icon: .mock3) {
                    CustomLabelView(text: "Icon 3")
                }
            }
        }
    }

    @ViewBuilder
    private func componentWithAllValues(configuration: TabConfigurationSnapshotTests) -> some View {
        @State var selection: Int = configuration.selectedIndex

        switch configuration.contentType {
        case .text:
            SparkTab(selection: $selection) {
                SparkTabItem(tag: 1, text: .mock1, icon: .mock1) {
                    ExtraLabelView(text: "2")
                }
                SparkTabItem(tag: 2, text: .mock2, icon: .mock2) {
                    ExtraLabelView(text: "5")
                }
                SparkTabItem(tag: 3, text: .mock3, icon: .mock3)
            }

        case .custom:
            SparkTab(selection: $selection) {
                SparkTabItem(tag: 1, icon: .mock1) {
                    CustomLabelView(text: .mock1)
                } extraLabel: {
                    ExtraLabelView(text: "2")
                }
                SparkTabItem(tag: 2, icon: .mock2) {
                    CustomLabelView(text: .mock2)
                } extraLabel: {
                    ExtraLabelView(text: "5")
                }
                SparkTabItem(tag: 3, icon: .mock3) {
                    CustomLabelView(text: .mock3)
                }
            }
        }
    }
}

// MARK: - Image Extension

private extension Image {
    static var mock1: Image {
        Image(systemName: "house")
    }

    static var mock2: Image {
        Image(systemName: "star")
    }

    static var mock3: Image {
        Image(systemName: "person")
    }
}

// MARK: - Custom Label View

private struct CustomLabelView: View {
    let text: String

    var body: some View {
        HStack {
            Text(self.text)
            Text("(*)")
                .bold()
                .foregroundColor(.blue)
        }
    }
}

// MARK: - Extra Label View

private struct ExtraLabelView: View {
    let text: String

    var body: some View {
        Text(self.text)
            .lineLimit(1)
            .font(.system(size: 8))
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(.red)
                    .frame(size: 12)
            )
    }
}
