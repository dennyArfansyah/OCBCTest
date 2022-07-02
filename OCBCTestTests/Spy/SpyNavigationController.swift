//
//  SpyNavigationController.swift
//  OCBCTestTests
//
//  Created by Denny Arfansyah on 02/07/22.
//

import UIKit

class SpyNavigationController: UINavigationController {
    
    var pushedViewController: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
        super.pushViewController(viewController, animated: true)
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        pushedViewController = nil
        return super.popViewController(animated: animated)
    }
}
