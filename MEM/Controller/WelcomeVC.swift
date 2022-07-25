//
//  ViewController.swift
//  MEM
//
//  Created by Ehtisham Khalid on 25.07.22.
//

import UIKit

class WelcomeVC: UIViewController {

    //MARK: Properties
    @IBOutlet weak var getstartedButton: UIButton!
    
    
    //MARK: View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    //MARK: Actions
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func getStartedButtonPressed(_ sender: UIButton) {
        
    }
    
    //MARK: Function
    private func updateUI () {
        getstartedButton.setBtnWithShadow()
    }
}

