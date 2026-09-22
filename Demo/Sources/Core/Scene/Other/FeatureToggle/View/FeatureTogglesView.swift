//
//  FeatureTogglesView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 06/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

struct FeatureTogglesView: View {

    // MARK: - Properties

    @ObservedObject private var featureToggle = FeatureToggle()
    @ObservedObject private var featureToggles = ExternalFeatureToggles.shared

    // MARK: - Enum

    private enum Properties: String, CaseIterable, Hashable {
        case appearance
        case rebranding
        case visualIdentification

        var description: String {
            return switch self {
            case .appearance: "Replace some properties on components (Intent, variant, ...) to the new appearance property."
            case .rebranding: "Use the rebranded tokens/components/...."
            case .visualIdentification: "Apply a colored background on Spark components (the colors differ between UIKit and SwiftUI)."
            }
        }
    }

    // MARK: - View

    var body: some View {
        List {
            // Internal Feature Toggles Section
            ForEach(Properties.allCases, id: \.self) { property in

                let isEnabled = switch property {
                case .appearance: self.featureToggle.appearance
                case .rebranding: self.featureToggle.rebranding
                case .visualIdentification: self.featureToggle.visualIdentification
                }

                self.button(
                    name: property.name,
                    description: property.description,
                    isEnabled: isEnabled
                ) {
                    switch property {
                    case .appearance:
                        self.featureToggle.appearance.toggle()
                    case .rebranding:
                        self.featureToggle.rebranding.toggle()
                    case .visualIdentification:
                        self.featureToggle.visualIdentification.toggle()
                    }
                }
            }

            // External Feature Toggles Section
            if !self.featureToggles.items.isEmpty {
                Section(header: Text("External Toggles")) {
                    ForEach(self.featureToggles.items) { toggle in

                        self.button(
                            name: toggle.name,
                            description: toggle.description,
                            isEnabled: toggle.isEnabled
                        ) {
                            self.featureToggles.toggle(name: toggle.name)
                        }
                    }
                }
            }
        }
    }

    private func button(
        name: String,
        description: String,
        isEnabled: Bool,
        action: @escaping @MainActor () -> Void
    ) -> some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: .xSmall) {
                HStack {
                    Text(name)
                        .foregroundColor(.primary)

                    Spacer()

                    if isEnabled {
                        Image(systemName: "checkmark")
                    }
                }

                Text(description)
                    .foregroundColor(.gray)
                    .italic()
            }
        }
    }
}
