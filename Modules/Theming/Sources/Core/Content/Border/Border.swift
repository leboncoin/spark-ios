//
//  Border.swift
//  SparkTheming
//
//  Created by robin.lemaire on 28/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
public protocol Border: Hashable, Equatable {
    var width: any BorderWidth { get }
    var radius: any BorderRadius { get }
}

// MARK: - Hashable & Equatable

public extension Border {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.width)
        hasher.combine(self.radius)
    }

    func equals(_ other: any Border) -> Bool {
        return self.width.equals(other.width) &&
        self.radius.equals(other.radius)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}
