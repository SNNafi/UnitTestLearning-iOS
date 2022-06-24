//
//  TextFieldViewController.swift
//  TestingPlayground
//
//  Created by Shahriar Nasim Nafi on 25/6/22.
//

import UIKit

class TextFieldViewController: UIViewController {
    
    @IBOutlet private(set) weak var usernameField: UITextField!
    @IBOutlet private(set) weak var passwordField: UITextField!
    
    var loggedInPerformed: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    private func performLogin(username: String, password: String) {
        loggedInPerformed = true
        print("Username: \(username)")
        print("Password: \(password)")
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    deinit {
        print("TextFieldViewController.deinit")
    }

    
}

extension TextFieldViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField === usernameField {
            return !string.contains(" ")
        } else {
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            passwordField.becomeFirstResponder()
        } else {
            guard let username = usernameField.text,
                  let password = passwordField.text else {
                return false
            }
            passwordField.resignFirstResponder()
            performLogin(username: username, password: password )
        }
        return false
    }
}
