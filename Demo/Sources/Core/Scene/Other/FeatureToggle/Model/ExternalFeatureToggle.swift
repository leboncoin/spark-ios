//
//  ExternalFeatureToggle.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// MARK: - Model

public struct ExternalFeatureToggle: Identifiable {

    // MARK: - Type Alias

    public typealias OnChangeCallback = (Bool) -> Void

    // MARK: - Properties

    public let id = UUID()
    let name: String
    let description: String
    var isEnabled: Bool
    var onChange: OnChangeCallback?

    // MARK: - Hashable

    static func == (lhs: ExternalFeatureToggle, rhs: ExternalFeatureToggle) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.description == rhs.description &&
            lhs.isEnabled == rhs.isEnabled
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(self.name)
        hasher.combine(self.description)
        hasher.combine(self.isEnabled)
    }
}

// MARK: - Observable Object

public final class ExternalFeatureToggles: ObservableObject {

    // MARK: - Properties

    public static let shared = ExternalFeatureToggles()

    @Published var items: [ExternalFeatureToggle] = []

    // MARK: - Initialization

    private init() {}

    // MARK: - Methods

    public func addToggle(
        name: String,
        description: String,
        isEnabled: Bool = false,
        onChange: ExternalFeatureToggle.OnChangeCallback? = nil
    ) {
        let toggle = ExternalFeatureToggle(
            name: name,
            description: description,
            isEnabled: isEnabled,
            onChange: onChange
        )
        self.items.append(toggle)
    }

    public func toggle(name: String) {
        guard let index = self.items.firstIndex(where: { $0.name == name }) else {
            return
        }
        self.items[index].isEnabled.toggle()

        // Call the onChange callback with the new value
        self.items[index].onChange?(self.items[index].isEnabled)
    }
}
