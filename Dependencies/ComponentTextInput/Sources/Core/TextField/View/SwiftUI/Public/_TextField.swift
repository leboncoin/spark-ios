//
//  _TextField.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 25/07/2025.
//

import SwiftUI

/// This protocol inherits from View and it is used only by ``SparkTextField``.
/// **Please, do not use it elsewhere.**
public protocol _TextField: View {

    func isEmptyContent() -> Bool
    func clearAction()
}

public extension _TextField {

    func isEmptyContent() -> Bool { false }
    func clearAction() { }
}
