//
//  MainView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 15/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

/// The **Main view** contains *TabBar* with **SwiftUI**, **UIKit** and **Other** entries..
/// It's possible to have an another entry. In this case, use the ``MainView/init(otherTab:)
///
/// Implementation example with an **another entry** :
/// ```swift
/// @main
/// struct MyView: View {
///
///     var body: some Scene {
///         MainView {
///             YourTabItemView()
///                 .tabItem {
///                     Image(systemName: "the system icon")
///                     Text("The tab item name")
///                 }
///         }
///     }
/// }
/// ```
///
public struct MainView<OtherTab>: View where OtherTab: View {

     // MARK: - Properties

     @ViewBuilder private let otherTab: (() -> OtherTab)?

     // MARK: - Initialization

    /// Init the main view.
    ///
    /// Implementation example :
    /// ```swift
    /// @main
    /// struct MyView: View {
    ///
    ///     var body: some Scene {
    ///         MainView()
    ///     }
    /// }
    /// ```
    ///
     public init() where OtherTab == EmptyView {
         self.otherTab = nil
     }

     /// Init the main view with a custom other tab.
     /// This tab will be between the *UIKit componants** and the **other** tab.
     ///
     /// Implementation example :
     /// ```swift
     /// @main
     /// struct MyView: View {
     ///
     ///     var body: some Scene {
     ///         MainView {
     ///             YourTabItemView()
     ///                 .tabItem {
     ///                     Image(systemName: "the system icon")
     ///                     Text("The tab item name")
     ///                 }
     ///         }
     ///     }
     /// }
     /// ```
     ///
     public init(@ViewBuilder otherTab: @escaping () -> OtherTab) {
         self.otherTab = otherTab
     }

    // MARK: - View

    public var body: some View {
        TabView {
            // Components
            ForEach(Framework.allCases, id: \.rawValue) { framework in
                ComponentsView(framework: framework)
                    .tabItem {
                        Image(systemName: framework.icon)
                        Text(framework.name)
                    }
            }

            // Icon
            IconographyView()
                .tabItem {
                    Image(systemName: "photo.circle.fill")
                    Text("Icons")
                }

            // Other Tab (used by SparkKit)
            self.otherTab?()

            // Other
            OtherView()
                .tabItem {
                    Image(systemName: "ellipsis.circle")
                    Text("Other")
                }
        }
        .tint(Color.level1)
    }
}
