//
//  UIApplication.swift
//  Podcasts
//
//  Created by Kenny Ho on 7/16/18.
//  Copyright © 2018 Kenny Ho. All rights reserved.
//

import UIKit

extension UIApplication {
    static func mainTabBarController() -> MainTabBarController? {
        //UIApplication.shared.keyWindow?.rootViewController as? MainTabBarController
        
        return shared.keyWindow?.rootViewController as? MainTabBarController
    }
}
