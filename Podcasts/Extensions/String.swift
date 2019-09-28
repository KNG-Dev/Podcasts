//
//  String.swift
//  Podcasts
//
//  Created by Kenny Ho on 7/29/18.
//  Copyright © 2018 Kenny Ho. All rights reserved.
//

import UIKit

extension String {
    func toSecureHTTPS() -> String {
        return self.contains("https") ? self : self.replacingOccurrences(of: "http", with: "https")
        
    }
}
