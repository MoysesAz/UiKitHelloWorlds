//
//  CadastreController.swift
//  HelloWord
//
//  Created by Moyses Miranda do Vale Azevedo on 16/06/22.
//

import UIKit

protocol CadastreControllerDelegate: AnyObject {
    func send(name: String, age: String)
}

class CadastreController: UIViewController {

    @IBOutlet weak var tittleNameField: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var TittleAgeField: UILabel!

    weak var delegateCadastre: CadastreControllerDelegate?

    @IBAction func buttonCadastro(_ sender: Any) {
        guard self.nameField.text != nil else { return }
        guard self.ageField.text != nil else { return }

        if self.nameField.text! != "Name" && self.ageField.text! != "Age"{
            delegateCadastre?.send(name: self.nameField.text!, age: self.ageField.text!)
        }

        self.navigationController?.popViewController(animated: true)
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
