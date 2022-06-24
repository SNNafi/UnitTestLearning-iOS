//
//  SpyURLSession.swift
//  TestingPlaygroundTests
//
//  Created by Shahriar Nasim Nafi on 24/6/22.
//

import Foundation
@testable import TestingPlayground
import XCTest

class SpyURLSession: URLSessionProtocol {

    var dataTaskCallCount = 0
    var dataTaskArgsRequest: [URLRequest] = []
    var dataTaskArgsCompletionHandler: [(Data?, URLResponse?, Error?) -> Void] = []
    
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        dataTaskCallCount+=1
        dataTaskArgsRequest.append(request)
        dataTaskArgsCompletionHandler.append(completionHandler)
        return DummyURLSessionDataTask()
    }
    
    
}

private class DummyURLSessionDataTask: URLSessionDataTask {
    override func resume() { }
}
