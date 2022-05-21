//
//  main.swift
//  TestingPlayground
//
//  Created by Shahriar Nasim Nafi on 21/5/22.
//

import UIKit

//This code tries to find a class named TestingAppDelegate outside of any names- pace. If we’re running tests, the test bundle will be present, so the class will be there. But on regular runs, the test bundle will be missing, so NSClassFrom- String() will return nil. Then the nil-coalescing operator ?? will fall back to using the regular AppDelegate.


let appDelegateClass: AnyClass = NSClassFromString("TestingAppDelegate") ?? AppDelegate.self
UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(appDelegateClass))
