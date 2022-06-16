//
//  CadastreController.swift
//  HelloWord
//
//  Created by Moyses Miranda do Vale Azevedo on 16/06/22.
//

import UIKit

protocol CadastreControllerDelegate: AnyObject {
    func send(text: String)
}

class CadastreController: UIViewController {

    @IBOutlet weak var tittleNameField: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var AgeField: UITextField!
    @IBOutlet weak var TittleAgeField: UILabel!

    weak var delegateCadastre: CadastreControllerDelegate?

    @IBAction func buttonCadastro(_ sender: Any) {
        guard self.nameField.text != nil else {
            return
        }

        delegateCadastre?.send(text: self.nameField.text!)
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
