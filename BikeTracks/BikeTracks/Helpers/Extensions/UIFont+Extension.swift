//
//  UIFont+Extension.swift
//  BikeTracks
//
//  Created by Viacheslav Markov on 23.10.2023.
//

import UIKit

 extension UIFont {
    enum FontType: String {
        case black = "Montserrat-Black"
        case bold = "Montserrat-Bold"
        case extraBold = "Montserrat-ExtraBold"
        case regular = "Montserrat-Regular"
        case semiBold = "Montserrat-SemiBold"
    }

    static func customFont(
        type: FontType,
        size: CGFloat
    ) -> UIFont {
        UIFont(name: type.rawValue, size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
}
