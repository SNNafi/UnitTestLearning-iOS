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

func executeRunLoop() {
    RunLoop.current.run(until: Date())
}

func putInWindow(_ vc: UIViewController) {
    let window = UIWindow()
    window.rootViewController = vc
    window.isHidden = false
}

// MARK: - Chapter14
extension UITextContentType: CustomStringConvertible {
    public var description: String { rawValue }
}

extension UITextAutocorrectionType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .default:
            return "default"
        case .no:
            return "no"
        case .yes:
            return "yes"
        @unknown default:
            fatalError("Unknown UITextAutocorrectionType")
        }
    }
}

func shouldChangeCharacters(in textField: UITextField, range: NSRange = NSRange(),
                            replacement: String) -> Bool? {
    textField.delegate?.textField?(
        textField,
        shouldChangeCharactersIn: range,
        replacementString: replacement)
}

@discardableResult func shouldReturn(in textField: UITextField) -> Bool? { textField.delegate?.textFieldShouldReturn?(textField)
}

// MARK: - Chapter15

func numberOfRows(in tableView: UITableView, section: Int = 0) -> Int? { tableView.dataSource?.tableView(
    tableView, numberOfRowsInSection: section)
}

func cellForRow(in tableView: UITableView, row: Int, section: Int = 0) -> UITableViewCell? {
    tableView.dataSource?.tableView(
        tableView, cellForRowAt: IndexPath(row: row, section: section))
}

func didSelectRow(in tableView: UITableView, row: Int, section: Int = 0) { tableView.delegate?.tableView?(
    tableView, didSelectRowAt: IndexPath(row: row, section: section))
}
