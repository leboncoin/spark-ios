//
//  SnackbarComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias SnackbarComponentView = ComponentViewable<SnackbarConfiguration, SnackbarImplementationView, SnackbarConfigurationView, SnackbarExtraTools>

extension SnackbarComponentView {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - Subview

struct SnackbarImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<SnackbarConfiguration>

    @State private var isPresented: Bool = false
    @State private var isCompleted: Bool = false

    // MARK: - View

    var body: some View {
        VStack {
            Text("Replace me with your UI content")

            Button(action: {
                self.isPresented.toggle()
            }, label: {
                Text("Show snackbar")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .component(
            configuration: self.configuration.wrappedValue,
            isPresented: self.$isPresented,
            dismissCompletion: {
                if self.configurationWrapped.swiftUIIsCompleted {
                    self.isCompleted = true
                }
            }
        )
        .alert("Is completed", isPresented: self.$isCompleted) {
            Button("OK", role: .cancel) {
            }
        }
        .sparkTheme(self.configurationWrapped.theme.value)
        .sparkSnackbarIntent(self.configurationWrapped.intent)
        .sparkSnackbarAlignment(self.configurationWrapped.alignment)
        .sparkSnackbarDirection(self.configurationWrapped.direction)
    }
}

// MARK: - View Extension

private extension View {

    // MARK: - View

    @ViewBuilder
    func component(
        configuration: SnackbarConfiguration,
        isPresented: Binding<Bool>,
        dismissCompletion: @escaping (() -> Void)
    ) -> some View {
        let icon = Image(icon: configuration.icon)
        let title = configuration.title.nilIfEmpty
        let description = configuration.message.nilIfEmpty ?? "Description"
        let hasButton = configuration.hasButton

        let isCustomContent = configuration.swiftUIIsCustomContent

        // Custom content
        if isCustomContent {

            // With button
            if hasButton {

                // With title
                if let title {
                    self.makeSnackbarWithLabelsAndAction(
                        icon: icon,
                        title: title,
                        description: description,
                        configuration: configuration,
                        isPresented: isPresented,
                        dismissCompletion: dismissCompletion
                    )

                } else {
                    self.makeSnackbarWithDescriptionLabelAndAction(
                        icon: icon,
                        description: description,
                        configuration: configuration,
                        isPresented: isPresented,
                        dismissCompletion: dismissCompletion
                    )
                }

            } else { // Without button

                // With title
                if let title {
                    self.makeSnackbarWithLabels(
                        icon: icon,
                        title: title,
                        description: description,
                        configuration: configuration,
                        isPresented: isPresented,
                        dismissCompletion: dismissCompletion
                    )

                } else {
                    self.makeSnackbarWithDescriptionLabel(
                        icon: icon,
                        description: description,
                        configuration: configuration,
                        isPresented: isPresented,
                        dismissCompletion: dismissCompletion
                    )
                }

            }
        } else { // Strings

            // With button
            if hasButton {

                // With title
                if let title {
                    self.makeSnackbarWithStringsAndAction(
                        icon: icon,
                        title: title,
                        description: description,
                        configuration: configuration,
                        isPresented: isPresented,
                        dismissCompletion: dismissCompletion
                    )

                } else {
                    self.makeSnackbarWithDescriptionStringAndAction(
                        icon: icon,
                        description: description,
                        configuration: configuration,
                        isPresented: isPresented,
                        dismissCompletion: dismissCompletion
                    )
                }

            } else { // Without button

                // With title
                if let title {
                    self.makeSnackbarWithStrings(
                        icon: icon,
                        title: title,
                        description: description,
                        configuration: configuration,
                        isPresented: isPresented,
                        dismissCompletion: dismissCompletion
                    )

                } else {
                    self.makeSnackbarWithDescriptionString(
                        icon: icon,
                        description: description,
                        configuration: configuration,
                        isPresented: isPresented,
                        dismissCompletion: dismissCompletion
                    )
                }
            }
        }
    }

    // MARK: - With Strings

    @ViewBuilder
    private func makeSnackbarWithStrings(
        icon: Image?,
        title: String,
        description: String,
        configuration: SnackbarConfiguration,
        isPresented: Binding<Bool>,
        dismissCompletion: @escaping (() -> Void)
    ) -> some View {
        self.sparkSnackbar(
            icon,
            title: title,
            description: description,
            isPresented: isPresented,
            autoDismissDelay: configuration.autoDismissDelay,
            dismissCompletion: dismissCompletion
        )
    }

    @ViewBuilder
    private func makeSnackbarWithStringsAndAction(
        icon: Image?,
        title: String,
        description: String,
        configuration: SnackbarConfiguration,
        isPresented: Binding<Bool>,
        dismissCompletion: @escaping (() -> Void)
    ) -> some View {
        self.sparkSnackbar(
            icon,
            title: title,
            description: description,
            isPresented: isPresented,
            autoDismissDelay: configuration.autoDismissDelay,
            dismissCompletion: dismissCompletion,
            button: {
                Self.makeButton(
                    configuration: configuration,
                    isPresented: isPresented
                )
            }
        )
    }

    @ViewBuilder
    private func makeSnackbarWithDescriptionString(
        icon: Image?,
        description: String,
        configuration: SnackbarConfiguration,
        isPresented: Binding<Bool>,
        dismissCompletion: @escaping (() -> Void)
    ) -> some View {
        self.sparkSnackbar(
            icon,
            description: description,
            isPresented: isPresented,
            autoDismissDelay: configuration.autoDismissDelay,
            dismissCompletion: dismissCompletion
        )
    }

    @ViewBuilder
    private func makeSnackbarWithDescriptionStringAndAction(
        icon: Image?,
        description: String,
        configuration: SnackbarConfiguration,
        isPresented: Binding<Bool>,
        dismissCompletion: @escaping (() -> Void)
    ) -> some View {
        self.sparkSnackbar(
            icon,
            description: description,
            isPresented: isPresented,
            autoDismissDelay: configuration.autoDismissDelay,
            dismissCompletion: dismissCompletion,
            button: {
                Self.makeButton(
                    configuration: configuration,
                    isPresented: isPresented
                )
            }
        )
    }

    // MARK: - With Labels

    @ViewBuilder
    private func makeSnackbarWithLabels(
        icon: Image?,
        title: String,
        description: String,
        configuration: SnackbarConfiguration,
        isPresented: Binding<Bool>,
        dismissCompletion: @escaping (() -> Void)
    ) -> some View {
        self.sparkSnackbar(
            icon,
            isPresented: isPresented,
            autoDismissDelay: configuration.autoDismissDelay,
            dismissCompletion: dismissCompletion,
            titleLabel: {
                Self.makeCustomTitle(
                    title,
                    configuration: configuration
                )
            },
            descriptionLabel: {
                Self.makeCustomDescription(
                    description,
                    configuration: configuration
                )
            }
        )
    }

    @ViewBuilder
    private func makeSnackbarWithLabelsAndAction(
        icon: Image?,
        title: String,
        description: String,
        configuration: SnackbarConfiguration,
        isPresented: Binding<Bool>,
        dismissCompletion: @escaping (() -> Void)
    ) -> some View {
        self.sparkSnackbar(
            icon,
            isPresented: isPresented,
            autoDismissDelay: configuration.autoDismissDelay,
            dismissCompletion: dismissCompletion,
            titleLabel: {
                Self.makeCustomTitle(
                    title,
                    configuration: configuration
                )
            },
            descriptionLabel: {
                Self.makeCustomDescription(
                    description,
                    configuration: configuration
                )
            },
            button: {
                Self.makeButton(
                    configuration: configuration,
                    isPresented: isPresented
                )
            }
        )
    }

    @ViewBuilder
    private func makeSnackbarWithDescriptionLabel(
        icon: Image?,
        description: String,
        configuration: SnackbarConfiguration,
        isPresented: Binding<Bool>,
        dismissCompletion: @escaping (() -> Void)
    ) -> some View {
        self.sparkSnackbar(
            icon,
            isPresented: isPresented,
            autoDismissDelay: configuration.autoDismissDelay,
            dismissCompletion: dismissCompletion,
            descriptionLabel: {
                Self.makeCustomDescription(
                    description,
                    configuration: configuration
                )
            }
        )
    }

    @ViewBuilder
    private func makeSnackbarWithDescriptionLabelAndAction(
        icon: Image?,
        description: String,
        configuration: SnackbarConfiguration,
        isPresented: Binding<Bool>,
        dismissCompletion: @escaping (() -> Void)
    ) -> some View {
        self.sparkSnackbar(
            icon,
            isPresented: isPresented,
            autoDismissDelay: configuration.autoDismissDelay,
            dismissCompletion: dismissCompletion,
            descriptionLabel: {
                Self.makeCustomDescription(
                    description,
                    configuration: configuration
                )
            },
            button: {
                Self.makeButton(
                    configuration: configuration,
                    isPresented: isPresented
                )
            }
        )
    }

    // MARK: - Static View

    private static func makeButton(
        configuration: SnackbarConfiguration,
        isPresented: Binding<Bool>
    ) -> some View {
        SparkButton(
            configuration.buttonTitle,
            action: {
                isPresented.wrappedValue = false
            }
        )
    }

    private static func makeCustomTitle(
        _ title: String?,
        configuration: SnackbarConfiguration
    ) -> some View {
        HStack {
            if let title {
                Text(title)
            }
            Text(configuration.swiftUISecondTitleText)
                .font(.footnote)
                .foregroundStyle(.blue)
        }
    }

    private static func makeCustomDescription(
        _ message: String?,
        configuration: SnackbarConfiguration
    ) -> some View {
        HStack {
            if let message {
                Text(message)
            }
            Text(configuration.swiftUISecondMessageText)
                .font(.caption)
                .foregroundStyle(.green)
        }
    }
}
