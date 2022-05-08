//
//  UIImageCompressor.swift
//  Library System
//
//  Created by Alamsyah Oktavian on 08/05/22.
//

import Foundation
import SwiftUI

extension UIImage {
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }

    func compressedJPEG(_ jpegQuality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
}
