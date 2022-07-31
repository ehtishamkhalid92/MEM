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
        let SB = UIStoryboard(name: "Main", bundle: nil)
        let vc = SB.instantiateViewController(identifier: "VerificationVC") as! VerificationVC
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func termButtonPressed(_ sender: UIButton) {
        
    }
    
    //MARK: Functions
    
}
