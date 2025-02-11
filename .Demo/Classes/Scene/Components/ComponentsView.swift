//
//  ComponentsView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 15/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct ComponentsView: View {

    // MARK: - Properties

    let framework: Framework
    @State private var familly: Familly = .all
    @State private var searchText = ""

    var searchResults: [Component] {
        let allCases = Component.allCases(
            for: self.framework,
            familly: self.familly
        )

        let filteredResults = if self.searchText.isEmpty {
            allCases
        } else {
            allCases.filter {
                $0.name.localizedLowercase.contains(self.searchText.localizedLowercase) ||
                $0.familly.name.localizedLowercase.contains(self.searchText.localizedLowercase)
            }
        }

        return filteredResults.sorted(by: { $0.rawValue < $1.rawValue })
    }

    // MARK: - View

    var body: some View {
        NavigationStack {
            List(self.searchResults, id: \.self) { component in
                NavigationLink(value: component) {
                    VStack(alignment: .leading) {
                        Text(component.name)
                            .font(.body)
                        Text(component.familly.name)
                            .font(.footnote)
                            .foregroundStyle(.gray)
                            .italic()
                    }
                }
            }
            .navigationDestination(for: Component.self, destination: { component in
                switch self.framework {
                case .uiKit:
                    self.uiKitComponent(component)
                        .background(Color(.systemGroupedBackground))
                        .navigationBarTitle(component.name)

                case .swiftUI:
                    self.swiftUIComponent(component)
                        .navigationBarTitle(component.name)
                }
            })
            .navigationBarTitle(self.framework.name + " Components")
            .searchable(text: self.$searchText)
            .toolbar {
                Menu("Settings", systemImage: "slider.horizontal.3") {
                    Picker("Select the familly of the components", selection: self.$familly) {
                        ForEach(Familly.allCases, id: \.rawValue) { familly in
                            Text(familly.name)
                                .tag(familly)
                        }
                    }
                }
            }
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
        case .formField: FormFieldComponentView()
        case .icon: IconComponentView()
        case .iconButton: IconButtonComponentView()
        case .microAnimation: MicroAnimationComponentView()
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

    // MARK: - UIKit Components

    @ViewBuilder
    private func uiKitComponent(_ component: Component) -> some View {
        switch component {
        case .tag: TagComponentUIViewController()
        case .textEditor: TextEditorComponentUIViewController()
        case .textField: TextFieldComponentUIViewController()
        case .textFieldAddons: TextFieldAddonsComponentUIViewController()
        case .textLink: TextLinkComponentUIViewController()
        default: EmptyView()
        }
    }
}

// MARK: - Familly

extension ComponentsView {
    enum Familly: String, CaseIterable, Hashable {
        case all
        case action
        case dataDisplay
        case dataInput
        case indicator
        case navigation
        case other
        case overlays
    }
}

// MARK: - Components

extension ComponentsView {
    enum Component: String, CaseIterable, Hashable {
        case badge
        case bottomSheet
        case button
        case checkbox
        case checkboxGroup
        case chip
        case divider
        case formField
        case icon
        case iconButton
        case microAnimation
        case popover
        case progressBar
        case progressBarIndeterminate
        case progressTracker
        case radioButton
        case ratingDisplay
        case ratingInput
        case slider
        case snackbar
        case snackbarPresentation
        case spinner
        case `switch`
        case tab
        case tag
        case textEditor
        case textField
        case textFieldAddons
        case textLink

        // MARK: - Properties

        var familly: Familly {
            switch self {
            case .badge: .indicator
            case .bottomSheet: .overlays
            case .button: .action
            case .checkbox: .dataInput
            case .checkboxGroup: .dataInput
            case .chip: .dataInput
            case .divider: .dataDisplay
            case .formField: .dataInput
            case .icon: .dataDisplay
            case .iconButton: .action
            case .microAnimation: .other
            case .popover: .overlays
            case .progressBar: .indicator
            case .progressBarIndeterminate: .indicator
            case .progressTracker: .indicator
            case .radioButton: .dataInput
            case .ratingDisplay: .dataDisplay
            case .ratingInput: .dataInput
            case .slider: .dataInput
            case .snackbar: .overlays
            case .snackbarPresentation: .overlays
            case .spinner: .indicator
            case .switch: .dataInput
            case .tab: .navigation
            case .tag: .dataDisplay
            case .textEditor: .dataInput
            case .textField: .dataInput
            case .textFieldAddons: .dataInput
            case .textLink: .action
            }
        }

        static func allCases(for framework: Framework, familly: Familly) -> [Self] {
            let values: [Self] = switch framework {
            case .uiKit: [ // TODO: replace to allCases when migration is over
                .tag,
                .textEditor,
                .textField,
                .textFieldAddons,
                .textLink
            ]
            case .swiftUI:
                self.allCases
            }

            return values.filter {
                familly == .all || $0.familly == familly
            }
        }
    }
}

#Preview {
    ComponentsView(framework: .swiftUI)
}
