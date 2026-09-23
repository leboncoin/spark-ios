//
//  View+EmptyViewExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 11/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

public extension View {

    /// Get is the view is an EmptyView
    var isEmptyView: Bool {
        self is EmptyView
    }
}
