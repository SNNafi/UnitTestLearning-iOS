//
//  UserDefaultsViewController.swift
//  TestingPlayground
//
//  Created by Shahriar Nasim Nafi on 23/6/22.
//

import UIKit

protocol UserDefaultsProtocol {
    func set(_ value: Int, forKey defaultName: String)
    func integer(forKey defaultName: String) -> Int
}

extension UserDefaults: UserDefaultsProtocol { }

class UserDefaultsViewController: UIViewController {
    
    var userDefaults: UserDefaultsProtocol = UserDefaults.standard
    
    @IBOutlet weak private(set) var counterLabel: UILabel!
    @IBOutlet weak private(set) var incrementButton: UIButton!
    
    private var count = 0 {
        didSet {
            counterLabel.text = "\(count)"
            userDefaults.set(count, forKey: "count") }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count = userDefaults.integer(forKey: "count")
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func incrementButtonTapped() {
        print(#function)
        count += 1
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
