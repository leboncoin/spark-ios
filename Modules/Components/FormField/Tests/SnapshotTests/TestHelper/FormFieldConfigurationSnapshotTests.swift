//
//  FormFieldConfigurationSnapshotTests.swift
//  SparkComponentFormFieldSnapshotTests
//
//  Created by alican.aycil on 08.04.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentFormField
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct FormFieldConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: FormFieldScenarioSnapshotTests
    let feedbackState: FormFieldFeedbackState
    let titleType: TextType
    let clearButtonImageName: String?
    let helperType: TextType
    let helperImageName: String?
    let isCounter: Bool
    let isRequired: Bool
    let isEnabled: Bool
    let modes: [ComponentSnapshotTestMode]
    let sizes: [UIContentSizeCategory]

    // MARK: - Getter

    func testName() -> String {
        return [
            "\(self.scenario.rawValue)",
            "\(self.feedbackState)" + "FeedbackState",
            "\(self.titleType.prefixName)" + "Title",
            self.clearButtonImageName != nil ? "withClearButton" : nil,
            "\(self.helperType.prefixName)" + "Helper",
            self.helperImageName != nil ? "withHelperImage" : nil,
            self.isRequired ? "isRequired" : nil,
            self.isEnabled ? "isEnabled" : nil,
            self.isCounter ? "isCounter" : nil
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }
}

// MARK: - Enums

enum ContentType: CaseIterable {
    case title
    case helper
}

enum TextType: CaseIterable {
    case none
    case short
    case long

    // MARK: - Properties

    var prefixName: String {
        switch self {
        case .none: "without"
        case .short: "withSort"
        case .long: "withLong"
        }
    }

    private var value: String? {
        switch self {
        case .none: nil
        case .short: "Lorem Ipsum"
        case .long: "It is a long established fact that a reader will be distracted."
        }
    }

    // MARK: - Methods

    func value(from contentType: ContentType) -> String? {
        switch self {
        case .none: nil
        case .short:
            switch contentType {
            case .title: "Agreement"
            case .helper: "Your agreement is important."
            }
        case .long: self.value
        }
    }
}
