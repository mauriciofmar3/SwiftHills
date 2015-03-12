//
//  UIImage+Resize.swift
//  SwiftHills
//
//  Created by Mauricio Bell'Albero on 3/11/15.
//  Copyright (c) 2015 StoryTree. All rights reserved.
//

import UIKit

extension UIImage {
    class func imageWithImage(image: UIImage, newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
