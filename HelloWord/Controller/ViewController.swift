//
//  ViewController.swift
//  HelloWord
//
//  Created by Moyses Miranda do Vale Azevedo on 16/06/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var ageUser: UILabel!
    @IBOutlet weak var button: UIButton!

    @IBAction func buttonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Cadastre", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier:"Cadastre") as! CadastreController
        self.navigationController?.pushViewController(secondVC, animated: true)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

