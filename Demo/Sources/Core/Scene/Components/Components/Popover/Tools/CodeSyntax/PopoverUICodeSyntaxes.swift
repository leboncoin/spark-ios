//
//  PopoverUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct PopoverUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Basic", code: Self.basic),
            .init(title: "With Intent", code: Self.withIntent),
            .init(title: "With Arrow Control", code: Self.withArrowControl),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var basic: String {
        """
        let button = UIButton(configuration: .filled())
        button.setTitle("Show popover", for: .normal)
        button.addAction(UIAction(handler: { _ in
            let contentViewController = MyContentViewController()
            let popoverViewController = PopoverViewController(
                contentViewController: contentViewController,
                theme: theme,
                intent: .main
            )

            popoverViewController.popoverPresentationController?.sourceView = button
            self.present(popoverViewController, animated: true)
        }), for: .touchUpInside)
        """
    }

    private static var withIntent: String {
        """
        let button = UIButton(configuration: .filled())
        button.setTitle("Show popover", for: .normal)
        button.addAction(UIAction(handler: { _ in
            let label = UILabel()
            label.text = "Success message"
            label.translatesAutoresizingMaskIntoConstraints = false

            let contentViewController = UIViewController()
            contentViewController.view.backgroundColor = .clear
            contentViewController.view.addSubview(label)
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: contentViewController.view.topAnchor),
                label.leadingAnchor.constraint(equalTo: contentViewController.view.leadingAnchor),
                label.trailingAnchor.constraint(equalTo: contentViewController.view.trailingAnchor),
                label.bottomAnchor.constraint(equalTo: contentViewController.view.bottomAnchor)
            ])

            let popoverViewController = PopoverViewController(
                contentViewController: contentViewController,
                theme: theme,
                intent: .success
            )

            popoverViewController.popoverPresentationController?.sourceView = button
            self.present(popoverViewController, animated: true)
        }), for: .touchUpInside)
        """
    }

    private static var withArrowControl: String {
        """
        let button = UIButton(configuration: .filled())
        button.setTitle("Show popover", for: .normal)
        button.addAction(UIAction(handler: { _ in
            let contentViewController = MyContentViewController()
            let popoverViewController = PopoverViewController(
                contentViewController: contentViewController,
                theme: theme,
                intent: .main,
                showArrow: false
            )

            popoverViewController.popoverPresentationController?.sourceView = button
            self.present(popoverViewController, animated: true)
        }), for: .touchUpInside)
        """
    }

    private static var fullConfiguration: String {
        """
        let button = UIButton(configuration: .filled())
        button.setTitle("Show popover", for: .normal)
        button.addAction(UIAction(handler: { _ in
            // Create content view controller with label
            let contentViewController = UIViewController()
            contentViewController.view.backgroundColor = .clear

            let label = UILabel()
            label.text = "This is a comprehensive example showing all major features of the Popover component. You can customize the intent and show/hide the arrow."
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false

            contentViewController.view.addSubview(label)
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: contentViewController.view.topAnchor),
                label.leadingAnchor.constraint(equalTo: contentViewController.view.leadingAnchor),
                label.trailingAnchor.constraint(equalTo: contentViewController.view.trailingAnchor),
                label.bottomAnchor.constraint(equalTo: contentViewController.view.bottomAnchor),
                label.widthAnchor.constraint(lessThanOrEqualToConstant: 300)
            ])

            // Set preferred content size
            contentViewController.preferredContentSize = CGSize(width: 300, height: 150)

            // Create popover with custom intent and showArrow
            let popoverViewController = PopoverViewController(
                contentViewController: contentViewController,
                theme: theme,
                intent: .success,
                showArrow: true
            )

            // Set label color based on intent colors
            let colors = popoverViewController.intent.getColors(theme: theme)
            label.textColor = colors.foreground.uiColor

            popoverViewController.popoverPresentationController?.sourceView = button
            self.present(popoverViewController, animated: true)
        }), for: .touchUpInside)
        """
    }
}
