//
//  AwarenessCardComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 17/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias AwarenessCardComponentView = ComponentViewable<
    AwarenessCardConfiguration,
    AwarenessCardImplementationView,
    AwarenessCardConfigurationView,
    AwarenessCardExtraTools
>

// MARK: - Subview

struct AwarenessCardImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<AwarenessCardConfiguration>
    @State private var showAlertAction = false

    // MARK: - View

    var body: some View {
        self.component()
            .sparkTheme(self.configurationWrapped.theme.value)
            .sparkCardIntent(self.configurationWrapped.intent)
            .demoDisabled(self.configurationWrapped)
            .demoAccessibilityLabel(self.configurationWrapped)
            .demoAccessibilityHidden(self.configurationWrapped)
            .demoBackground(self.configurationWrapped)
            .alert("Action Triggered", isPresented: self.$showAlertAction) {
                Button("OK", role: .cancel) {
                }
            }
    }

    @ViewBuilder
    private func component() -> some View {
        let title = self.configurationWrapped.title.nilIfEmpty
        let description = self.configurationWrapped.description.nilIfEmpty
        let icon = Image(icon: self.configurationWrapped.icon)

        if let title, let description {
            self.componentWithAll(
                title: title,
                description: description,
                icon: icon
            )
        } else if let title {
            self.componentWithTitle(
                title,
                icon: icon
            )
        } else if let description {
            self.componentWithDescription(
                description,
                icon: icon
            )
        } else {
            Text("Please add a title or a description")
        }
    }

    @ViewBuilder
    private func componentWithTitle(_ title: String, icon: Image?) -> some View {
        // With Action
        if let action = self.configurationWrapped.action {
            if self.configurationWrapped.isCustomContent {
                // String
                SparkAwarenessCard(
                    icon: icon,
                    titleLabel: {
                        self.titleLabel(title)
                    },
                    actionLabel: {
                        self.actionLabel(action)
                    }
                )
            } else {
                // Label
                SparkAwarenessCard(
                    icon: icon,
                    title: title,
                    actionLabel: {
                        self.actionLabel(action)
                    }
                )
            }
        } else { // Without Action
            if self.configurationWrapped.isCustomContent {
                // String
                SparkAwarenessCard(
                    icon: icon,
                    titleLabel: {
                        self.titleLabel(title)
                    }
                )
            } else {
                // Label
                SparkAwarenessCard(
                    icon: icon,
                    title: title
                )
            }
        }
    }

    @ViewBuilder
    private func componentWithDescription(_ description: String, icon: Image?) -> some View {
        // With Action
        if let action = self.configurationWrapped.action {
            if self.configurationWrapped.isCustomContent {
                // String
                SparkAwarenessCard(
                    icon: icon,
                    descriptionLabel: {
                        self.descriptionLabel(description)
                    },
                    actionLabel: {
                        self.actionLabel(action)
                    }
                )
            } else {
                // Label
                SparkAwarenessCard(
                    icon: icon,
                    description: description,
                    actionLabel: {
                        self.actionLabel(action)
                    }
                )
            }
        } else { // Without Action
            if self.configurationWrapped.isCustomContent {
                // String
                SparkAwarenessCard(
                    icon: icon,
                    descriptionLabel: {
                        self.descriptionLabel(description)
                    }
                )
            } else {
                // Label
                SparkAwarenessCard(
                    icon: icon,
                    description: description
                )
            }
        }
    }

    @ViewBuilder
    private func componentWithAll(title: String, description: String, icon: Image?) -> some View {
        // With Action
        if let action = self.configurationWrapped.action {
            if self.configurationWrapped.isCustomContent {
                // String
                SparkAwarenessCard(
                    icon: icon,
                    titleLabel: {
                        self.titleLabel(title)
                    },
                    descriptionLabel: {
                        self.descriptionLabel(description)
                    },
                    actionLabel: {
                        self.actionLabel(action)
                    }
                )
            } else {
                // Label
                SparkAwarenessCard(
                    icon: icon,
                    title: title,
                    description: description,
                    actionLabel: {
                        self.actionLabel(action)
                    }
                )
            }
        } else { // Without Action
            if self.configurationWrapped.isCustomContent {
                // String
                SparkAwarenessCard(
                    icon: icon,
                    titleLabel: {
                        self.titleLabel(title)
                    },
                    descriptionLabel: {
                        self.descriptionLabel(description)
                    },
                )
            } else {
                // Label
                SparkAwarenessCard(
                    icon: icon,
                    title: title,
                    description: description
                )
            }
        }
    }

    // MARK: - Custom Views

    @ViewBuilder
    private func titleLabel(_ title: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
            Text(self.configurationWrapped.titleSecondText)
                .bold()
                .foregroundStyle(.green)
        }
    }

    @ViewBuilder
    private func descriptionLabel(_ description: String) -> some View {
        VStack(alignment: .leading) {
            Text(description)
            Text(self.configurationWrapped.descriptionSecondText)
                .bold()
                .foregroundStyle(.green)
        }
    }

    @ViewBuilder
    private func actionLabel(_ action: AwarenessCardActionType) -> some View {
        switch action {
        case .button:
            SparkButton("Take Action") {
                self.showAlertAction = true
            }

        case .textLink:
            SparkTextLink("Learn More") {
                self.showAlertAction = true
            }
        }
    }
}
