//
//  UIView+ViewControllerExtension.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 06/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit

extension UIView {

    var parentViewController: UIViewController? {
        var responder: UIResponder? = self
        while let nextResponder = responder?.next {
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            responder = nextResponder
        }
        return nil
    }
}
