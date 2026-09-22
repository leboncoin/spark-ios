//
//  String+EmptyExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 07/05/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

extension String {

    var nilIfEmpty: Self? {
        self.isEmpty ? nil : self
    }
}
