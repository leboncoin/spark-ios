//
//  String+InitialExtension.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 03/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

extension String {

    var initial: Self {
        self.first.map(String.init) ?? "?"
    }
}
