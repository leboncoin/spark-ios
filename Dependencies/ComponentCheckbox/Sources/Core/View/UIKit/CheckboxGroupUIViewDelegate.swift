//
//  CheckboxGroupUIViewDelegate.swift
//  SparkComponentCheckbox
//
//  Created by michael.zimmermann on 13.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

/// The checkbox groupe delegate informs about a changes to any of the checkbox selection state.
// sourcery: AutoMockable
@available(*, deprecated, message: "Not used anymore on the new SparkUICheckboxGroup")
public protocol CheckboxGroupUIViewDelegate: AnyObject {
    /// The checkbox group selection was changed.
    /// - Parameters:
    ///   - _: The updated checkbox group.
    ///   - didChangeSelection: It will return items.

    func checkboxGroup(_ checkboxGroup: CheckboxGroupUIView, didChangeSelection states: [any CheckboxGroupItemProtocol])
}
