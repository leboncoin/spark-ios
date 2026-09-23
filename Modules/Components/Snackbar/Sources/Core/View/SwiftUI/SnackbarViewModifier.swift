//
//  SnackbarViewModifier.swift
//  SparkComponentSnackbar
//
//  Created by robin.lemaire on 13/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkCommon
import SparkComponentButton

internal struct SnackbarViewModifier<TitleLabel, DescriptionLabel, ActionButton>: ViewModifier where TitleLabel: View, DescriptionLabel: View, ActionButton: View {

    // MARK: - Properties

    private let icon: Image?
    private var titleLabel: () -> TitleLabel
    private var descriptionLabel: () -> DescriptionLabel
    private var button: () -> ActionButton

    @Binding private var isPresented: Bool
    private let autoDismissDelay: SnackbarAutoDismissDelay?
    private let dismissCompletion: (() -> Void)?

    @State private var currentTask: Task<Void, Never>?

    @Environment(\.snackbarDirection) private var direction

    // MARK: - Initialization

    init(
        _ icon: Image?,
        isPresented: Binding<Bool>,
        autoDismissDelay: SnackbarAutoDismissDelay?,
        dismissCompletion: (() -> Void)?,
        titleLabel: @escaping () -> TitleLabel,
        descriptionLabel: @escaping () -> DescriptionLabel,
        button: @escaping () -> ActionButton
    ) {
        self.icon = icon
        self._isPresented = isPresented
        self.autoDismissDelay = autoDismissDelay
        self.dismissCompletion = dismissCompletion
        self.titleLabel = titleLabel
        self.descriptionLabel = descriptionLabel
        self.button = button
    }

    // MARK: - View

    func body(content: Content) -> some View {
        ZStack(alignment: self.direction.stackAlignment) {
            content

            VStack {
                if self.isPresented {
                    Snackbar(
                        self.icon,
                        titleLabel: self.titleLabel,
                        descriptionLabel: self.descriptionLabel,
                        button: self.button
                    )
                    .onAppear {
                        if let autoDismissDelay {
                            self.currentTask = Task(priority: .background, operation: {
                                do {
                                    try await Task.sleep(nanoseconds: UInt64(autoDismissDelay.seconds * powl(10, 9)))
                                    self.isPresented = false
                                } catch {}
                            })
                        }
                    }
                    .onDisappear {
                        self.dismissCompletion?()
                        self.currentTask?.cancel()
                        self.currentTask = nil
                    }
                }
            }
            .optionalAnimation(
                .animate(isPresented: self.isPresented),
                value: self.isPresented
            )
        }
    }
}

// MARK: - Animation Extension

private extension Animation {

    static func animate(isPresented: Bool) -> Animation {
        let duration = SnackbarConstants.presentationDuration

        return isPresented ? .easeOut(duration: duration) : .easeIn(duration: duration)
    }
}
