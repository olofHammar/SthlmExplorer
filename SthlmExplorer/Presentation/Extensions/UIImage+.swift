//
//  UIImage+.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-16.
//

import Foundation
import UIKit

extension UIImage {
    /// Adds padding to UIImage.
    func withPadding(x horisontal: CGFloat, y vertical: CGFloat) -> UIImage? {
        let width: CGFloat = size.width + horisontal
        let height: CGFloat = size.height + vertical
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), false, 0)
        let origin: CGPoint = CGPoint(x: (width - size.width) / 2, y: (height - size.height) / 2)
        draw(at: origin)
        let imageWithPadding = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return imageWithPadding
    }
}
