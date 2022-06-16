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
    var name: String?


    @IBAction func buttonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Cadastre", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier:"Cadastre") as! CadastreController
        secondVC.delegateCadastre = self
        self.navigationController?.pushViewController(secondVC, animated: true)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard self.name != nil else {
            return
        }
        self.nameUser.text = self.name
    }

}

extension ViewController: CadastreControllerDelegate {
    func send(text: String) {
        self.name = text
    }


}

