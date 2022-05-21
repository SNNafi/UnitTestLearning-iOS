//
//  OverrideViewController.swift
//  TestingPlayground
//
//  Created by Shahriar Nasim Nafi on 21/5/22.
//

import UIKit

class OverrideViewController: UIViewController {
    
    func analytics() -> Analytics {
        return Analytics.shared
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        analytics().track(event: "viewDidAppear - \(type(of: self))")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
