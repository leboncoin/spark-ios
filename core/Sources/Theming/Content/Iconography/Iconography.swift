//
//  Iconography.swift
//  SparkCore
//
//  Created by louis.borlee on 23/02/2023.
//

import UIKit
import SwiftUI

public protocol Iconography {
    var account: IconographyAccount { get }
    // TODO: UI question: Account Images?
    var actions: IconographyActions { get }
    var arrows: IconographyArrows { get }
    var calendar: IconographyCalendar { get }
    var contact: IconographyContact { get }
    var categories: IconographyCategories { get }
    var flags: IconographyFlags { get }
    var images: IconographyImages { get }
    var alert: IconographyAlert { get }
    var security: IconographySecurity { get }
    var delivery: IconographyDelivery { get }
    var map: IconographyMap { get }
    var others: IconographyOthers { get }
    // TODO: dev question: Alarm styles?
    var options: IconographyOptions { get }
    var transaction: IconographyTransaction { get }
    var crm: IconographyCRM { get }
    var pro: IconographyPro { get }
    var share: IconographyShare { get }
    var toggle: IconographyToggle { get }
    var user: IconographyUser { get }
}

// MARK: - Style

public protocol IconographyFill {
    var fill: IconographyImage { get }
}

public protocol IconographyOutlined {
    var outlined: IconographyImage { get }
}

public protocol IconographyLeft {
    var left: IconographyImage { get }
}

public protocol IconographyRight {
    var right: IconographyImage { get }
}

public protocol IconographyUp {
    var up: IconographyImage { get }
}

public protocol IconographyDown {
    var down: IconographyImage { get }
}

public protocol IconographyVertical {
    var vertical: IconographyImage { get }
}

public protocol IconographyHorizontal {
    var horizontal: IconographyImage { get }
}

// MARK: - Image

public protocol IconographyImage {
    var uiImage: UIImage? { get }
    var swiftUIImage: Image { get }
}
