//
//  MainView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 15/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

 public struct MainView: View {

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

            // Other
            OtherView()
                .tabItem {
                    Image(systemName: "ellipsis.circle")
                    Text("Other")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
