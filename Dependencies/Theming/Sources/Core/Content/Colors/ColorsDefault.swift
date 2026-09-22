//
//  ColorsDefault.swift
//  SparkTheming
//
//  Created by louis.borlee on 23/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI
import UIKit

public struct ColorsDefault: Colors {

    // MARK: - Properties

    public let main: any ColorsMain
    public let support: any ColorsSupport
    public let accent: any ColorsAccent
    public let base: any ColorsBase
    public let feedback: any ColorsFeedback
    public let states: any ColorsStates
    public let ai: any ColorsAI
    public let focus: any ColorsFocus
    public let new: any ColorsNew
    public let business: any ColorsBusiness
    public let service: any ColorsService

    // MARK: - Initialization

    public init(
        main: any ColorsMain,
        support: any ColorsSupport,
        accent: any ColorsAccent,
        base: any ColorsBase,
        feedback: any ColorsFeedback,
        states: any ColorsStates,
        ai: any ColorsAI,
        focus: any ColorsFocus,
        new: any ColorsNew,
        business: any ColorsBusiness,
        service: any ColorsService
    ) {
        self.main = main
        self.support = support
        self.accent = accent
        self.base = base
        self.feedback = feedback
        self.states = states
        self.ai = ai
        self.focus = focus
        self.new = new
        self.business = business
        self.service = service
    }
}
