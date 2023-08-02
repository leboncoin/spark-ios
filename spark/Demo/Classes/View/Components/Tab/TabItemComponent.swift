//
//  TabItemComponent.swift
//  SparkDemo
//
//  Created by michael.zimmermann on 01.08.23.
//  Copyright © 2023 Adevinta. All rights reserved.
//

import Spark
import SparkCore
import SwiftUI

struct TabItemComponent: View {

    // MARK: Properties
    @ObservedObject private var themePublisher = SparkThemePublisher.shared

    var theme: Theme {
        self.themePublisher.theme
    }

    @State private var versionSheetIsPresented = false
    @State var version: ComponentVersion = .uiKit

    @State var intent: TabIntent = .main
    @State var isIntentPresented = false
    @State var showText = CheckboxSelectionState.selected
    @State var showIcon = CheckboxSelectionState.selected
    @State var showBadge = CheckboxSelectionState.unselected
    @State var isSelected = CheckboxSelectionState.unselected
    @State var isEnabled = CheckboxSelectionState.selected

    // MARK: - View
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Configuration")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 6)
                HStack() {
                    Text("Version: ").bold()
                    Button(self.version.name) {
                        self.versionSheetIsPresented = true
                    }
                    .confirmationDialog("Select a version",
                                        isPresented: self.$versionSheetIsPresented) {
                        ForEach(ComponentVersion.allCases, id: \.self) { version in
                            Button(version.name) {
                                self.version = version
                            }
                        }
                    }
                    Spacer()
                }
                HStack() {
                    Text("Intent: ").bold()
                    Button(self.intent.name) {
                        self.isIntentPresented = true
                    }
                    .confirmationDialog("Select an intent", isPresented: self.$isIntentPresented) {
                        ForEach(TabIntent.allCases, id: \.self) { intent in
                            Button(intent.name) {
                                self.intent = intent
                            }
                        }
                    }
                }

                CheckboxView(
                    text: "With Label",
                    checkedImage: DemoIconography.shared.checkmark,
                    theme: theme,
                    state: .enabled,
                    selectionState: self.$showText
                )

                CheckboxView(
                    text: "With Icon",
                    checkedImage: DemoIconography.shared.checkmark,
                    theme: theme,
                    state: .enabled,
                    selectionState: self.$showIcon
                )

                CheckboxView(
                    text: "Show Badge",
                    checkedImage: DemoIconography.shared.checkmark,
                    theme: theme,
                    state: .enabled,
                    selectionState: self.$showBadge
                )

                CheckboxView(
                    text: "Is Selected",
                    checkedImage: DemoIconography.shared.checkmark,
                    theme: theme,
                    state: .enabled,
                    selectionState: self.$isSelected
                )

                CheckboxView(
                    text: "Is Enabled",
                    checkedImage: DemoIconography.shared.checkmark,
                    theme: theme,
                    state: .enabled,
                    selectionState: self.$isEnabled
                )
            }
            .padding(.horizontal, 16)

            VStack(alignment: .leading, spacing: 16) {

                Divider()

                Text("Integration")
                    .font(.title2)
                    .bold()

                if version == .swiftUI {
                    Text("Not available yet!")
                } else {
                    let badge = BadgeUIView(
                        theme: themePublisher.theme,
                        intent: .danger,
                        value: 5,
                        isBorderVisible: false)
                    TabItemUIComponentRepresentableView(
                        theme: self.theme,
                        intent: self.intent,
                        label: self.showText.isSelected ? "Label" : nil,
                        icon: self.showIcon.isSelected ? UIImage(systemName: "fleuron.fill") : nil,
                        badge: self.showBadge.isSelected ? badge : nil,
                        isSelected: self.isSelected.isSelected,
                        isEnabled: self.isEnabled.isSelected
                    )
                }
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .navigationBarTitle(Text("Tab Item"))
    }
}

struct TabItemComponent_Previews: PreviewProvider {
    static var previews: some View {
        TabItemComponent()
    }
}

private extension CheckboxSelectionState {
    var isSelected: Bool {
        return self == .selected
    }
}
