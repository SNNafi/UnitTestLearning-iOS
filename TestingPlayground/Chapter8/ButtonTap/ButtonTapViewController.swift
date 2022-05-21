//
//  ButtonTapViewController.swift
//  TestingPlayground
//
//  Created by Shahriar Nasim Nafi on 22/5/22.
//

import UIKit

class ButtonTapViewController: UIViewController {

    @IBOutlet weak private(set) var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonTap(_ sender: UIButton) {
        print(">> Button was tapped")
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
