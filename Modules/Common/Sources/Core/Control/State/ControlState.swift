//
//  ControlState.swift
//  SparkCommon
//
//  Created by robin.lemaire on 23/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

/// Constants describing the state of a Spark control.
@available(*, deprecated, message: "Only used on deprecated button. Remove ASAP (13/03/2026")
@frozen public enum ControlState: CaseIterable, Equatable {
    /// The normal, or default, state of a control where the control is enabled but neither selected nor highlighted.
    case normal
    /// The highlighted state of a control.
    case highlighted
    /// The disabled state of a control.
    case disabled
    /// The selected state of a control.
    case selected
}
