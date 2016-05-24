//
//  ViperRouter.swift
//  WendysTeam
//
//  Created by Maksim Bazarov on 24.04.16.
//  Copyright © 2016 WendysTeam. All rights reserved.
//

import UIKit

protocol ViperRouterInput {
    
    func presentController(vc: UIViewController)
    func present(inNavigationStack nc: UINavigationController)
    func popCurrentScreen()
    func popToRoot()
    func present(asChildOf vc: UIViewController, navigationController nc: UINavigationController) ->UIViewController?
    
}


class ViperRouter : ViperRouterInput
{
    weak var viewController: UIViewController?
    var navigationController : UINavigationController?
    
    // MARK: Window
    
    
    // MARK: Navigation
    
    func presentController(vc: UIViewController)
    {
        if let nc = navigationController where nc.topViewController != vc
        {
            nc.pushViewController(vc, animated: true)
        }
    }
    
    func present(inNavigationStack nc: UINavigationController)
    {
        if let vc = viewController where nc.topViewController != vc
        {
            navigationController = nc
            nc.pushViewController(vc, animated: true)
        }
    }
    
    func popCurrentScreen()
    {
        if let nc = navigationController {
            nc.popViewControllerAnimated(true)
        }
    }
    
    func popToRoot()
    {
        if let nc = navigationController {
            nc.popToRootViewControllerAnimated(true)
        }
    }
    
    
    
    // MARK: Child
    func present(asChildOf vc: UIViewController, navigationController nc: UINavigationController) -> UIViewController? {
        
        if let controller = viewController {
            navigationController = nc
            return controller
        }
        
        return nil
    }
    
    
    
}
