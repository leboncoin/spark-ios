//
//  OtherView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 15/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct OtherView: View {

    // MARK: - Enum

    private enum RedirectionSection: String, CaseIterable, Hashable {
        case devMode
        case featureToggles

        static var allConfiguredCases: [Self] {
            if DemoConfiguration.isDevMode {
                self.allCases
            } else {
                [.featureToggles]
            }
        }

        var redirections: [Redirection] {
            switch self {
            case .devMode: [
                .devModeSwiftUI,
                .devModeUIKit
            ]
            case .featureToggles: [.featureToggles]
            }
        }
    }

    private enum Redirection: String, CaseIterable, Hashable {
        case devModeSwiftUI
        case devModeUIKit
        case featureToggles

        var name: String {
            switch self {
            case .devModeSwiftUI: "SwiftUI"
            case .devModeUIKit: "UIKit"
            case .featureToggles: "Feature Toggles"
            }
        }
    }

    // MARK: - Properties

    private var themes: [DemoThemes.Theme] {
        DemoThemes.shared.themes
    }

    private var appVersion: String? {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }

    private var buildNumber: String? {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }

    // MARK: - View

    var body: some View {
        NavigationStack {
            List {
                Section("Theme") {
                    ForEach(self.themes, id: \.self) { theme in
                        NavigationLink(value: theme) {
                            Text(theme.name)
                                .foregroundColor(.primary)
                        }
                    }
                }

                ForEach(RedirectionSection.allConfiguredCases, id: \.self) { section in
                    Section(section.name) {
                        ForEach(section.redirections, id: \.self) { redirection in
                            NavigationLink(redirection.name, value: redirection)
                        }
                    }
                }

                if let appVersion {
                    Section {
                        HStack {
                            Text("App Version")

                            Spacer()

                            HStack(spacing: 2) {
                                Text(appVersion)
                                if let buildNumber {
                                    Text("(\(buildNumber))")
                                }
                            }
                            .bold()
                        }
                        .font(.caption)
                        .foregroundColor(.secondary)
                    }
                }
            }
            .navigationDestination(for: Redirection.self, destination: { redirection in
                switch redirection {
                case .devModeSwiftUI:
                    DevModeView()
                        .navigationBarTitle(RedirectionSection.devMode.name)
                case .devModeUIKit:
                    DevModeUIViewRepresentable()
                        .navigationBarTitle(RedirectionSection.devMode.name)
                case .featureToggles:
                    FeatureTogglesView()
                        .navigationBarTitle(RedirectionSection.featureToggles.name)
                }
            })
            .navigationDestination(for: DemoThemes.Theme.self) { theme in
                ThemeView(theme: theme.value)
                    .navigationBarTitle(theme.name + " Theme")
            }
            .navigationBarTitle("Other")
        }
    }
}

#Preview {
    OtherView()
}
