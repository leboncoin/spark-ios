//
//  CircularMeterCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct CircularMeterCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Value Only", code: Self.valueOnly),
            .init(title: "Icon", code: Self.icon),
            .init(title: "Image", code: Self.image),
            .init(title: "Value + Content Text", code: Self.valueContentText),
            .init(title: "Icon + Content Text", code: Self.iconContentText),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var valueOnly: String {
        """
        SparkCircularMeter(value: 0.70)
            .sparkTheme(theme)
            .sparkCircularMeterIntent(.success)
            .sparkCircularMeterSize(.large)
            .sparkCircularMeterAlignment(.center)
        """
    }

    private static var icon: String {
        """
        SparkCircularMeter(
            value: 0.70,
            icon: .sparkCameraOutline
        )
        .sparkTheme(theme)
        .sparkCircularMeterIntent(.main)
        .sparkCircularMeterSize(.large)
        .sparkCircularMeterAlignment(.center)
        """
    }

    private static var image: String {
        """
        SparkCircularMeter(
            value: 0.70,
            image: Image("myImage")
        )
        .sparkTheme(theme)
        .sparkCircularMeterIntent(.success)
        .sparkCircularMeterSize(.large)
        .sparkCircularMeterAlignment(.center)
        """
    }

    private static var valueContentText: String {
        """
        SparkCircularMeter(
            value: 0.70,
            valueText: "70%",
            contentText: "Label"
        )
        .sparkTheme(theme)
        .sparkCircularMeterIntent(.main)
        .sparkCircularMeterSize(.large)
        .sparkCircularMeterAlignment(.center)
        """
    }

    private static var iconContentText: String {
        """
        SparkCircularMeter(
            value: 0.70,
            icon: .sparkCameraOutline,
            contentText: "Label"
        )
        .sparkTheme(theme)
        .sparkCircularMeterIntent(.support)
        .sparkCircularMeterSize(.large)
        .sparkCircularMeterAlignment(.right)
        """
    }

    private static var fullConfiguration: String {
        """
        SparkCircularMeter(
            value: 0.70,
            valueText: "70%",
            contentText: "Label"
        )
        .sparkTheme(theme)
        .sparkCircularMeterIntent(.success)
        .sparkCircularMeterSize(.small)
        .sparkCircularMeterAlignment(.right)
        .accessibilityLabel("70% complete")
        """
    }
}
