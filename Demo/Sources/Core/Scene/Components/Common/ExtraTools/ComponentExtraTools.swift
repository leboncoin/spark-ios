//
//  ComponentExtraTools.swift
//  SparkDemo
//
//  Created by robin.lemaire on 20/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

protocol ComponentExtraTools {
    var figmaLink: String? { get }
    var documentationLink: String? { get }

    var swiftUICodeSyntaxes: [CodeSyntax] { get }
    var uiKitCodeSyntaxes: [CodeSyntax] { get }

    init()
}

extension ComponentExtraTools {

    func showLinks() -> Bool {
        self.figmaLink != nil || self.documentationLink != nil
    }

    func links() -> [String?] {
        return [
            self.documentationLink,
            self.figmaLink
        ]
    }
}
