//
//  PopoverCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct PopoverCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Basic", code: Self.basic),
            .init(title: "With Intent", code: Self.withIntent),
            .init(title: "With Attachment Anchor", code: Self.withAttachmentAnchor),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var basic: String {
        """
        @State private var isPresented: Bool = false

        Button("Show popover") {
            isPresented = true
        }
        .sparkPopover(isPresented: $isPresented) {
            Text("This is a popover")
        }
        .sparkTheme(theme)
        """
    }

    private static var withIntent: String {
        """
        @State private var isPresented: Bool = false

        Button("Show popover") {
            isPresented = true
        }
        .sparkPopover(isPresented: $isPresented) {
            Text("Info message")
        }
        .sparkTheme(theme)
        .sparkPopoverIntent(.info)
        """
    }

    private static var withAttachmentAnchor: String {
        """
        @State private var isPresented: Bool = false

        Button("Show popover") {
            isPresented = true
        }
        .sparkPopover(
            isPresented: $isPresented,
            attachmentAnchor: .rect(.bounds),
            arrowEdge: .bottom
        ) {
            Text("Attached to bottom")
        }
        .sparkTheme(theme)
        """
    }

    private static var fullConfiguration: String {
        """
        @State private var isPresented: Bool = false

        Button("Show popover") {
            isPresented = true
        }
        .sparkPopover(
            isPresented: $isPresented,
            attachmentAnchor: .rect(.bounds),
            arrowEdge: .top
        ) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Popover Title")
                    .font(.headline)

                Text("This is a comprehensive example showing all major features of the Popover component. You can customize the intent, attachment anchor, and arrow edge.")
                    .font(.body)
                    .frame(maxWidth: 300)
            }
        }
        .sparkTheme(theme)
        .sparkPopoverIntent(.info)
        """
    }
}
