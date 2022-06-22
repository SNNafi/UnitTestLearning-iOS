//
//  NavPushViewController.swift
//  TestingPlayground
//
//  Created by Shahriar Nasim Nafi on 21/6/22.
//

import UIKit

class NavPushViewController: UIViewController {
    
    @IBOutlet weak private(set) var codePushButton: UIButton!
    @IBOutlet weak private(set) var codeModalButton: UIButton!
    @IBOutlet weak private(set) var seguePushButton: UIButton!
    @IBOutlet weak private(set) var segueModalButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pushNextViewController() {
        let nextVC = CodeNextViewController(labelText: "Pushed from code")
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func presentModalNextViewController() {
        let nextVC = CodeNextViewController(labelText: "Modal from code")
        self.present(nextVC, animated: true)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        switch segue.identifier {
        case "pushNext"?:
            guard let nextVC = segue.destination as? SegueNextViewController else { return }
            nextVC.labelText = "Pushed from segue"
        case "modalNext"?:
            guard let nextVC = segue.destination as? SegueNextViewController
            else { return }
            nextVC.labelText = "Modal from segue"
        default:
            return
        }
    }
    
    deinit {
        print("deinit NavPushViewController")
    }
    

}
