//
//  TabStateEnvironmentObject.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

class TabState<SelectionValue>: ObservableObject where SelectionValue: Hashable {

    // MARK: - Properties

     @Published var selection: SelectionValue
     @Published var showAccessibilityList: Bool = false

    // MARK: - Initialization

    init(selection: SelectionValue) {
        self.selection = selection
    }
 }
