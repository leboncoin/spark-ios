//
//  TextFieldViewType.swift
//  SparkTextField
//
//  Created by louis.borlee on 02/04/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

/// A TextField type with its associated callback(s)
@available(*, deprecated, message: "Use SparkTextField instead")
public enum TextFieldViewType {
    case secure(onCommit: () -> Void = {})
    case standard(onEditingChanged: (Bool) -> Void = { _ in }, onCommit: () -> Void = {})
}
