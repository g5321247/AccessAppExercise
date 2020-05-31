//
//  UIViewExtension.swift
//  AccessAppExercise
//
//  Created by George Liu on 2020/5/31.
//  Copyright © 2020 George Liu. All rights reserved.
//

import UIKit

extension UIView {
    func setCorner(radius: CGFloat, clipsToBounds: Bool = false) {
        layer.cornerRadius = radius
        self.clipsToBounds = clipsToBounds
    }

    func setBoarder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }

    func setShadow(
        opacity: Float,
        radius: CGFloat,
        color: UIColor,
        offset: CGSize
    ) {
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
    }
}
