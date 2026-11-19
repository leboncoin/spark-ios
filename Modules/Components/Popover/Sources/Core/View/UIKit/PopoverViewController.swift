//
//  PopoverViewController.swift
//  SparkComponentPopover
//
//  Created by louis.borlee on 25/06/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkCommon
import SparkTheming
import UIKit

/// ViewController used as a container for the content of a Popover
/// It handles the background configuration such as color, inner spacings and the drawing of the arrow if needed
/// The content viewController is defined by the consumer, it should have a .clear background, no padding and have a well defined preferredContentSize for the popover to calculate its size properly
public final class PopoverViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    private let contentViewController: UIViewController
    private let token: PopoverToken

    @ScaledUIMetric private var scaleFactor: CGFloat = 1.0

    init(token: PopoverToken, contentViewController: UIViewController) {
        self.token = token
        self.contentViewController = contentViewController
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .popover
        self.popoverPresentationController?.delegate = self
    }

    /// PopoverViewController initializer
    /// - Parameters:
    ///   - contentViewController: The viewController that will be embedded in the popover:
    ///   it should have a .clear background, no padding and have a well defined preferredContentSize for the popover to calculate its size properly
    ///   - theme: The theme of a Popover
    ///   - intent: The intent of the Popover
    ///   - showArrow: Not used anymore: the arrow is managed by the system
    public convenience init(contentViewController: UIViewController, theme: any Theme, intent: PopoverIntent, showArrow: Bool = true) {
        self.init(
            token: theme.component.popover,
            contentViewController: contentViewController
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        self.removeFromChild()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .clear

        self.contentViewController.willMove(toParent: self)
        let view: UIView = self.contentViewController.view
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)

        let leadingConstraint = view.leadingAnchor.constraint(
            equalTo: self.view.leadingAnchor,
            constant: self.token.layout.horizontalPadding
        )
        leadingConstraint.priority = .required - 1

        let topConstraint = view.topAnchor.constraint(
            equalTo: self.view.topAnchor,
            constant: self.token.layout.verticalPadding + PopoverConstants.liquidGlassTopPadding
        )
        topConstraint.priority = .required - 1

        let bottomConstraint = view.bottomAnchor.constraint(
            equalTo: self.view.bottomAnchor,
            constant: -self.token.layout.verticalPadding
        )
        bottomConstraint.priority = .required - 1

        NSLayoutConstraint.activate([
            leadingConstraint,
            topConstraint,
            bottomConstraint,
            view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])

        self.addChild(self.contentViewController)
        self.contentViewController.didMove(toParent: self)

    }

    private func removeFromChild() {
        self.contentViewController.willMove(toParent: nil)
        self.contentViewController.view?.removeFromSuperview()
        self.contentViewController.removeFromParent()
        self.contentViewController.didMove(toParent: nil)
    }

    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }

    public override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
        self.preferredContentSize = self.view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}

