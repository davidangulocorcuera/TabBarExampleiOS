//
//  Style.swift
//  Tab_bar_example
//
//  Created by Biolizard on 31/10/2018.
//  Copyright © 2018 Biolizard. All rights reserved.
//

import UIKit
import Foundation
class Style{
    class func customize(){
        UINavigationBar.appearance().barTintColor = ColorStyle.navigationBarTintColor()
        UITabBar.appearance().barTintColor =  ColorStyle.navigationBarTintColor()
        UINavigationBar.appearance().titleTextAttributes =
            [NSAttributedString.Key.foregroundColor : UIColor.white, kCTFontAttributeName: UIFont(name: "PoorStory-Regular", size: 26.0)] as? [NSAttributedString.Key : Any]
        
        UITabBarItem.appearance().setTitleTextAttributes([kCTFontAttributeName as NSAttributedString.Key : UIFont(name: "PoorStory-Regular", size: 20.0)!],
                                                         for: .normal)
        
        UITabBarItem.appearance().setTitleTextAttributes([kCTFontAttributeName as NSAttributedString.Key : UIFont(name: "PoorStory-Regular", size: 20.0)!],
                                                         for: .selected)
        UITabBar.appearance().tintColor = UIColor.white
        
    }
}
