//
// Created by Maksim Bazarov on 08.04.16.
// Copyright (c) 2016 WendysTeam. All rights reserved.
//

import UIKit

protocol VPRNavigatablePresenter
{
    weak var navigationController: UINavigationController? {get set}

    func presentController(vc: UIViewController, fromNavigationController: UINavigationController , animated: Bool)
    func popCurrentController(animated animated: Bool)
    func popToRootController(animated animated: Bool)

}

extension VPRNavigatablePresenter
{
    mutating func presentController(vc: UIViewController, fromNavigationController: UINavigationController , animated: Bool)
    {
        navigationController = fromNavigationController
        
        if let nc = navigationController where nc.topViewController != vc {
            nc.pushViewController(vc, animated: animated)
        }
    }

    func popCurrentController(animated animated: Bool)
    {
        if let nc = navigationController {
            nc.popViewControllerAnimated(animated)
        }
    }

    func popToRootController(animated animated: Bool)
    {
        if let nc = navigationController {
            nc.popToRootViewControllerAnimated(animated)
        }
    }

}
