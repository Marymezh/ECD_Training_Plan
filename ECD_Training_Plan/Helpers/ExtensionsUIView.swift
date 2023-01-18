//
//  ExtensionsUIView.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 18/1/23.
//


import Foundation
import UIKit

extension UIView {
    func toAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
