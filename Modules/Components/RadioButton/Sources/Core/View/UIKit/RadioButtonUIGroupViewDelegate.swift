//
//  RadioButtonUIGroupViewDelegate.swift
//  SparkRadioButton
//
//  Created by michael.zimmermann on 14.06.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

/// Delegate that receives changes of radio button ui group view
@available(*, deprecated, message: "Not used anymore on the new SparkUIRadioGroup")
public protocol RadioButtonUIGroupViewDelegate: AnyObject {
    func radioButtonGroup<ID: Hashable & Equatable & CustomStringConvertible>(_ radioButtonGroup: some RadioButtonUIGroupView<ID>, didChangeSelection item: ID)
}
