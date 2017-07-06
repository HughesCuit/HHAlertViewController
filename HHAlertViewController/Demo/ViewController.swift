//
//  ViewController.swift
//  HHAlertViewController
//
//  Created by 黄河 on 2017/7/6.
//  Copyright © 2017年 黄河. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showSystemAlert(_ sender: Any) {
        let alert = UIAlertController(title: "UIAlertController", message: "System Alert Controller", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Action 1", style: .default) { (action) in
            print(action.title ?? "")
        })
        alert.addAction(UIAlertAction(title: "Action 2", style: .default) { (action) in
            print(action.title ?? "")
        })
        alert.addAction(UIAlertAction(title: "Action 3", style: .default) { (action) in
            print(action.title ?? "")
        })
        present(alert, animated: true) { 
            
        }
    }

    @IBAction func showMyAlert(_ sender: Any) {
        let alert = HHAlertViewController(title: "HHAlertViewController", message: "A Very Beautiful AlertController", actions: [
            AlertAction(title: "Action 1") { (actionBtn) in
                print(actionBtn.title)
            },
            AlertAction(title: "Action 2") { (actionBtn) in
                print(actionBtn.title)
            },
            AlertAction(title: "Action 3") { (actionBtn) in
                print(actionBtn.title)
            }
            ])
        present(alert, animated: true) { 
            
        }
    }

}

