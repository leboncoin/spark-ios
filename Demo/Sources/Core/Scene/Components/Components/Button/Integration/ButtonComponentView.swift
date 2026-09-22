//
//  ButtonComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias ButtonComponentView = ComponentViewable<ButtonConfiguration, ButtonImplementationView, ButtonConfigurationView, ButtonExtraTools>

// MARK: - Subview

struct ButtonImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<ButtonConfiguration>
    @State private var showAlertAction = false

    // MARK: - View

    var body: some View {
        self.component {
            self.showAlertAction = true
        }
        .sparkTheme(self.configurationWrapped.theme.value)
        .styled(configuration: self.configurationWrapped)
        .sparkButtonShape(self.configurationWrapped.shape)
        .sparkButtonSize(self.configurationWrapped.size)
        .sparkButtonAlignment(self.configurationWrapped.alignment)
        .sparkButtonContentVisibility(self.configurationWrapped.contentVisibility)
        .sparkButtonHasFeedback(self.configurationWrapped.hasFeedback)
        .sparkButtonIsLoading(self.configurationWrapped.isLoading)
        .sparkButtonMaxWidth(self.configurationWrapped.swiftUIIsFullWidth ? .infinity : nil)
        .sparkButtonRemoveStyles(self.configurationWrapped.removeStyles)
        .demoDisabled(self.configurationWrapped)
        .disabled(!self.configurationWrapped.isEnabled.value)
        .frame(height: self.configurationWrapped.removeStyles ? 100 : nil)
        .demoAccessibilityLabel(self.configurationWrapped)
        .alert("Button tap", isPresented: self.$showAlertAction) {
            Button("OK", role: .cancel) { }
        }
    }

    @ViewBuilder
    private func component(action: @escaping @MainActor () -> Void) -> some View {
        let title = self.configurationWrapped.swiftUITitle.nilIfEmpty
        let icon = self.configurationWrapped.swiftUIIcon
        let isMenu = self.configurationWrapped.swiftUIIsMenu

        // Title + Icon
        if let title, let icon {
            self.makeFullButton(
                title: title,
                icon: icon,
                isMenu: isMenu,
                action: action
            )

        } else if let title { // Title only
            self.makeTitleButton(
                title: title,
                isMenu: isMenu,
                action: action
            )

        } else if let icon { // Icon only
            self.makeIconButton(
                icon: icon,
                isMenu: isMenu,
                action: action
            )
        }
    }

    @ViewBuilder
    private func makeFullButton(
        title: String,
        icon: Iconography,
        isMenu: Bool,
        action: @escaping @MainActor () -> Void
    ) -> some View {
        let isCustomContent = self.configurationWrapped.swiftUIIsCustomContent

        let image = Image(icon: icon)
        let animateIcon = self.configurationWrapped.animateIcon

        // Menu
        if isMenu {
            switch (isCustomContent, animateIcon) {
                // Menu and custom title & animated icon
            case (true, true):
                SparkButton {
                    self.makeMenu()
                } label: {
                    self.makeCustomTitle(title)
                } image: {
                    self.makeAnimatedImage(image)
                }

                // Menu and custom title
            case (true, false):
                SparkButton(image) {
                    self.makeMenu()
                } label: {
                    self.makeCustomTitle(title)
                }

                // Menu and animated icon
            case (false, true):
                SparkButton {
                    self.makeMenu()
                } label: {
                    self.makeCustomTitle(title)
                } image: {
                    self.makeAnimatedImage(image)
                }

                // Menu
            case (false, false):
                SparkButton(title, image: image) {
                    self.makeMenu()
                }
            }

        } else { // No menu

            switch (isCustomContent, animateIcon) {
                // Custom title & animated icon
            case (true, true):
                SparkButton(action: action) {
                    self.makeCustomTitle(title)
                } image: {
                    self.makeAnimatedImage(image)
                }

                // Custom title only
            case (true, false):
                SparkButton(image, action: action) {
                    self.makeCustomTitle(title)
                }

                // Animated icon only
            case (false, true):
                SparkButton(title, action: action) {
                    self.makeAnimatedImage(image)
                }

                // Default
            case (false, false):
                SparkButton(title, image: image, action: action)
            }
        }
    }

    @ViewBuilder
    private func makeTitleButton(
        title: String,
        isMenu: Bool,
        action: @escaping @MainActor () -> Void
    ) -> some View {
        let isCustomContent = self.configurationWrapped.swiftUIIsCustomContent

        switch (isMenu, isCustomContent) {
            // Menu and custom title
        case (true, true):
            SparkButton {
                self.makeMenu()
            } label: {
                self.makeCustomTitle(title)
            }

            // Menu
        case (true, false):
            SparkButton(title) {
                self.makeMenu()
            }

            // custom title
        case (false, true):
            SparkButton(action: action, label: {
                self.makeCustomTitle(title)
            })

            // Default
        case (false, false):
            SparkButton(title, action: action)
        }
    }

    @ViewBuilder
    private func makeIconButton(
        icon: Iconography,
        isMenu: Bool,
        action: @escaping @MainActor () -> Void
    ) -> some View {
        let image = Image(icon: icon)

        let animateIcon = self.configurationWrapped.animateIcon

        switch (isMenu, animateIcon) {
            // Menu and icon animation
        case (true, true):
            SparkButton {
                //
            } image: {
                self.makeAnimatedImage(image)
            }

            // Menu
        case (true, false):
            SparkButton(image, content: {
                self.makeMenu()
            })

            // icon animation
        case (false, true):
            SparkButton(action: action, image: {
                self.makeAnimatedImage(image)
            })

            // Default
        case (false, false):
            SparkButton(image, action: action)
        }
    }

    private func makeCustomTitle(_ title: String) -> some View {
        HStack {
            Text(title)
                .foregroundStyle(.orange)
            Text(self.configurationWrapped.swiftUISecondText)
                .font(.footnote)
                .foregroundStyle(.blue)
        }
    }

    private func makeAnimatedImage(_ image: Image) -> some View {
        SparkButtonImage(image: image)
            .animate(type: .bell, repeat: .unlimited)
    }

    @ViewBuilder
    private func makeMenu() -> some View {
        Button("Edit") { }
        Button("Delete") { }
        Button("Share") { }
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func styled(configuration: ButtonConfiguration) -> some View {
        if let appearance = configuration.appearance {
            self.sparkButtonAppearance(appearance)
        } else {
            self.sparkButtonIntent(configuration.intent)
            .sparkButtonVariant(configuration.variant)
        }
    }
}
