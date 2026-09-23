//
//  ComponentsView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 15/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct ComponentsView: View {

    // MARK: - Properties

    let framework: Framework
    @State private var accessibilityStatus: AccessibilityStatus = .all
    @State private var familly: Familly = .all
    @State private var searchText = ""
    @AppStorage("latest_component", store: .init(suiteName: "spark.ios.latest_component")) var latestComponent: Component?

    var searchResults: [Component] {
        let allCases = Component.allCases(
            for: self.framework,
            familly: self.familly,
            accessibilityStatus: self.accessibilityStatus
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
            List {
                if let latestComponent {
                    Section("Latest component") {
                        self.listRow(component: latestComponent)
                    }
                }

                Section {
                    ForEach(self.searchResults, id: \.self) { component in
                        self.listRow(component: component)
                    }
                } header: {
                    Text("All components")
                } footer: {
                    Text("\(self.searchResults.count) components")
                }

                if DemoConfiguration.isDevMode {
                    Section {
                        NavigationLink("Dev Mode") {
                            switch self.framework {
                            case .uiKit:
                                DevModeUIViewRepresentable()
                                    .navigationBarTitle("Dev Mode")

                            case .swiftUI:
                                DevModeView()
                                    .navigationBarTitle("Dev Mode")
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: Component.self, destination: { component in
                switch self.framework {
                case .uiKit:
                    component.uiKitComponent
                        .background(Color(.systemGroupedBackground))
                        .navigationBarTitle(component.name)
                        .onAppear() {
                            self.latestComponent = component
                        }

                case .swiftUI:
                    component.swiftUIComponent
                        .navigationBarTitle(component.name)
                        .onAppear() {
                            self.latestComponent = component
                        }
                }
            })
            .navigationBarTitle(self.framework.name)
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: self.$searchText)
            .toolbar {
                Menu("Settings", systemImage: "slider.horizontal.3") {
                    Picker("Select the familly of the components", selection: self.$familly) {
                        ForEach(Familly.allCases, id: \.rawValue) { familly in
                            Text(familly.name)
                                .tag(familly)
                        }
                    }

                    ControlGroup {
                        ForEach(AccessibilityStatus.allCases.filter { $0 != .none }, id: \.rawValue) { status in
                            Button(
                                status.name,
                                systemImage: status == self.accessibilityStatus ? "accessibility.fill" : "accessibility"
                            ) {
                                self.accessibilityStatus = status
                            }
                            .tint(status.color)
                        }
                    }
                }
            }
        }
    }

    // MARK: - Row View

    private func listRow(component: Component) -> some View {
        NavigationLink(value: component) {
            HStack(alignment: .bottom) {

                component.illustrationView
                    .frame(width: 100, height: 100)

                VStack(alignment: .leading, spacing: .small) {

                    Text(component.name)
                        .font(.title2)
                        .bold()
                        .foregroundStyle(Color.level1)

                    HStack {
                        Text(component.familly.name)
                            .font(.footnote)
                            .italic()
                            .padding(.vertical, 2)
                            .padding(.horizontal, 4)
                            .background {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.level1)
                            }

                        if component.accessibilityStatus.isAccessibility {
                            Image(systemName: "accessibility")
                                .foregroundColor(component.accessibilityStatus.color)
                        }
                    }
                }
            }
            .foregroundStyle(.background)
        }
    }
}

#Preview {
    ComponentsView(framework: .swiftUI)
}
