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
    }

    @IBAction func buttonScene2(_ sender: Any) {

    }

    @IBAction func buttonSecen2(_ sender: Any) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

