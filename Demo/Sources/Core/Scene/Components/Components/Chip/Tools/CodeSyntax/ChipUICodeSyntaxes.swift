//
//  ChipUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ChipUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Icon Only", code: Self.iconOnly),
            .init(title: "Text Only", code: Self.textOnly),
            .init(title: "Text + Icon", code: Self.textIcon),
            .init(title: "With Attributed Text", code: Self.withAttributedText),
            .init(title: "With Extra Content", code: Self.withExtraContent),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var iconOnly: String {
        """
        let chip = SparkUIChip(theme: theme)
        chip.icon = UIImage(systemName: "star.fill")
        chip.intent = .main
        chip.variant = .filled
        chip.accessibilityLabel = "Chip icon"
        chip.addAction(UIAction(handler: { _ in }), for: .touchUpInside)
        """
    }

    private static var textOnly: String {
        """
        let chip = SparkUIChip(theme: theme)
        chip.text = "My Chip"
        chip.intent = .main
        chip.variant = .filled
        chip.addAction(UIAction(handler: { _ in }), for: .touchUpInside)
        """
    }

    private static var textIcon: String {
        """
        let chip = SparkUIChip(theme: theme)
        chip.text = "My Chip"
        chip.icon = UIImage(systemName: "star.fill")
        chip.intent = .support
        chip.variant = .outlined
        chip.alignment = .trailingIcon
        chip.addAction(UIAction(handler: { _ in }), for: .touchUpInside)
        """
    }

    private static var withAttributedText: String {
        """
        let chip = SparkUIChip(theme: theme)
        let attributedText = NSAttributedString(
            string: "Styled Chip",
            attributes: [.foregroundColor: UIColor.blue]
        )
        chip.attributedText = attributedText
        chip.icon = UIImage(systemName: "star.fill")
        chip.intent = .main
        chip.variant = .filled
        chip.addAction(UIAction(handler: { _ in }), for: .touchUpInside)
        """
    }

    private static var withExtraContent: String {
        """
        let chip = SparkUIChip(theme: theme)
        chip.text = "Notifications"
        chip.icon = UIImage(systemName: "bell.fill")

        let badgeLabel = UILabel()
        badgeLabel.text = "99"
        badgeLabel.font = .systemFont(ofSize: 10, weight: .bold)
        badgeLabel.textColor = .white
        badgeLabel.backgroundColor = .red
        badgeLabel.textAlignment = .center
        badgeLabel.layer.cornerRadius = 8
        badgeLabel.clipsToBounds = true

        chip.extraContent = badgeLabel
        chip.intent = .main
        chip.variant = .filled
        chip.addAction(UIAction(handler: { _ in }), for: .touchUpInside)
        """
    }

    private static var fullConfiguration: String {
        """
        let chip = SparkUIChip(theme: theme)
        chip.text = "Full Configuration"
        chip.icon = UIImage(systemName: "star.fill")
        chip.intent = .main
        chip.variant = .filled
        chip.alignment = .leadingIcon
        chip.size = .large
        chip.isSelected = false
        chip.isEnabled = true
        chip.accessibilityLabel = "Full configuration chip"
        chip.addAction(UIAction(handler: { _ in }), for: .touchUpInside)
        """
    }
}
