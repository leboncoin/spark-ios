//
//  ComponentsView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 15/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct ComponentsView: View {

    // MARK: - Enum

    enum Framework: String, CaseIterable, Hashable {
        case swiftUI
        case uiKit

        var isSwiftUI: Bool {
            self == .swiftUI
        }

        var name: String {
            switch self {
            case .uiKit: "UIKit"
            case .swiftUI: "SwiftUI"
            }
        }

        var icon: String {
            switch self {
            case .uiKit: "u.circle"
            case .swiftUI: "s.circle"
            }
        }
    }

    private enum Component: String, CaseIterable, Hashable {
        case badge
        case bottomSheet
        case button
        case checkbox
        case checkboxGroup
        case chip
        case divider
        case icon
        case iconButton
        case popover
        case progressBar
        case progressBarIndeterminate
        case progressTracker
        case radioButton
//        case rating
        case ratingDisplay
        case ratingInput
        case slider
        case snackbar
        case snackbarPresentation
        case spinner
        case `switch`
        case tab
        case tag
//        case textInput
        case textEditor
        case textField
        case textFieldAddons
        case textLink

        static func allCases(for framework: Framework) -> [Self] {
            switch framework {
            case .uiKit: []
            case .swiftUI: self.allCases
            }
        }
    }

    // MARK: - Properties

    let framework: Framework

    // MARK: - View

    var body: some View {
        NavigationStack {
            List(
                Component.allCases(for: self.framework).sorted(by: {
                    $0.rawValue < $1.rawValue
                }),
                id: \.self
            ) { component in
                NavigationLink(component.name, value: component)
            }
            .navigationDestination(for: Component.self, destination: { component in
                switch self.framework {
                case .uiKit:
                    EmptyView()

                case .swiftUI:
                    self.swiftUIComponent(component)
                        .navigationBarTitle(component.name)
                }
            })
            .navigationBarTitle(self.framework.name + " Components")
        }
    }

    // MARK: - SwiftUI Components

    @ViewBuilder
    private func swiftUIComponent(_ component: Component) -> some View {
        switch component {
        case .badge: BadgeComponentView()
        case .bottomSheet: BottomSheetComponentView()
        case .button: ButtonComponentView()
        case .checkbox: CheckboxComponentView()
        case .checkboxGroup: CheckboxGroupComponentView()
        case .chip: ChipComponentView()
        case .divider: DividerComponentView()
        case .icon: IconComponentView()
        case .iconButton: IconButtonComponentView()
        case .popover: PopoverComponentView()
        case .progressBar: ProgressBarComponentView()
        case .progressBarIndeterminate: ProgressBarIndeterminateComponentView()
        case .progressTracker: ProgressTrackerComponentView()
        case .radioButton: RadioButtonComponentView()
        case .ratingDisplay: RatingDisplayComponentView()
        case .ratingInput: RatingInputComponentView()
        case .slider: SliderComponentView()
        case .snackbar: SnackbarComponentView()
        case .snackbarPresentation: SnackbarPresentationComponentView()
        case .spinner: SpinnerComponentView()
        case .switch: SwitchComponentView()
        case .tab: TabComponentView()
        case .tag: TagComponentView()
        case .textEditor: TextEditorComponentView()
        case .textField: TextFieldComponentView()
        case .textFieldAddons: TextFieldAddonsComponentView()
        case .textLink: TextLinkComponentView()
        }
    }
}

#Preview {
    ComponentsView(framework: .swiftUI)
}
