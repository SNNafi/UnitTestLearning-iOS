//
//  SegueNextViewController.swift
//  TestingPlayground
//
//  Created by Shahriar Nasim Nafi on 21/6/22.
//

import UIKit

class SegueNextViewController: UIViewController {
    
    @IBOutlet weak private(set) var label: UILabel!
    var labelText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText

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
    deinit {
        print(">> SegueNextViewController.deinit")
    }

}
