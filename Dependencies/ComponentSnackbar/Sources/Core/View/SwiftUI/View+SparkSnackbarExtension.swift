//
//  View+SparkSnackbarExtension.swift
//  SparkComponentSnackbar
//
//  Created by robin.lemaire on 13/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

public extension View {

    /// Display a **Spark snackbar** with a text title, description, and an action button.
    ///
    /// Spark Snackbars provide brief notifications at the bottom of the screen.
    ///
    /// Snackbars inform users of a process that an app has performed or will perform.
    /// They appear temporarily, towards the bottom of the screen. They shouldn't interrupt
    /// the user experience, and they don't require user input to disappear.
    ///
    /// - Parameters:
    ///   - icon: An optional icon to display. Optional. Default is *nil*.
    ///   - title: The title text to display on the snackbar.
    ///   - description: The description text to display below the title.
    ///   - isPresented: A binding to control the visibility of the snackbar.
    ///   - autoDismissDelay: The delay before the snackbar automatically dismisses. Optional. Default is *nil*.
    ///   - dismissCompletion: A closure to execute when the snackbar dismisses. Optional. Default is *nil*.
    ///   - button: A view builder that creates the action button.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// VStack {
    ///     Text("My content")
    ///     Spacer()
    /// }
    /// .sparkSnackbar(
    ///     Image(systemName: "envelope.fill"),
    ///     title: "Email sent",
    ///     description: "Your message was sent successfully",
    ///     isPresented: self.$showSnackbar,
    ///     autoDismissDelay: .default,
    ///     button: {
    ///         SparkButton("View") {
    ///             // View action
    ///         }
    ///         .sparkButtonVariant(.ghost)
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// .sparkSnackbarIntent(.success)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Snackbar rendering.](snackbar_full.png)
    ///
    func sparkSnackbar<ActionButton>(
        _ icon: Image? = nil,
        title: String,
        description: String,
        isPresented: Binding<Bool>,
        autoDismissDelay: SnackbarAutoDismissDelay? = nil,
        dismissCompletion: (() -> Void)? = nil,
        @ViewBuilder button: @escaping () -> ActionButton
    ) -> some View where ActionButton: View {
        self.modifier(
            SnackbarViewModifier(
                icon,
                isPresented: isPresented,
                autoDismissDelay: autoDismissDelay,
                dismissCompletion: dismissCompletion,
                titleLabel: {
                    Text(title)
                },
                descriptionLabel: {
                    Text(description)
                },
                button: button
            )
        )
    }

    /// Display a **Spark snackbar** with a text title and description.
    ///
    /// Spark Snackbars provide brief notifications at the bottom of the screen.
    ///
    /// Snackbars inform users of a process that an app has performed or will perform.
    /// They appear temporarily, towards the bottom of the screen. They shouldn't interrupt
    /// the user experience, and they don't require user input to disappear.
    ///
    /// - Parameters:
    ///   - icon: An optional icon to display. Optional. Default is *nil*.
    ///   - title: The title text to display on the snackbar.
    ///   - description: The description text to display below the title.
    ///   - isPresented: A binding to control the visibility of the snackbar.
    ///   - autoDismissDelay: The delay before the snackbar automatically dismisses. Optional. Default is *nil*.
    ///   - dismissCompletion: A closure to execute when the snackbar dismisses. Optional. Default is *nil*.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// VStack {
    ///     Text("My content")
    ///     Spacer()
    /// }
    /// .sparkSnackbar(
    ///     title: "Upload complete",
    ///     description: "Your file has been uploaded successfully",
    ///     isPresented: self.$showSnackbar,
    ///     autoDismissDelay: .default
    /// )
    /// .sparkTheme(self.theme)
    /// .sparkSnackbarIntent(.success)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Snackbar rendering.](snackbar_full.png)
    ///
    func sparkSnackbar(
        _ icon: Image? = nil,
        title: String,
        description: String,
        isPresented: Binding<Bool>,
        autoDismissDelay: SnackbarAutoDismissDelay? = nil,
        dismissCompletion: (() -> Void)? = nil
    ) -> some View {
        self.modifier(
            SnackbarViewModifier(
                icon,
                isPresented: isPresented,
                autoDismissDelay: autoDismissDelay,
                dismissCompletion: dismissCompletion,
                titleLabel: { Text(title) },
                descriptionLabel: { Text(description) },
                button: { EmptyView() }
            )
        )
    }

    /// Display a **Spark snackbar** with a custom title label and description label.
    ///
    /// Spark Snackbars provide brief notifications at the bottom of the screen.
    ///
    /// Snackbars inform users of a process that an app has performed or will perform.
    /// They appear temporarily, towards the bottom of the screen. They shouldn't interrupt
    /// the user experience, and they don't require user input to disappear.
    ///
    /// Use this initializer when you need custom content for both title and description.
    ///
    /// - Parameters:
    ///   - icon: An optional icon to display. Optional. Default is *nil*.
    ///   - isPresented: A binding to control the visibility of the snackbar.
    ///   - autoDismissDelay: The delay before the snackbar automatically dismisses. Optional. Default is *nil*.
    ///   - dismissCompletion: A closure to execute when the snackbar dismisses. Optional. Default is *nil*.
    ///   - titleLabel: A view builder that creates the title label.
    ///   - descriptionLabel: A view builder that creates the description label.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// VStack {
    ///     Text("My content")
    ///     Spacer()
    /// }
    /// .sparkSnackbar(
    ///     Image(systemName: "bell.fill"),
    ///     isPresented: self.$showSnackbar,
    ///     autoDismissDelay: .default,
    ///     titleLabel: {
    ///         Text("New Message")
    ///             .bold()
    ///     },
    ///     descriptionLabel: {
    ///         VStack(alignment: .leading) {
    ///             Text("John Doe")
    ///             Text("Hello, how are you?")
    ///         }
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// .sparkSnackbarIntent(.info)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Snackbar rendering.](snackbar_full.png)
    ///
    func sparkSnackbar<TitleLabel, DescriptionLabel>(
        _ icon: Image? = nil,
        isPresented: Binding<Bool>,
        autoDismissDelay: SnackbarAutoDismissDelay? = nil,
        dismissCompletion: (() -> Void)? = nil,
        @ViewBuilder titleLabel: @escaping () -> TitleLabel,
        @ViewBuilder descriptionLabel: @escaping () -> DescriptionLabel
    ) -> some View where TitleLabel: View, DescriptionLabel: View {
        self.modifier(
            SnackbarViewModifier(
                icon,
                isPresented: isPresented,
                autoDismissDelay: autoDismissDelay,
                dismissCompletion: dismissCompletion,
                titleLabel: titleLabel,
                descriptionLabel: descriptionLabel,
                button: { EmptyView() }
            )
        )
    }

    /// Display a **Spark snackbar** with only a description text.
    ///
    /// Spark Snackbars provide brief notifications at the bottom of the screen.
    ///
    /// Snackbars inform users of a process that an app has performed or will perform.
    /// They appear temporarily, towards the bottom of the screen. They shouldn't interrupt
    /// the user experience, and they don't require user input to disappear.
    ///
    /// - Parameters:
    ///   - icon: An optional icon to display. Optional. Default is *nil*.
    ///   - description: The description text to display.
    ///   - isPresented: A binding to control the visibility of the snackbar.
    ///   - autoDismissDelay: The delay before the snackbar automatically dismisses. Optional. Default is *nil*.
    ///   - dismissCompletion: A closure to execute when the snackbar dismisses. Optional. Default is *nil*.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// VStack {
    ///     Text("My content")
    ///     Spacer()
    /// }
    /// .sparkSnackbar(
    ///     Image(systemName: "checkmark.circle"),
    ///     description: "File saved successfully",
    ///     isPresented: self.$showSnackbar,
    ///     autoDismissDelay: .default
    /// )
    /// .sparkTheme(self.theme)
    /// .sparkSnackbarIntent(.success)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Snackbar rendering.](snackbar_full.png)
    ///
    func sparkSnackbar(
        _ icon: Image? = nil,
        description: String,
        isPresented: Binding<Bool>,
        autoDismissDelay: SnackbarAutoDismissDelay? = nil,
        dismissCompletion: (() -> Void)? = nil
    ) -> some View {
        self.modifier(
            SnackbarViewModifier(
                icon,
                isPresented: isPresented,
                autoDismissDelay: autoDismissDelay,
                dismissCompletion: dismissCompletion,
                titleLabel: { EmptyView() },
                descriptionLabel: { Text(description) },
                button: { EmptyView() }
            )
        )
    }

    /// Display a **Spark snackbar** with description text and an action button.
    ///
    /// Spark Snackbars provide brief notifications at the bottom of the screen.
    ///
    /// Snackbars inform users of a process that an app has performed or will perform.
    /// They appear temporarily, towards the bottom of the screen. They shouldn't interrupt
    /// the user experience, and they don't require user input to disappear.
    ///
    /// - Parameters:
    ///   - icon: An optional icon to display. Optional. Default is *nil*.
    ///   - description: The description text to display.
    ///   - isPresented: A binding to control the visibility of the snackbar.
    ///   - autoDismissDelay: The delay before the snackbar automatically dismisses. Optional. Default is *nil*.
    ///   - dismissCompletion: A closure to execute when the snackbar dismisses. Optional. Default is *nil*.
    ///   - button: A view builder that creates the action button.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// VStack {
    ///     Text("My content")
    ///     Spacer()
    /// }
    /// .sparkSnackbar(
    ///     Image(systemName: "trash"),
    ///     description: "Item deleted",
    ///     isPresented: self.$showSnackbar,
    ///     autoDismissDelay: .default,
    ///     button: {
    ///         SparkButton("Undo") {
    ///             // Undo action
    ///         }
    ///         .sparkButtonVariant(.ghost)
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// .sparkSnackbarIntent(.alert)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Snackbar rendering.](snackbar_full.png)
    ///
    func sparkSnackbar<ActionButton>(
        _ icon: Image? = nil,
        description: String,
        isPresented: Binding<Bool>,
        autoDismissDelay: SnackbarAutoDismissDelay? = nil,
        dismissCompletion: (() -> Void)? = nil,
        @ViewBuilder button: @escaping () -> ActionButton
    ) -> some View where ActionButton: View {
        self.modifier(
            SnackbarViewModifier(
                icon,
                isPresented: isPresented,
                autoDismissDelay: autoDismissDelay,
                dismissCompletion: dismissCompletion,
                titleLabel: { EmptyView() },
                descriptionLabel: { Text(description) },
                button: button
            )
        )
    }

    /// Display a **Spark snackbar** with a custom description label.
    ///
    /// Spark Snackbars provide brief notifications at the bottom of the screen.
    ///
    /// Snackbars inform users of a process that an app has performed or will perform.
    /// They appear temporarily, towards the bottom of the screen. They shouldn't interrupt
    /// the user experience, and they don't require user input to disappear.
    ///
    /// Use this initializer when you need custom description content without a title.
    ///
    /// - Parameters:
    ///   - icon: An optional icon to display. Optional. Default is *nil*.
    ///   - isPresented: A binding to control the visibility of the snackbar.
    ///   - autoDismissDelay: The delay before the snackbar automatically dismisses. Optional. Default is *nil*.
    ///   - dismissCompletion: A closure to execute when the snackbar dismisses. Optional. Default is *nil*.
    ///   - descriptionLabel: A view builder that creates the description label.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// VStack {
    ///     Text("My content")
    ///     Spacer()
    /// }
    /// .sparkSnackbar(
    ///     Image(systemName: "info.circle"),
    ///     isPresented: self.$showSnackbar,
    ///     autoDismissDelay: .default,
    ///     descriptionLabel: {
    ///         VStack(alignment: .leading, spacing: 4) {
    ///             Text("System update available")
    ///             Text("Version 2.0.1")
    ///                 .font(.caption)
    ///         }
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// .sparkSnackbarIntent(.info)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Snackbar rendering.](snackbar_full.png)
    ///
    func sparkSnackbar<DescriptionLabel>(
        _ icon: Image? = nil,
        isPresented: Binding<Bool>,
        autoDismissDelay: SnackbarAutoDismissDelay? = nil,
        dismissCompletion: (() -> Void)? = nil,
        @ViewBuilder descriptionLabel: @escaping () -> DescriptionLabel
    ) -> some View where DescriptionLabel: View {
        self.modifier(
            SnackbarViewModifier(
                icon,
                isPresented: isPresented,
                autoDismissDelay: autoDismissDelay,
                dismissCompletion: dismissCompletion,
                titleLabel: { EmptyView() },
                descriptionLabel: descriptionLabel,
                button: { EmptyView() }
            )
        )
    }

    /// Display a **Spark snackbar** with a custom description label and an action button.
    ///
    /// Spark Snackbars provide brief notifications at the bottom of the screen.
    ///
    /// Snackbars inform users of a process that an app has performed or will perform.
    /// They appear temporarily, towards the bottom of the screen. They shouldn't interrupt
    /// the user experience, and they don't require user input to disappear.
    ///
    /// Use this initializer when you need custom description content with an action button but no title.
    ///
    /// - Parameters:
    ///   - icon: An optional icon to display. Optional. Default is *nil*.
    ///   - isPresented: A binding to control the visibility of the snackbar.
    ///   - autoDismissDelay: The delay before the snackbar automatically dismisses. Optional. Default is *nil*.
    ///   - dismissCompletion: A closure to execute when the snackbar dismisses. Optional. Default is *nil*.
    ///   - descriptionLabel: A view builder that creates the description label.
    ///   - button: A view builder that creates the action button.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// VStack {
    ///     Text("My content")
    ///     Spacer()
    /// }
    /// .sparkSnackbar(
    ///     Image(systemName: "photo"),
    ///     isPresented: self.$showSnackbar,
    ///     autoDismissDelay: .default,
    ///     descriptionLabel: {
    ///         HStack {
    ///             Text("Photo uploaded")
    ///             Image(systemName: "checkmark")
    ///                 .foregroundColor(.green)
    ///         }
    ///     },
    ///     button: {
    ///         SparkButton("View") {
    ///             // View action
    ///         }
    ///         .sparkButtonVariant(.ghost)
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// .sparkSnackbarIntent(.success)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Snackbar rendering.](snackbar_full.png)
    ///
    func sparkSnackbar<DescriptionLabel, ActionButton>(
        _ icon: Image? = nil,
        isPresented: Binding<Bool>,
        autoDismissDelay: SnackbarAutoDismissDelay? = nil,
        dismissCompletion: (() -> Void)? = nil,
        @ViewBuilder descriptionLabel: @escaping () -> DescriptionLabel,
        @ViewBuilder button: @escaping () -> ActionButton
    ) -> some View where DescriptionLabel: View, ActionButton: View {
        self.modifier(
            SnackbarViewModifier(
                icon,
                isPresented: isPresented,
                autoDismissDelay: autoDismissDelay,
                dismissCompletion: dismissCompletion,
                titleLabel: { EmptyView() },
                descriptionLabel: descriptionLabel,
                button: button
            )
        )
    }

    /// Display a **Spark snackbar** with custom title label, description label, and an action button.
    ///
    /// Spark Snackbars provide brief notifications at the bottom of the screen.
    ///
    /// Snackbars inform users of a process that an app has performed or will perform.
    /// They appear temporarily, towards the bottom of the screen. They shouldn't interrupt
    /// the user experience, and they don't require user input to disappear.
    ///
    /// Use this initializer when you need custom content for both title and description with an action button.
    ///
    /// - Parameters:
    ///   - icon: An optional icon to display. Optional. Default is *nil*.
    ///   - isPresented: A binding to control the visibility of the snackbar.
    ///   - autoDismissDelay: The delay before the snackbar automatically dismisses. Optional. Default is *nil*.
    ///   - dismissCompletion: A closure to execute when the snackbar dismisses. Optional. Default is *nil*.
    ///   - titleLabel: A view builder that creates the title label.
    ///   - descriptionLabel: A view builder that creates the description label.
    ///   - button: A view builder that creates the action button.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// VStack {
    ///     Text("My content")
    ///     Spacer()
    /// }
    /// .sparkSnackbar(
    ///     Image(systemName: "star.fill"),
    ///     isPresented: self.$showSnackbar,
    ///     autoDismissDelay: .default,
    ///     titleLabel: {
    ///         Text("Achievement Unlocked")
    ///             .bold()
    ///     },
    ///     descriptionLabel: {
    ///         VStack(alignment: .leading) {
    ///             Text("Level 10 reached!")
    ///             Text("Keep up the great work")
    ///         }
    ///     },
    ///     button: {
    ///         SparkButton("View") {
    ///             // View action
    ///         }
    ///         .sparkButtonVariant(.ghost)
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// .sparkSnackbarIntent(.success)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Snackbar rendering.](snackbar_full.png)
    ///
    func sparkSnackbar<TitleLabel, DescriptionLabel, ActionButton>(
        _ icon: Image? = nil,
        isPresented: Binding<Bool>,
        autoDismissDelay: SnackbarAutoDismissDelay? = nil,
        dismissCompletion: (() -> Void)? = nil,
        @ViewBuilder titleLabel: @escaping () -> TitleLabel,
        @ViewBuilder descriptionLabel: @escaping () -> DescriptionLabel,
        @ViewBuilder button: @escaping () -> ActionButton
    ) -> some View where TitleLabel: View, DescriptionLabel: View, ActionButton: View {
        self.modifier(
            SnackbarViewModifier(
                icon,
                isPresented: isPresented,
                autoDismissDelay: autoDismissDelay,
                dismissCompletion: dismissCompletion,
                titleLabel: titleLabel,
                descriptionLabel: descriptionLabel,
                button: button
            )
        )
    }
}
