//
//  DemoApp.swift
//  SparkDemo
//
//  Created by robin.lemaire on 14/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

// TODO: retester les TextField et textInput après avoir mis le thème dans l'init en Swiftui

import SwiftUI
@_exported import SparkDemo

@main
struct DemoApp: App {

    // MARK: - Initialization

    init() {
        // Configurations
        DemoConfiguration.load()
        SparkConfiguration.load()
    }

    // MARK: - View

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
