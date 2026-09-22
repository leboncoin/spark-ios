//
//  SegmentedControlCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 25/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SegmentedControlCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Icon", code: Self.icon),
            .init(title: "Text", code: Self.text),
            .init(title: "Icon and Text", code: Self.iconAndText),
            .init(title: "Custom", code: Self.custom)
        ]
    }()

    // MARK: - Private Properties

    private static var icon: String {
        """
        @State var selection: Int = 1

        SparkSegmentedControl(selection: $selection) {
            ForEach(0..<3, id: \\.self) { index in
                SparkSegmentedControlItem(
                    tag: index,
                    icon: Image(systemName: "house")
                )
            }
        }
        .sparkTheme(theme)
        """
    }

    private static var text: String {
        """
        @State var selection: Int = 1

        SparkSegmentedControl(selection: $selection) {
            ForEach(0..<3, id: \\.self) { index in
                SparkSegmentedControlItem(
                    tag: index,
                    text: "Item \\(index)"
                )
            }
        }
        .sparkTheme(theme)
        """
    }

    private static var iconAndText: String {
        """
        @State var selection: Int = 1

        SparkSegmentedControl(selection: $selection) {
            ForEach(0..<3, id: \\.self) { index in
                SparkSegmentedControlItem(
                    tag: index,
                    text: "Item \\(index)",
                    icon: Image(systemName: "star")
                )
            }
        }
        .sparkTheme(theme)
        """
    }

    private static var custom: String {
        """
        @State var selection: Int = 1

        SparkSegmentedControl(selection: $selection) {
            ForEach(0..<3, id: \\.self) { index in
                SparkSegmentedControlItem(tag: index) {
                    HStack {
                        Image(systemName: "star")
                        Text("Item \\(index)")
                        Text("(*)")
                            .bold()
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .sparkTheme(theme)
        """
    }
}
