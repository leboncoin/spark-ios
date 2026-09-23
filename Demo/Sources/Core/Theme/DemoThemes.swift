//
//  DemoThemes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 31/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

/// Struct with singleton used to manage themes on demo App.
/// By default themes are : *spark* and *sky* (check ``SparkDemoThemes``).
/// To change the themes, you can reset the *shared* static variable with your themes like this on your App class
///
/// Implementation example :
/// ```swift
/// @main
/// struct MyApp: App {
///     init() {
///         DemoThemes.shared = .init(value: YourThemes.self)
///     }
///
///     var body: some Scene {
///         WindowGroup {
///             MainView()
///         }
///     }
/// }
/// ```
///
public struct DemoThemes {

    // MARK: - Properties

    /// Singleton of the DemoThemes.
    ///
    /// Use the ``SparkDemoThemes`` themes by default.
    public static var shared = Self()

    internal let themes: [Theme]
    internal let mainTheme: Theme

    // MARK: - Initialization

    /// Init the demo themes with the implementation of ``DemoTheme``.
    ///
    /// Default is ``SparkDemoThemes``.
    public init<T: DemoTheme>(value: T.Type = SparkDemoThemes.self) {
        self.themes = value.allCases.map {
            .init(name: $0.name, theme: $0.value)
        }

        self.mainTheme = .init(
            name: value.mainTheme.name,
            theme: value.mainTheme.value
        )
    }
}

// MARK: - Sub Model

extension DemoThemes {

    struct Theme: Identifiable, Hashable {

        // MARK: - Properties

        let id: String
        let name: String
        let value: any SparkTheming.Theme

        // MARK: - Initialization

        init(name: String, theme: any SparkTheming.Theme) {
            self.id = name
            self.name = name
            self.value = theme
        }

        // MARK: - Hashable

        static func == (lhs: DemoThemes.Theme, rhs: DemoThemes.Theme) -> Bool {
            lhs.id == rhs.id
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(self.id)
        }
    }
}
