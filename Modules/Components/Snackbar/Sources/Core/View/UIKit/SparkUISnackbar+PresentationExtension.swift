//
//  SparkUISnackbar+PresentationExtension.swift
//  SparkComponentSnackbar
//
//  Created by robin.lemaire on 13/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
@_spi(SI_SPI) import SparkCommon

extension SparkUISnackbar {

    // MARK: - Public Properties

    /// This method displays the Snackbar in a specified view.
    /// - Parameters:
    ///   - view: The UIView in which to display the Snackbar.
    ///   - direction: The direction from which the Snackbar appears (top or bottom). Check the ``SnackbarDirection`` to see the **default** value.
    ///   - animated: Boolean to determine if the presentation should be animated. Default is ``true``.
    ///   - insets: UIEdgeInsets to apply additional spacing around the Snackbar. Default is ``.zero``.
    ///   - useSafeAreaLayoutGuide: Boolean to determine if the Snackbar should respect the safe area. Default is ``false``.
    public func show(
        in view: UIView,
        from direction: SnackbarDirection = .default,
        animated: Bool = true,
        insets: UIEdgeInsets = .zero,
        useSafeAreaLayoutGuide: Bool = false
    ) {
        self.autoDismissWorkItem?.cancel()
        self.removeFromSuperview()
        view.addSubview(self)

        self.setupConstraints(
            in: view,
            from: direction,
            insets: insets,
            useSafeAreaLayoutGuide: useSafeAreaLayoutGuide
        )

        self.setNeedsLayout()
        self.layoutIfNeeded()

        self.startPresentation(direction: direction)
    }

    /// This method displays the Snackbar and automatically dismisses it after a specified delay.
    /// - Parameters:
    ///   - view: The UIView in which to display the Snackbar.
    ///   - direction: The direction from which the Snackbar appears (top or bottom). Check the ``SnackbarDirection`` to see the **default** value.
    ///   - animated: Boolean to determine if the presentation should be animated. Default is ``true``.
    ///   - insets: UIEdgeInsets to apply additional spacing around the Snackbar. Default is ``.zero``.
    ///   - useSafeAreaLayoutGuide: Boolean to determine if the Snackbar should respect the safe area. Default is ``false``.
    ///   - autoDismissDelay: A SnackbarAutoDismissDelay value determining how long the Snackbar should be displayed before auto-dismissing. Default is ``.fast``.
    ///   - dismissCompletion: An optional closure to be called when the Snackbar is dismissed.
    public func showAndDismiss(
        in view: UIView,
        from direction: SnackbarDirection = .default,
        animated: Bool = true,
        insets: UIEdgeInsets = .zero,
        useSafeAreaLayoutGuide: Bool = false,
        autoDismissDelay: SnackbarAutoDismissDelay = .fast,
        dismissCompletion: ((Bool) -> Void)? = nil
    ) {
        self.show(
            in: view,
            from: direction,
            animated: animated,
            insets: insets,
            useSafeAreaLayoutGuide: useSafeAreaLayoutGuide
        )

        self.dismissCompletion = dismissCompletion

        self.queueDismiss(
            delay: autoDismissDelay.seconds,
            completion: dismissCompletion
        )
    }

    /// This method dismisses the Snackbar.
    /// - Parameter completion: An optional closure to be called when the dismissal animation is complete.
    public func dismiss(completion: ((Bool) -> Void)? = nil) {
        self.autoDismissWorkItem?.cancel()
        UIView.optionalAnimate(
            withDuration: SnackbarConstants.presentationDuration,
            delay: .zero,
            options: [.curveEaseIn],
            animations: {
                self.transform = self.presentationTransformation
                self.alpha = 0
            },
            completion: { [weak self] isFinished in
                guard let self else { return }

                self.removeFromSuperview()
                self.dismissCompletion?(isFinished)
                completion?(isFinished)
            }
        )
    }

    /// This method cancels any scheduled auto-dismissal of the Snackbar.
    public func cancelAutoDismiss() {
        self.autoDismissWorkItem?.cancel()
    }

    // MARK: - Private Properties

    private func setupConstraints(
        in view: UIView,
        from direction: SnackbarDirection,
        insets: UIEdgeInsets,
        useSafeAreaLayoutGuide: Bool
    ) {
        let spacing = self.theme.layout.spacing.large

        self.translatesAutoresizingMaskIntoConstraints = false

        let leadingConstraint = self.leadingAnchor.constraint(
            equalTo: useSafeAreaLayoutGuide ? view.safeAreaLayoutGuide.leadingAnchor : view.leadingAnchor,
            constant: spacing + insets.left
        )
        leadingConstraint.priority = .required - 1
        let trailingConstraint = self.trailingAnchor.constraint(
            equalTo: useSafeAreaLayoutGuide ? view.safeAreaLayoutGuide.trailingAnchor : view.trailingAnchor,
            constant: -spacing + insets.right
        )
        trailingConstraint.priority = .required - 1

        let centerXConstraint = self.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        centerXConstraint.priority = .defaultHigh

        let topConstraint: NSLayoutConstraint
        let bottomConstraint: NSLayoutConstraint
        switch direction {
        case .top:
            topConstraint = self.topAnchor.constraint(
                equalTo: useSafeAreaLayoutGuide ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor,
                constant: spacing + insets.top
            )
            bottomConstraint = self.bottomAnchor.constraint(
                lessThanOrEqualTo: useSafeAreaLayoutGuide ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor,
                constant: -spacing + insets.bottom
            )
            self.presentationVerticalConstraint = topConstraint
        case .bottom:
            topConstraint = self.topAnchor.constraint(
                greaterThanOrEqualTo: useSafeAreaLayoutGuide ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor,
                constant: spacing + insets.top
            )
            bottomConstraint = self.bottomAnchor.constraint(
                equalTo: useSafeAreaLayoutGuide ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor,
                constant: -spacing + insets.bottom
            )
            self.presentationVerticalConstraint = bottomConstraint
        }

        self.presentationVerticalConstraint = bottomConstraint

        NSLayoutConstraint.activate([
            leadingConstraint,
            trailingConstraint,
            topConstraint,
            bottomConstraint,
            centerXConstraint
        ])
    }

    private func startPresentation(direction: SnackbarDirection) {
        let yTranslation = switch direction {
        case .top: -self.presentationVerticalConstraint.constant - self.frame.height
        case .bottom: -self.presentationVerticalConstraint.constant + self.frame.height
        }

        self.alpha = 0
        self.presentationTransformation = .init(translationX: 0, y: yTranslation)
        self.transform = self.presentationTransformation

        UIView.optionalAnimate(
            withDuration: SnackbarConstants.presentationDuration,
            delay: .zero,
            options: [.curveEaseOut],
            animations: {
                self.alpha = 1
                self.transform = .identity
            },
            completion: nil
        )
    }

    private func queueDismiss(
        delay: Double,
        completion: ((Bool) -> Void)?
    ) {
        self.autoDismissWorkItem?.cancel()
        let workItem = DispatchWorkItem { [weak self] in
            self?.dismiss()
        }
        self.autoDismissWorkItem = workItem
        let duration = UIAccessibility.isReduceMotionEnabled ? .zero : SnackbarConstants.presentationDuration
        let deadline: DispatchTime = .now() + duration + delay
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: workItem)
    }
}
