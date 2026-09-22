//
//  CardUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct CardUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Simple Content", code: Self.simpleContent),
            .init(title: "With Action", code: Self.withAction),
            .init(title: "Highlighted Style", code: Self.highlightedStyle),
            .init(title: "No Padding", code: Self.noPadding),
            .init(title: "Different Variants", code: Self.differentVariants),
            .init(title: "TableView/CollectionView", code: Self.tableViewUsage),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var simpleContent: String {
        """
        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.spacing = 16

        let titleLabel = UILabel()
        titleLabel.text = "Welcome on Card"
        titleLabel.font = theme.typography.headline2.uiFont
        titleLabel.numberOfLines = 0

        let descriptionLabel = UILabel()
        descriptionLabel.text = "This is the description of the card."
        descriptionLabel.font = theme.typography.body1.uiFont
        descriptionLabel.numberOfLines = 0

        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)

        let card = SparkUICard(
            theme: theme,
            contentView: contentStackView
        )
        card.intent = .main
        card.variant = .filled
        """
    }

    // swiftlint:disable no_debugging_method
    private static var withAction: String {
        """
        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.spacing = 12

        let titleLabel = UILabel()
        titleLabel.text = "Welcome on Card"
        titleLabel.font = theme.typography.headline2.uiFont
        titleLabel.numberOfLines = 0

        let descriptionLabel = UILabel()
        descriptionLabel.text = "Nam eu sapien finibus, auctor purusan varius, sagittis turpis."
        descriptionLabel.font = theme.typography.body1.uiFont
        descriptionLabel.numberOfLines = 0

        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)

        let card = SparkUICard(
            theme: theme,
            contentView: contentStackView
        )
        card.intent = .support
        card.variant = .filled
        card.addAction(.init(handler: { _ in
            // Your action
        }), for: .touchUpInside)
        """
    }

    private static var highlightedStyle: String {
        """
        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.spacing = 12

        let titleLabel = UILabel()
        titleLabel.text = "Highlighted Card"
        titleLabel.font = theme.typography.headline2.uiFont
        titleLabel.numberOfLines = 0

        let descriptionLabel = UILabel()
        descriptionLabel.text = "This card has a highlighted style with different corner radius."
        descriptionLabel.font = theme.typography.body1.uiFont
        descriptionLabel.numberOfLines = 0

        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)

        let card = SparkUICard(
            theme: theme,
            contentView: contentStackView
        )
        card.intent = .success
        card.variant = .outlined
        card.isHighlightedStyle = true
        """
    }

    private static var noPadding: String {
        """
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true

        let card = SparkUICard(
            theme: theme,
            contentView: imageView
        )
        card.intent = .main
        card.variant = .filled
        card.isPadding = false
        """
    }

    private static var differentVariants: String {
        """
        // Filled variant
        let filledCard = SparkUICard(
            theme: theme,
            contentView: createContentView(text: "Filled variant")
        )
        filledCard.intent = .main
        filledCard.variant = .filled

        // Outlined variant
        let outlinedCard = SparkUICard(
            theme: theme,
            contentView: createContentView(text: "Outlined variant")
        )
        outlinedCard.intent = .support
        outlinedCard.variant = .outlined

        // Tinted variant
        let tintedCard = SparkUICard(
            theme: theme,
            contentView: createContentView(text: "Tinted variant")
        )
        tintedCard.intent = .success
        tintedCard.variant = .tinted
        """
    }

    private static var tableViewUsage: String {
        """
        // Inside UITableViewCell or UICollectionViewCell
        let card = SparkUICard(
            theme: theme,
            contentView: contentStackView
        )
        card.intent = .main
        card.variant = .filled
        card.isUserInteractionEnabled = false

        // In delegate methods:
        func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
            if let cell = collectionView.cellForItem(at: indexPath) as? MyCell {
                cell.card.isHighlighted = true
            }
        }

        func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
            if let cell = collectionView.cellForItem(at: indexPath) as? MyCell {
                cell.card.isHighlighted = false
            }
        }
        """
    }

    private static var fullConfiguration: String {
        """
        // Create tag
        let tag = SparkUITag(
            theme: theme,
            intent: .main,
            variant: .filled,
            text: "Featured"
        )

        // Create title with icon
        let titleStackView = UIStackView()
        titleStackView.axis = .horizontal
        titleStackView.spacing = 8

        let icon = SparkUIIcon(
            theme: theme,
            intent: .main,
            size: .medium,
            iconImage: .spark
        )

        let titleLabel = UILabel()
        titleLabel.text = "Complete Card Example"
        titleLabel.font = theme.typography.headline2.uiFont
        titleLabel.numberOfLines = 0

        titleStackView.addArrangedSubview(icon)
        titleStackView.addArrangedSubview(titleLabel)

        // Create description
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Nam eu sapien finibus, auctor purusan varius, sagittis turpis. Sed ipsum elit, lacinia id porta ut, bibendum at risus."
        descriptionLabel.font = theme.typography.body1.uiFont
        descriptionLabel.numberOfLines = 0

        // Create text stack view
        let textStackView = UIStackView(arrangedSubviews: [
            titleStackView,
            descriptionLabel
        ])
        textStackView.axis = .vertical
        textStackView.spacing = 8

        // Create button
        let button = SparkUIButton(theme: theme)
        button.setTitle("Take Action", for: .normal)
        button.intent = .main
        button.variant = .filled
        button.size = .medium
        button.addAction(UIAction { _ in
            // Your action
        }, for: .touchUpInside)

        // Create content stack view
        let contentStackView = UIStackView(arrangedSubviews: [
            tag,
            textStackView,
            button
        ])
        contentStackView.axis = .vertical
        contentStackView.spacing = 16

        // Create card
        let card = SparkUICard(
            theme: theme,
            contentView: contentStackView
        )
        card.intent = .main
        card.variant = .tinted
        card.isHighlightedStyle = true
        card.isPadding = true
        card.isEnabled = true
        card.accessibilityLabel = "Complete card example"
        card.addAction(.init(handler: { _ in
            // Your action
        }), for: .touchUpInside)
        """
    }
}
