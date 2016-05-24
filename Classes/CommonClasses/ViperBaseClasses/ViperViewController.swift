//
//  ViperViewController.swift
//  WendysTeam
//
//  Created by Maksim Bazarov on 26.04.16.
//  Copyright © 2016 WendysTeam. All rights reserved.
//

import UIKit

protocol ViperViewInput: class
{
    func waitMode(on: Bool)
}


class ViperViewController: UIViewController
{

    var waitView = UIView()
    var spinner = UIActivityIndicatorView()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        waitView.addSubview(spinner)
        waitView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        view.addSubview(waitView)
        waitView.hidden = true

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(_keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(_keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)
    }


    deinit
    {
        print("\(#file) deinited")
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    // MARK: Abstract
    func keyboardWillShow(kb: KeyboardParameters)
    {
    }

    func keyboardWillHide(kb: KeyboardParameters)
    {
    }

    // MARK: Private
    func _keyboardWillShow(notification: NSNotification)
    {
        let n = KeyboardParameters(notification: notification)
        keyboardWillShow(n)
    }

    func _keyboardWillHide(notification: NSNotification)
    {
        let n = KeyboardParameters(notification: notification)
        keyboardWillHide(n)
    }


    // MARK : - Wait mode


    func waitMode(on: Bool)
    {

        DispatchToMainQueue { 
            if on {
                self.setupControllerToWaitMode()
            } else {
                self.setupControllerToRegularMode()
            }
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        waitView.frame = view.frame
        spinner.center = waitView.center

    }

    func setupControllerToWaitMode()
    {
        waitView.frame = view.frame
        spinner.center = waitView.center
        spinner.startAnimating()
        waitView.hidden = false
        
    }

    func setupControllerToRegularMode()
    {
        spinner.stopAnimating()
        waitView.hidden = true

    }
}

