//
//  TestableViewController.swift
//  TestingPlayground
//
//  Created by Shahriar Nasim Nafi on 22/6/22.
//

import UIKit

// We can't use this for a view controller that comes from a storyboard.
// This works for view controllers that are code-based or XIB-based
private class TestableViewController: ViewController {
    var presentCallCount = 0
    var presentArgsViewController: [UIViewController] = []
    var presentArgsAnimated: [Bool] = []
    var presentArgsClosure: [(() -> Void)?] = []
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentCallCount += 1
        presentArgsViewController.append(viewControllerToPresent)
        presentArgsAnimated.append(flag)
        presentArgsClosure.append(completion)
    }
}
