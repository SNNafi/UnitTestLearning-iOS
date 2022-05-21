//
//  TestHelpers.swift
//  TestingPlaygroundTests
//
//  Created by Shahriar Nasim Nafi on 22/5/22.
//

import UIKit

func tap(_ button: UIButton) {
    button.sendActions(for: .touchUpInside)
}

func tap(_ button: UIBarButtonItem) {
    _ = button.target?.perform(button.action, with: nil)
}
