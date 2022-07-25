//
//  LoginVC.swift
//  MEM
//
//  Created by Ehtisham Khalid on 25.07.22.
//

import UIKit

class LoginVC: UIViewController {

    //MARK: Properties
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    //MARK:- View Life Cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //MARK:- Actions
    @IBAction func forgotPasswordButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
    }
   
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func googleLoginButtonPressed(_ sender: UIButton) {
        
    }
    @IBAction func appleLoginButtonPressed(_ sender: UIButton) {
        
    }
    
    //MARK: Functions
    
    private func updateUI() {
        appleButton.addBorderToTheButton(color: UIColor.black.cgColor)
        googleButton.addBorderToTheButton(color: UIColor.black.cgColor)
    }
    
}
