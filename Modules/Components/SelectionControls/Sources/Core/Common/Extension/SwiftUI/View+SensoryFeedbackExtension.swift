//
//  View+SensoryFeedbackExtension.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 29/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension View {

    func sparkSensoryFeedback(
        trigger: some Equatable
    ) -> some View {
        self.sparkSensoryFeedback(.selection, trigger: trigger)
    }
}
