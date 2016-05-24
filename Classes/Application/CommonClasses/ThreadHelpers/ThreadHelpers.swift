//
//  ThreadHelpers.swift
//  WendysTeam
//
//  Created by Maksim Bazarov on 27.03.16.
//  Copyright © 2016 WendysTeam. All rights reserved.
//

import Foundation

func DispatchToMainQueue(code:()->())
{
    if NSThread.isMainThread()
    {
        code();
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), {
            code()
        })
    }
    
}

func DispatchToBackground(code: ()->()) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) {
        code()
    }
}
