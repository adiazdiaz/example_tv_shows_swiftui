//
//  UINavigationController.swift
//  ExampleTVShowsSwiftUI
//
//  Created by Alberto Díaz Díaz on 3/12/20.
//

import Foundation
import UIKit

extension UINavigationController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
}
