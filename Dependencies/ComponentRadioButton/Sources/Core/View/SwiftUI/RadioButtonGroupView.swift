//
//  RadioButtonGroupView.swift
//  SparkRadioButton
//
//  Created by michael.zimmermann on 12.04.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// RadioButtonGroupView is a radio button group control which renders a list of ``RadioButtonView``.
///
/// The radio button group is created by providing:
/// - A theme
/// - An option title. If the title is empty, no title will be rendered.
/// - The selectedID, a binding value.
/// - A list of ``RadioButtonItem``.
///
/// **Example**
/// ```swift
///    RadioButtonGroupView(
///       theme: self.theme,
///       title: "Radio Button Group",
///       selectedID: self.$selectedID,
///       items: [
///           RadioButtonItem(label: "Label 1", id: 1),
///           RadioButtonItem(label: "Label 2", id: 2)
///       ]
///    }
///  ```
@available(*, deprecated, message: "Use SparkRadioGroup instead !")
public struct RadioButtonGroupView<ID: Equatable & Hashable & CustomStringConvertible>: View {

    // MARK: - Injected properties

    private var selectedID: Binding<ID?>
    private let items: [RadioButtonItem<ID>]
    private let groupLayout: RadioButtonGroupLayout
    private let labelAlignment: RadioButtonLabelAlignment
    private let viewModel: RadioButtonGroupViewModel

    // MARK: - Local properties

    @ScaledMetric private var spacing: CGFloat

    // MARK: - Initialization

    /// - Parameters
    ///   - theme: The theme defining colors and layout options.
    ///   - title: An option string. The title is rendered above the radio button items, if it is not empty.
    ///   - selectedID: a binding to the selected value.
    ///   - items: A list of ``RadioButtonItem``
    @available(*, deprecated, message: "Use init with intent instead.")
    public init(theme: any Theme,
                title: String? = nil,
                selectedID: Binding<ID?>,
                items: [RadioButtonItem<ID>],
                radioButtonLabelPosition: RadioButtonLabelPosition = .right,
                groupLayout: RadioButtonGroupLayout = .vertical,
                state: RadioButtonGroupState = .enabled
    ) {
        self.init(theme: theme,
                  intent: state.intent,
                  selectedID: selectedID,
                  items: items,
                  labelAlignment: radioButtonLabelPosition.alignment,
                  groupLayout: groupLayout
        )
        self.viewModel.isDisabled = state == .disabled
    }

    /// - Parameters
    ///   - theme: The theme defining colors and layout options.
    ///   - title: An option string. The title is rendered above the radio button items, if it is not empty.
    ///   - selectedID: a binding to the selected value.
    ///   - items: A list of ``RadioButtonItem``
    public init(theme: any Theme,
                intent: RadioButtonIntent,
                selectedID: Binding<ID?>,
                items: [RadioButtonItem<ID>],
                labelAlignment: RadioButtonLabelAlignment = .trailing,
                groupLayout: RadioButtonGroupLayout = .vertical
    ) {
        self.items = items
        self.selectedID = selectedID
        self.groupLayout = groupLayout
        self.labelAlignment = labelAlignment
        self.viewModel = RadioButtonGroupViewModel(theme: theme, intent: intent)
        self._spacing = ScaledMetric(wrappedValue: self.viewModel.spacing)
    }

    // MARK: - Content

    public var body: some View {

        VStack(alignment: .leading, spacing: 0) {
            if groupLayout == .vertical {
                radioButtonItems
            } else {
                horizontalRadioButtons
            }
        }
    }

    public func theme(_ theme: any Theme) -> Self {
        self.viewModel.theme = theme
        return self
    }

    @ViewBuilder
    private var horizontalRadioButtons: some View {
        HStack(alignment: .top, spacing: self.spacing) {
            radioButtonItems
        }
    }

    @ViewBuilder
    private var radioButtonItems: some View {
        ForEach(self.items, id: \.id) { item in
            RadioButtonView(
                theme: self.viewModel.theme,
                intent: self.viewModel.intent,
                id: item.id,
                label: item.label,
                selectedID: self.selectedID,
                labelAlignment: self.labelAlignment
            )
            .accessibilityIdentifier(RadioButtonAccessibilityIdentifier.radioButtonIdentifier(id: item.id))
            .padding(.bottom, self.bottomPadding(of: item))
        }
    }

    private func bottomPadding(of item: RadioButtonItem<ID>) -> CGFloat {
        if self.groupLayout == .horizontal || item.id == items.last?.id {
            return 0
        } else {
            return self.viewModel.spacing
        }
    }
}
