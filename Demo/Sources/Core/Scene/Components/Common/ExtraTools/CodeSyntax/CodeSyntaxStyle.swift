//
//  CodeSyntaxStyle.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// TODO: 
// Tous ce qui commence par un point et fini par un )
// Tous ce qui commence par un point et fini par un (

struct CodeSyntaxStyle {

    static func apply(_ code: String) -> AttributedString {
        var attributed = AttributedString(code)

        // Styles
        let keywordColor = Color.purple
        let typeColor = Color.pink
        let caseColor = Color.blue
        let functionCalledColor = Color.indigo
        let stringColor = Color.orange
        let commentColor = Color.green

        // Regex patterns
        let keywords = #"\b(let|var|func|struct|class|enum|protocol|import|if|else|for|while|return|in|some|any|await|async|self|inout|where)\b"#
        let types = #"\b(String|Int|Double|Float|Bool|Array|Dictionary|Set|Self|.init|.Theme|MyTheme)\b"#
        let foundationTypes = #"NS[a-zA-Z0-9_]*"#
        let functionCalled = #"\.[a-zA-Z_][a-zA-Z0-9_]*\("#
        let dotEnumCase = #"(?<=\(|,|\s)\.[A-Za-z_][A-Za-z0-9_]*\b"#
        let sparkTypes = #"Spark[a-zA-Z0-9_]*"#
        let strings = #"\".*?\""#
        let comments = #"//.*"#

        // List of patterns
        let swiftUIPattern = self.wordListPattern(self.swiftUIComponents)
        let uiKitPattern = self.wordListPattern(self.uiKitComponents)

        self.highlightPattern(keywords, in: &attributed, color: keywordColor)
        self.highlightPattern(types, in: &attributed, color: typeColor)
        self.highlightPattern(foundationTypes, in: &attributed, color: typeColor)
        self.highlightPattern(sparkTypes, in: &attributed, color: typeColor)
        self.highlightPattern(strings, in: &attributed, color: stringColor)
        self.highlightPattern(comments, in: &attributed, color: commentColor)
        self.highlightPattern(swiftUIPattern, in: &attributed, color: typeColor)
        self.highlightPattern(uiKitPattern, in: &attributed, color: typeColor)
        self.highlightPattern(dotEnumCase, in: &attributed, color: caseColor)
        self.highlightPattern(functionCalled, in: &attributed, color: functionCalledColor)

        return attributed
    }

    private static func highlightPattern(
        _ pattern: String,
        in attributed: inout AttributedString,
        color: SwiftUI.Color
    ) {
        let string = String(attributed.characters)
        let regex = try? NSRegularExpression(pattern: pattern)
        let nsRange = NSRange(string.startIndex..<string.endIndex, in: string)

        regex?.enumerateMatches(in: string, range: nsRange) { match, _, _ in
            guard let range = match?.range,
                  let swiftRange = Range(range, in: string),
                  let lower = AttributedString.Index(swiftRange.lowerBound, within: attributed),
                  let upper = AttributedString.Index(swiftRange.upperBound, within: attributed)
            else { return }

            let attrRange = lower..<upper
            attributed[attrRange].foregroundColor = color
            attributed[attrRange].font = .system(.body, design: .monospaced)
        }
    }

    private static func wordListPattern(_ words: [String]) -> String {
        let escaped = words.map { NSRegularExpression.escapedPattern(for: $0) }
        return #"\b("# + escaped.joined(separator: "|") + #")\b"#
    }

    // MARK: - Native components

    private static let swiftUIComponents: [String] = [
        // Protocols / bases
        "View", "App", "Scene",

        // Conteneurs de layout
        "VStack", "HStack", "ZStack",
        "LazyVStack", "LazyHStack",
        "LazyVGrid", "LazyHGrid",
        "List", "Form", "Group", "GroupBox",
        "ScrollView", "ScrollViewReader",

        // Navigation
        "NavigationView", "NavigationStack", "NavigationSplitView",
        "NavigationLink",
        "TabView",
        "NavigationPath",

        // Contrôles
        "Text", "Label", "Image",
        "Button", "Toggle", "Slider", "Stepper",
        "TextField", "SecureField", "DatePicker", "ColorPicker",
        "Picker", "Menu",
        "ProgressView",

        // Présentations / overlays
        "Alert", "Sheet", "Popover", "ConfirmationDialog",

        // List-related
        "Section", "ForEach",

        // Autres vues fréquentes
        "Spacer", "Divider",
        "Map", // si tu utilises MapKit SwiftUI
        "AsyncImage",

        // Modificateurs de style / environnement
        "GeometryReader",
        "AnyView",

        // Animations / dessins
        "Canvas",
        "TimelineView",
        "PhaseAnimator",

        // App entry
        "WindowGroup"
    ]

    private static let uiKitComponents: [String] = [
        // Bases
        "UIResponder", "UIApplication", "UIApplicationDelegate",
        "UIWindow",

        // Vues de base
        "UIView", "UIControl", "UILabel", "UIButton", "UIImageView",
        "UITextField", "UITextView", "UISwitch", "UISlider",
        "UIStepper", "UIProgressView", "UIActivityIndicatorView",

        // Containers
        "UIViewController", "UINavigationController", "UITabBarController",
        "UISplitViewController", "UIPageViewController",

        // Table & collection
        "UITableView", "UITableViewCell",
        "UICollectionView", "UICollectionViewCell", "UICollectionReusableView",

        // Barres & items
        "UINavigationBar", "UIToolbar", "UITabBar", "UITabBarItem",
        "UIBarButtonItem",

        // Scroll & input
        "UIScrollView", "UIStackView",
        "UIPickerView", "UIDatePicker",
        "UISearchBar", "UISearchController",

        // Alertes & présentations
        "UIAlertController", "UIAlertAction",

        // AutoLayout & dessin
        "NSLayoutConstraint", "UILayoutGuide",
        "UIBezierPath", "CAShapeLayer",

        // Gesture
        "UIGestureRecognizer",
        "UITapGestureRecognizer", "UIPanGestureRecognizer",
        "UIPinchGestureRecognizer", "UIRotationGestureRecognizer",
        "UILongPressGestureRecognizer", "UISwipeGestureRecognizer",

        // Autres utilitaires fréquents
        "UIColor", "UIFont", "UIImage", "UIScreen", "UIDevice"
    ]
}
