//
//  TestError.swift
//  TestingPlaygroundTests
//
//  Created by Shahriar Nasim Nafi on 25/6/22.
//

import Foundation

struct TestError: LocalizedError {
    let message: String
    var errorDescription: String? { message }
}
