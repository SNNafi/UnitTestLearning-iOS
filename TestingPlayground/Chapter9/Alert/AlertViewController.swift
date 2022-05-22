//
//  AlertViewController.swift
//  TestingPlayground
//
//  Created by Shahriar Nasim Nafi on 23/5/22.
//

import UIKit

class AlertViewController: UIViewController {
    
    @IBOutlet weak private(set) var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTap(_ sender: UIButton) {
        let alert = UIAlertController(title: "Do the Thing?",
                                      message: "Let us know if you want to do the thing.",
                                      preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print(">> Cancel")
        }
        
        let okAction = UIAlertAction(title: "Tap", style: .default) { _ in
            print(">> Tap")
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        alert.preferredAction = okAction
        present(alert, animated: true)
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
