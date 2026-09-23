//
//  Colors.swift
//  SparkTheming
//
//  Created by louis.borlee on 23/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - Colors

// sourcery: AutoMockable
public protocol Colors: Hashable, Equatable {
    var main: any ColorsMain { get }
    var support: any ColorsSupport { get }
    var accent: any ColorsAccent { get }
    var base: any ColorsBase { get }
    var feedback: any ColorsFeedback { get }
    var states: any ColorsStates { get }
    var ai: any ColorsAI { get }
    var focus: any ColorsFocus { get }
    var new: any ColorsNew { get }
    var business: any ColorsBusiness { get }
    var service: any ColorsService { get }
}

// MARK: - Hashable & Equatable

public extension Colors {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.main)
        hasher.combine(self.support)
        hasher.combine(self.accent)
        hasher.combine(self.base)
        hasher.combine(self.feedback)
        hasher.combine(self.states)
        hasher.combine(self.ai)
        hasher.combine(self.focus)
        hasher.combine(self.new)
        hasher.combine(self.business)
        hasher.combine(self.service)
    }

    func equals(_ other: any Colors) -> Bool {
        return self.main.equals(other.main) &&
        self.support.equals(other.support) &&
        self.accent.equals(other.accent) &&
        self.base.equals(other.base) &&
        self.feedback.equals(other.feedback) &&
        self.states.equals(other.states) &&
        self.ai.equals(other.ai) &&
        self.focus.equals(other.focus) &&
        self.new.equals(other.new) &&
        self.business.equals(other.business) &&
        self.service.equals(other.service)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}
