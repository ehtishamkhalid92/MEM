//
//  RegisterVC.swift
//  MEM
//
//  Created by Ehtisham Khalid on 26.07.22.
//

import UIKit

class RegisterVC: UIViewController {

    //MARK: Properties.
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    //MARK: View Life Cycle.
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Actions
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
    }
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func termButtonPressed(_ sender: UIButton) {
        
    }
    
    //MARK: Functions
    
}
extension RegisterVC: UITextFieldDelegate{
    func isValidEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
}
