//
//  DisplaySize.swift
//  MapKitApp
//
//  Created by 富澤明大 on 2024/08/14.
//

import Foundation
import UIKit

struct DisplayInfo{
    private static var window: UIWindowScene?{
        return UIApplication.shared.connectedScenes.first as? UIWindowScene
    }
    
    static var screenSize:CGRect{
        return window?.screen.bounds ?? CGRect.zero
    }
    
    static var imageDimension:CGFloat{
        return (screenSize.width / 3) - 1
    }
    
    static var width:CGFloat{
        return screenSize.width
    }
    
    static var height:CGFloat{
        return screenSize.height
    }
}
