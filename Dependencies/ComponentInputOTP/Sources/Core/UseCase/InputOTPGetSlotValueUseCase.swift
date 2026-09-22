//
//  InputOTPGetSlotValueUseCase.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 05/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol InputOTPGetSlotValueUseCaseable {
    func execute(value: String, index: Int) -> String?
}

struct InputOTPGetSlotValueUseCase: InputOTPGetSlotValueUseCaseable {

    // MARK: - Methods

    func execute(value: String, index: Int) -> String? {
        guard index < value.count else { return nil }
        let characterIndex = value.index(value.startIndex, offsetBy: index)
        return String(value[characterIndex])
    }
}
