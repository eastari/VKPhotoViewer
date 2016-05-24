//
// Created by Maksim Bazarov on 26.04.16.
// Copyright (c) 2016 WendysTeam. All rights reserved.
//

import UIKit

class KeyboardParameters
{
    var animationCurve = UIViewAnimationOptions(rawValue: 0)
    var animationDuration: Double = 0

    var frameBegin: CGRect = CGRectZero
    var frameEnd: CGRect = CGRectZero


    var isKeyboardLocal: Bool = false

    init(notification n: NSNotification)
    {
        guard let info = n.userInfo else {
            return
        }

        if let curve = info[UIKeyboardAnimationCurveUserInfoKey] as? UInt {
            self.animationCurve = UIViewAnimationOptions(rawValue: curve)
        }

        if let duration = info[UIKeyboardAnimationDurationUserInfoKey] as? Double {
            self.animationDuration = duration
        }

        if let frameBegin = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.frameBegin = frameBegin
        }
        if let frameEnd = (info[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue() {
            self.frameEnd = frameEnd
        }
        
        if #available(iOS 9.0, *) {
            if let isLocal = info[UIKeyboardIsLocalUserInfoKey] as? Bool {
                self.isKeyboardLocal = isLocal
            }
        } else {
            // Fallback on earlier versions
        }
    }
}
