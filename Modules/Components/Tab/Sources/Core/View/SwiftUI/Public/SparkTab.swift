//
//  SparkTab.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 24/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

/// A tab bar that groups related content and lets users switch views on the same page.
///
/// Tabs are used to group different but related content, allowing users to navigate views without leaving the page.
/// They always contain at least two items and one tab is active at a time.
///
/// ## Example of usage
///
/// ### With Text
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State private var selection = 1
///
///     var body: some View {
///         SparkTab(selection: self.$selection) {
///             SparkTabItem(tag: 1, text: "First")
///             SparkTabItem(tag: 2, text: "Second")
///             SparkTabItem(tag: 3, text: "Third")
///         }
///         .sparkTheme(self.theme)
///         .sparkTabIntent(.main)
///         .sparkTabSize(.medium)
///         .sparkTabApportionsSegmentWidthsByContent(true)
///     }
/// }
/// ```
///
/// ### With Icons
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State private var selection = 1
///
///     var body: some View {
///         SparkTab(selection: self.$selection) {
///             SparkTabItem(tag: 1, icon: Image(systemName: "house"))
///             SparkTabItem(tag: 2, icon: Image(systemName: "star"))
///             SparkTabItem(tag: 3, icon: Image(systemName: "person"))
///         }
///         .sparkTheme(self.theme)
///         .sparkTabIntent(.main)
///         .sparkTabSize(.medium)
///         .sparkTabApportionsSegmentWidthsByContent(true)
///     }
/// }
/// ```
///
/// ### With Extra Label
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State private var selection = 1
///
///     var body: some View {
///         SparkTab(selection: self.$selection) {
///             SparkTabItem(tag: 1, text: "First", icon: Image(systemName: "house")) {
///                 Text("99+")
///             }
///             SparkTabItem(tag: 2, text: "Second", icon: Image(systemName: "star"))
///             SparkTabItem(tag: 3, text: "Third", icon: Image(systemName: "person"))
///         }
///         .sparkTheme(self.theme)
///         .sparkTabIntent(.main)
///         .sparkTabSize(.medium)
///         .sparkTabApportionsSegmentWidthsByContent(true)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component uses some EnvironmentValues:
/// - **theme**: ``sparkTheme(_:)`` (View extension)
/// - **intent**: ``sparkTabIntent(_:)`` (View extension)
/// - **size**: ``sparkTabSize(_:)`` (View extension)
/// - **apportionsSegmentWidthsByContent**: ``sparkTabApportionsSegmentWidthsByContent(_:)`` (View extension)
///
/// > If these values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Accessibility
///
/// By default, VoiceOver reads in order:
/// - The tab item label
/// - The current position (e.g., "1 of 3")
/// - The selection state
///
/// On accessibility sizes, a long press gesture will show an accessibility list view for easier navigation.
///
/// ## Rendering
///
/// ### Texts
///
/// ![Tab rendering.](tab_texts.png)
///
/// ### Icons
///
/// ![Tab rendering.](tab_icons.png)
///
/// ### With Extra View
///
/// ![Tab rendering.](tab_extra_view.png)
///
/// ### All Values
///
/// ![Tab rendering.](tab_all_values.png)
///
public struct SparkTab<SelectionValue, Content>: View where SelectionValue: Hashable, Content: View {

    // MARK: - Properties

    @Binding private var selection: SelectionValue
    private var content: () -> Content

    @Environment(\.theme) private var theme
    @Environment(\.tabApportionsSegmentWidthsByContent) private var apportionsSegmentWidthsByContent
    @Environment(\.tabIntent) private var intent
    @Environment(\.tabSize) private var size
    @Environment(\.isEnabled) private var isEnabled

    @StateObject private var viewModel = TabViewModel()

    @State private var tags: [AnyHashable] = []

    @State private var pressedId: AnyHashable?

    @State private var showAccessibilityList = false
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    // MARK: - Initialization

    /// Creates a tab bar to switch between multiple child views.
    ///
    /// - Parameters:
    ///   - selection: A binding to a property that determines the currently-selected tab.
    ///   - content: A closure that produces the content of the tab bar. Use ``SparkTabItem`` instances to define each tab.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State private var selection = 1
    ///
    ///     var body: some View {
    ///         SparkTab(selection: self.$selection) {
    ///             SparkTabItem(tag: 1, text: "First")
    ///             SparkTabItem(tag: 2, text: "Second")
    ///             SparkTabItem(tag: 3, text: "Third")
    ///         }
    ///         .sparkTheme(self.theme)
    ///         .sparkTabIntent(.main)
    ///         .sparkTabSize(.medium)
    ///         .sparkTabApportionsSegmentWidthsByContent(true)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Tab rendering.](tab_texts.png)
    ///
    public init(
        selection: Binding<SelectionValue>,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._selection = selection
        self.content = content
    }

    // MARK: - View

    public var body: some View {
        // Items
        ZStack(alignment: .bottom) {

            // Background line
            self.backgroundLine()

            self.container {

                HStack(spacing: .zero) {

                    ForEach(self.tags.indices, id: \.self) { index in

                        if let tag = self.tags[safe: index] {

                            let isSelected = self.selection == tag.base as? SelectionValue

                            ZStack(alignment: .bottomLeading) {

                                // Button
                                self.itemButton(
                                    tag: tag,
                                    index: index,
                                    isSelected: isSelected
                                )

                                // Selected item indicator line
                                Rectangle()
                                    .fill(self.viewModel.linesColors.selectedColorToken)
                                    .frame(height: isSelected ? TabConstants.selectedLineHeight : .zero)
                                    .optionalAnimation(
                                        .easeInOut(duration: TabConstants.animationDuration),
                                        value: isSelected
                                    )
                            }
                            .id(tag)
                        }
                    }

                    if !self.apportionsSegmentWidthsByContent {
                        Spacer(minLength: .zero)
                    }
                }
            }
        }
        .sparkSensoryFeedback(.selection, trigger: self.selection)
        .opacity(self.viewModel.dim)
        .background(
            content()
                .hidden()
                .tabContext(.collecting)
                .onPreferenceChange(TabTagsPreferenceKey.self) { value in
                    self.tags = value
                }
        )
        .popover(isPresented: self.$showAccessibilityList, content: {
            self.accessibilityPopoverContent()
        })
        .accessibilityIdentifier(TabAccessibilityIdentifier.view)
        .dynamicTypeSize(DynamicTypeSize.large)
        .onAppear() {
            self.viewModel.setup(
                theme: self.theme.value,
                intent: self.intent,
                size: self.size,
                isEnabled: self.isEnabled
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
        .onChange(of: self.intent) { intent in
            self.viewModel.intent = intent
        }
        .onChange(of: self.size) { size in
            self.viewModel.size = size
        }
        .onChange(of: self.isEnabled) { isEnabled in
            self.viewModel.isEnabled = isEnabled
        }
    }

    private func backgroundLine() -> some View {
        Rectangle()
            .fill(self.viewModel.linesColors.colorToken)
            .frame(height: TabConstants.lineHeight)
    }

    @ViewBuilder
    private func container<Label>(content: @escaping () -> Label) -> some View where Label: View {
        if !self.apportionsSegmentWidthsByContent {
            content()
        } else {
            ScrollViewReader { proxy in
                ScrollView(.horizontal) {
                    content()
                }
                .scrollIndicators(.hidden)
                .scrollBounceBehavior()
                .onChange(of: self.tags) { _ in
                    // Scroll to selection when tags are populated
                    if !self.tags.isEmpty {
                        DispatchQueue.main.async {
                            proxy.scrollTo(self.selection)
                        }
                    }
                }
                .onChange(of: self.selection) { newSelection in
                    DispatchQueue.main.async {
                        withAnimation(.easeInOut(duration: TabConstants.animationDuration)) {
                            proxy.scrollTo(newSelection)
                        }
                    }
                }
            }
        }
    }

    private func itemButton(
        tag: AnyHashable,
        index: Int,
        isSelected: Bool
    ) -> some View {
        Button {
            if !self.showAccessibilityList,
               let tagValue = tag.base as? SelectionValue,
               self.selection != tagValue {
                self.selection = tagValue
            }
        } label: {

            self.content()
                .tabLayout(self.viewModel.layout)
                .tabSizes(self.viewModel.sizes)
                .tabItemIsSelected(isSelected)
                .tabItemIsPressed(self.pressedId == tag)
                .tabContext(.renderer)
                .tabItemTag(tag)
        }
        .frame(maxWidth: self.apportionsSegmentWidthsByContent ? nil : .infinity)
        .buttonStyle(PressedButtonStyle(
            isPressed: Binding(
                get: {
                    self.pressedId == tag
                }, set: { value, _ in
                    self.pressedId = value ? tag : nil
                }
            )
        ))
        .simultaneousGesture(
            LongPressGesture(minimumDuration: 0.5)
                .onEnded { _ in
                    self.showAccessibilityList = true
                    self.pressedId = nil
                },
            isEnabled: self.dynamicTypeSize.isAccessibilitySize
        )
        .accessibilityIdentifier(TabAccessibilityIdentifier.item(at: index))
        .accessibilityValue(String.accessibilityLabel(
            index: index,
            count: self.tags.indices.count
        ))
        .accessibilityAddTraits(isSelected ? .isSelected : [])
        .overlay(alignment: .bottom) {
            self.backgroundLine()
        }
    }

    private func accessibilityPopoverContent() -> some View {
        ScrollView {
            VStack {
                ForEach(self.tags.indices, id: \.self) { index in

                    if let tag = self.tags[safe: index] {

                        let isSelected = self.selection == tag.base as? SelectionValue

                        Button {
                            if let tagValue = tag.base as? SelectionValue,
                               self.selection != tagValue {
                                self.selection = tagValue
                            }
                            self.showAccessibilityList = false
                        } label: {
                            self.content()
                                .tabContext(.accessibilityRenderer)
                                .tabItemTag(tag)
                        }
                        .padding(.horizontal, self.viewModel.layout.horizontalPadding)
                        .padding(.vertical, self.viewModel.layout.verticalPadding)
                        .accessibilityItemButtonColors(
                            isSelected: isSelected,
                            colors: self.viewModel.accessibilityColors
                        )
                        .clipShape(Capsule())
                        .accessibilityValue(String.accessibilityLabel(
                            index: index,
                            count: self.tags.indices.count
                        ))
                        .accessibilityAddTraits(isSelected ? .isSelected : [])
                        .accessibilityAddTraits(isSelected ? .isSelected : [])
                    }
                }
            }
            .padding(.vertical, self.viewModel.layout.verticalPadding)
        }
        .padding(.horizontal, self.viewModel.layout.horizontalPadding)
        .scrollBounceBehavior()
        .scrollIndicators(.hidden)
        .presentationCompactAdaptation()
    }

    // MARK: - Methods

    private func isSelected(_ tag: AnyHashable) -> Bool {
        guard let tagValue = tag.base as? SelectionValue else {
            return false
        }

        return tagValue == self.selection
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func scrollBounceBehavior() -> some View {
        if #available(iOS 16.4, *) {
            self.scrollBounceBehavior(.basedOnSize, axes: .horizontal)
        } else {
            self
        }
    }

    @ViewBuilder
    func presentationCompactAdaptation() -> some View {
        if #available(iOS 16.4, *) {
            self.presentationCompactAdaptation(.popover)
        } else {
            self
        }
    }

    @ViewBuilder
    func accessibilityItemButtonColors(isSelected: Bool, colors: TabAccessibilityColors) -> some View {
        if isSelected {
            self.tint(colors.selectedTintColorToken)
                .background(colors.selectedBackgroundColorToken)
        } else {
            self.tint(.primary)
        }
    }
}
