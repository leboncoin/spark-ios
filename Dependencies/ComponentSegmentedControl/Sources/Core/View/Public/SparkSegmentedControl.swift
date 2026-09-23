//
//  SparkSegmentedControl.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 24/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming
@_spi(SI_SPI) import SparkCommon

/// A Spark Segmented control provides closely related choices that affect an object, state, or view.
///
/// The Segmented Control displays individual segments for each option and supports 2 to 8 segments configurations.
///
/// ## Example of usage
///
/// ### Default (with text)
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State private var selection = 0
///
///     var body: some View {
///         SparkSegmentedControl(selection: self.$selection) {
///             SparkSegmentedControlItem(tag: 0, text: "Day")
///             SparkSegmentedControlItem(tag: 1, text: "Week")
///             SparkSegmentedControlItem(tag: 2, text: "Month")
///         }
///         .sparkTheme(self.theme)
///     }
/// }
/// ```
///
/// ### With Icons
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State private var selection = 0
///
///     var body: some View {
///         SparkSegmentedControl(selection: self.$selection) {
///             SparkSegmentedControlItem(tag: 0, icon: Image(systemName: "house"))
///             SparkSegmentedControlItem(tag: 1, icon: Image(systemName: "star"))
///             SparkSegmentedControlItem(tag: 2, icon: Image(systemName: "person"))
///         }
///         .sparkTheme(self.theme)
///     }
/// }
/// ```
///
/// ### With Text and Icons
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State private var selection = 0
///
///     var body: some View {
///         SparkSegmentedControl(selection: self.$selection) {
///             SparkSegmentedControlItem(tag: 0, text: "Home", icon: Image(systemName: "house"))
///             SparkSegmentedControlItem(tag: 1, text: "Favorites", icon: Image(systemName: "star"))
///             SparkSegmentedControlItem(tag: 2, text: "Profile", icon: Image(systemName: "person"))
///         }
///         .sparkTheme(self.theme)
///     }
/// }
/// ```
///
/// ### With Custom Label
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State private var selection = 0
///
///     var body: some View {
///         SparkSegmentedControl(selection: self.$selection) {
///             SparkSegmentedControlItem(tag: 0) {
///                 Text("Custom")
///             }
///             SparkSegmentedControlItem(tag: 1) {
///                 HStack {
///                     Image(systemName: "star")
///                     Text("Special")
///                 }
///             }
///         }
///         .sparkTheme(self.theme)
///     }
/// }
/// ```
///
/// ### Disabled State
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State private var selection = 0
///
///     var body: some View {
///         SparkSegmentedControl(selection: self.$selection) {
///             SparkSegmentedControlItem(tag: 0, text: "Day")
///             SparkSegmentedControlItem(tag: 1, text: "Week")
///             SparkSegmentedControlItem(tag: 2, text: "Month")
///         }
///         .sparkTheme(self.theme)
///         .disabled(true)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component use some EnvironmentValues :
/// - **theme** : ``sparkTheme(_:)`` (View extension)
///
/// > If these values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Accessibility
///
/// By default, VoiceOver reads in order:
/// - The segment label
/// - The current position (e.g., "1 of 3")
/// - The selection state
///
/// On accessibility sizes, a **long press gesture** will show an accessibility list view for easier navigation.
///
/// ## Rendering
///
/// ### Content Types
///
/// | Text | Icons | Text and Icons | Label |
/// |:---:|:---:|:---:|:---:|
/// | ![SegmentedControl rendering with text.](segmentedcontrol_texts.png) | ![SegmentedControl rendering with icons.](segmentedcontrol_icons.png) | ![SegmentedControl rendering with text and icons.](segmentedcontrol_icons_and_texts.png) | ![SegmentedControl rendering with label.](segmentedcontrol_label.png) |
///
/// ### Segment Count
///
/// | 3 items | 6 items | 7 items |
/// |:---:|:---:|:---:|
/// | ![SegmentedControl rendering with 3 items.](segmentedcontrol_three_items.png) | ![SegmentedControl rendering with 6 items.](segmentedcontrol_six_items.png) | ![SegmentedControl rendering with 7 items.](segmentedcontrol_seven_items.png) |
///
public struct SparkSegmentedControl<SelectionValue, Content>: View where SelectionValue: Hashable, Content: View {

    // MARK: - Properties

    @Binding private var selection: SelectionValue
    private var content: () -> Content

    @Environment(\.theme) private var theme
    @Environment(\.isEnabled) private var isEnabled

    @StateObject private var viewModel = SegmentedControlViewModel()

    @State private var tags: [[AnyHashable]] = []
    @State private var flattedTags: [AnyHashable] = []

    @State private var pressedId: AnyHashable?

    @State private var showAccessibilityList = false
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    @Namespace private var animation

    // MARK: - Initialization

    /// Create a segmented control to switch between multiple segments.
    ///
    /// - Parameters:
    ///   - selection: The binding value that determines the currently-selected segment.
    ///   - content: A view builder closure that produces the content of the segmented control. Use ``SparkSegmentedControlItem`` instances to define each segment.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State private var selection = 0
    ///
    ///     var body: some View {
    ///         SparkSegmentedControl(selection: self.$selection) {
    ///             SparkSegmentedControlItem(tag: 0, text: "Day")
    ///             SparkSegmentedControlItem(tag: 1, text: "Week")
    ///             SparkSegmentedControlItem(tag: 2, text: "Month")
    ///         }
    ///         .sparkTheme(self.theme)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![SegmentedControl rendering with text.](segmentedcontrol_texts.png)
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
        VStack(spacing: .zero) {

            ForEach(Array(self.tags.enumerated()), id: \.offset) { rowIndex, tags in
                HStack(spacing: self.viewModel.layout.spacing) {

                    ForEach(Array(tags.enumerated()), id: \.offset) { columnIndex, tag in

                        let isSelected = self.selection == tag.base as? SelectionValue

                        ZStack {
                            // Background indicator for selected item
                            if isSelected {
                                Rectangle()
                                    .fill(self.viewModel.colors.selectedItemBackgroundColorToken)
                                    .sparkBorder(
                                        width: self.viewModel.border.selectedItemWidth,
                                        radius: self.viewModel.border.selectedItemRadius,
                                        colorToken: self.viewModel.colors.selectedItemBorderColorToken
                                    )
                                    .matchedGeometryEffect(id: "indicator", in: self.animation)
                            }

                            // Item button
                            self.itemButton(
                                tag: tag,
                                isSelected: isSelected
                            )
                        }
                        .padding(.vertical, self.viewModel.layout.padding)
                        .id(tag)

                        // Vertical Separator
                        if self.viewModel.getIsVerticalSeparator(
                            tags: self.tags.count,
                            horizontalTags: tags.count,
                            columnIndex: columnIndex
                        ) {
                            Rectangle()
                                .fill(self.viewModel.colors.separatorColorToken)
                                .frame(
                                    width: SegmentedControlConstants.Separator.width,
                                    height: SegmentedControlConstants.Separator.height
                                )
                        }
                    }
                }
                .padding(.horizontal, self.viewModel.layout.padding)

                // Horizontal Separator
                if self.tags.count > 1, rowIndex < self.tags.count - 1 {
                    Rectangle()
                        .fill(self.viewModel.colors.separatorColorToken)
                        .frame(height: SegmentedControlConstants.Separator.width)
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .background(self.viewModel.colors.backgroundColorToken)
        .sparkBorder(
            width: self.viewModel.border.width,
            radius: self.viewModel.border.radius,
            colorToken: self.viewModel.colors.borderColorToken
        )
        .frame(minHeight: SegmentedControlConstants.minHeight)
        .sparkSensoryFeedback(.selection, trigger: self.selection)
        .opacity(self.viewModel.dim)
        .background(
            self.content()
                .hidden()
                .segmentedControlContext(.collecting)
                .onPreferenceChange(SegmentedControlTagsPreferenceKey.self) { value in
                    self.flattedTags = value
                    self.tags = self.viewModel.getDisplayTags(from: value)
                }
        )
        .popover(isPresented: self.$showAccessibilityList, content: {
            self.accessibilityPopoverContent()
        })
        .accessibilityIdentifier(SegmentedControlAccessibilityIdentifier.view)
        .dynamicTypeSize(.large)
        .onAppear() {
            self.viewModel.setup(
                theme: self.theme.value,
                isEnabled: self.isEnabled
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
        .onChange(of: self.isEnabled) { isEnabled in
            self.viewModel.isEnabled = isEnabled
        }
    }

    private func itemButton(
        tag: AnyHashable,
        isSelected: Bool
    ) -> some View {
        let index = self.flattedTags.firstIndex(of: tag) ?? -1

        return Button {
            withOptionalAnimation(.easeInOut(duration: SegmentedControlConstants.animationDuration)) {
                if !self.showAccessibilityList,
                   let tagValue = tag.base as? SelectionValue,
                   self.selection != tagValue {
                    self.selection = tagValue
                }
            }
        } label: {
            self.content()
                .segmentedControlLayout(self.viewModel.layout)
                .segmentedControlItemIsSelected(isSelected)
                .segmentedControlItemIsPressed(self.pressedId == tag)
                .segmentedControlContext(.renderer)
                .segmentedControlItemTag(tag)
        }
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
        .sparkCornerRadius(self.viewModel.border.selectedItemRadius)
        .accessibilityIdentifier(SegmentedControlAccessibilityIdentifier.item(at: index))
        .accessibilityValue(String.accessibilityLabel(
            index: index,
            count: self.flattedTags.indices.count
        ))
        .accessibilityAddTraits(isSelected ? .isSelected : [])
    }

    private func accessibilityPopoverContent() -> some View {
        ScrollView {
            VStack {
                ForEach(Array(self.flattedTags.enumerated()), id: \.offset) { index, tag in

                    let isSelected = self.selection == tag.base as? SelectionValue

                    Button {
                        withOptionalAnimation(.easeInOut(duration: SegmentedControlConstants.animationDuration)) {
                            if let tagValue = tag.base as? SelectionValue,
                               self.selection != tagValue {
                                self.selection = tagValue
                            }
                        }
                        self.showAccessibilityList = false
                    } label: {
                        self.content()
                            .segmentedControlLayout(self.viewModel.layout)
                            .segmentedControlContext(.accessibilityRenderer)
                            .segmentedControlItemTag(tag)
                    }
                    .padding(.horizontal, self.viewModel.layout.accessibilityHorizontalPadding)
                    .padding(.vertical, self.viewModel.layout.accessibilityVerticalPadding)
                    .accessibilityItemButtonColors(
                        isSelected: isSelected,
                        colors: self.viewModel.colors
                    )
                    .clipShape(Capsule())
                    .accessibilityValue(String.accessibilityLabel(
                        index: index,
                        count: self.flattedTags.indices.count
                    ))
                    .accessibilityAddTraits(isSelected ? .isSelected : [])
                }
            }
            .padding(.vertical, self.viewModel.layout.accessibilityVerticalPadding)
        }
        .padding(.horizontal, self.viewModel.layout.accessibilityHorizontalPadding)
        .scrollBounceBehavior()
        .scrollIndicators(.hidden)
        .presentationCompactAdaptation()
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func accessibilityItemButtonColors(isSelected: Bool, colors: SegmentedControlColors) -> some View {
        if isSelected {
            self.tint(colors.accessibilitySelectedTintColorToken)
                .background(colors.accessibilitySelectedBackgroundColorToken)
        } else {
            self.tint(.primary)
        }
    }

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
}
