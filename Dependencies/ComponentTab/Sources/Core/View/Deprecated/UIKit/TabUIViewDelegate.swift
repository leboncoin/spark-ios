//
//  TabUIViewDelegate.swift
//  SparkComponentTab
//
//  Created by michael.zimmermann on 10.08.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
/// The delegate to receive segment selected events.
@available(*, deprecated, message: "Use SparkUITab instead")
public protocol TabUIViewDelegate: AnyObject {
    /// This method to receive segment event.
    /// - Parameters:
    /// - index: the index of the segement that is selected.
    /// - sender: the sender of the action.
    /// - note: This is equivalent to setting the action on the TabUIView `addAction(pressedAction, for: .valueChanged)`
    func segmentSelected(index: Int, sender: TabUIView)
}
