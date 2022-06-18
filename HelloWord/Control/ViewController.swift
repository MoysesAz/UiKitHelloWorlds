//
//  ViewController.swift
//  HelloWord
//
//  Created by Moyses Miranda do Vale Azevedo on 16/06/22.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func buttonScene1(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Scene1", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier:"Scene1") as! Scene1Controller
        self.navigationController?.pushViewController(secondVC, animated: true)
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func buttonScene2(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Scene2", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier:"Scene2") as! Scene2Controller
        self.present(secondVC, animated: true)
        self.dismiss(animated: true)
    }

    @IBAction func buttonScene3(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Scene3", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier:"Scene3") as! Scene3Controller
        self.show(secondVC, sender: true)
        if self.navigationController != nil {
            self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

