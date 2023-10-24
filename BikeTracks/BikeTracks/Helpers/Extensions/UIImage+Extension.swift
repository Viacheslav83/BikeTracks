//
//  UIImage+Extension.swift
//  BikeTracks
//
//  Created by Viacheslav Markov on 24.10.2023.
//

import UIKit

extension UIImage {
    static func image(
        name: ImageNameType,
        renderingMode: RenderingMode = .alwaysTemplate
    ) -> UIImage? {
        .init(named: name.rawValue)?
        .withRenderingMode(renderingMode)
    }
}
