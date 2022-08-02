//
//  RegisterVC.swift
//  MEM
//
//  Created by Ehtisham Khalid on 26.07.22.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
   

    //MARK: Properties.
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var countryCodeTextfield: UITextField!
    
    //MARK: Variables
    private let pickerView = UIPickerView()
    private lazy var arrOfCountriesWithTheirValues = [CountryCodeModel]()
    private var selectedCountryCode :String?
    
    var user = UserModel()
    
    private var ref: DatabaseReference!
    private var progressIndicator = ProgressHUD(text: "Please wait...")
    
    //MARK: View Life Cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCountryPicker()
        UISetup()
        
        //Firebase
        ref = Database.database().reference()
    }
    
    //MARK: Actions
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        validation()
    }
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func termButtonPressed(_ sender: UIButton) {
        
    }
    
    //MARK: Functions
    private func validation() {
        if nameTextField.text!.isEmpty{
            nameTextField.becomeFirstResponder()
        }else if emailTextField.text!.isEmpty{
            emailTextField.becomeFirstResponder()
        }else if !isValidEmail(email: emailTextField.text!){
            showAlert(title: "Wrong email format!", message: "Email that you have entered have bad format. Please enter a valid email address. Thank you!", controller: self)
        }else if countryCodeTextfield.text!.isEmpty{
            countryCodeTextfield.becomeFirstResponder()
        }else if phoneTextField.text!.isEmpty{
            phoneTextField.becomeFirstResponder()
        }else if passwordTextField.text!.isEmpty{
            passwordTextField.becomeFirstResponder()
        }else {
            //Apply API
            
        }
    }
    
    private func UISetup(){
        passwordTextField.UISetupToTextField()
        emailTextField.UISetupToTextField()
        nameTextField.UISetupToTextField()
        phoneTextField.UISetupToTextField()
        countryCodeTextfield.UISetupToTextField()
        passwordTextField.delegate = self
        nameTextField.delegate = self
        emailTextField.delegate = self
        
    }
    private func setupCountryPicker() {
        
        pickerView.delegate = self
        pickerView.dataSource = self
        countryCodeTextfield.inputView = pickerView
        
        for (key, value) in dialingCodes {
            print(value)
            if let country = countryName(countryCode: key) {
                let name = country
                let emojiFlag = flag(country: key)
                let flag = emojiFlag
                let code = value
                let countryCode = key
                let obj = CountryCodeModel(flag: flag, code: code, countryName: name, countryCode: countryCode)
                arrOfCountriesWithTheirValues.append(obj)
            }
        }
        
        let sortedArray = arrOfCountriesWithTheirValues.sorted(by: { $0.countryName < $1.countryName })
        self.arrOfCountriesWithTheirValues.removeAll()
        self.arrOfCountriesWithTheirValues = sortedArray
    }
    
    private func countryName(countryCode: String) -> String? {
        let current = Locale(identifier: "en_US")
        return current.localizedString(forRegionCode: countryCode)
    }
    
    private func flag(country: String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
    
    //MARK: Networking
    
    ///Email Authentication
    private func AuthenticateEmail() {
        self.view.addSubview(progressIndicator)
        Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { authResult, error in
            self.progressIndicator.removeFromSuperview()
            if let error = error as NSError? {
                switch AuthErrorCode(error.code) {
                case .operationNotAllowed:
                    showAlert(title: "Operation Not Allowed", message: "The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section", controller: self)
                case .emailAlreadyInUse:
                    showAlert(title: "Email Already In Use", message: "The email address is already in use by another account", controller: self)
                case .invalidEmail:
                    showAlert(title: "Invalid Email", message: "The email address is badly formatted", controller: self)
                case .weakPassword:
                    showAlert(title: "Weak Password", message: "The password must be 6 characters long or more", controller: self)
                default:
                    showAlert(title: "Registration", message: "Error: \(error.localizedDescription)", controller: self)
                }
            } else {
                let newUserInfo = Auth.auth().currentUser
                let userId = newUserInfo?.uid
                self.user.userId = userId!
            }
        }
    }
    
    
}
extension RegisterVC: UITextFieldDelegate{
    func isValidEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    func isValidatePassword(_ password: String) -> Bool {
        //At least 8 characters
        if password.count < 8 {
            return false
        }
        //At least one digit
        if password.range(of: #"\d+"#, options: .regularExpression) == nil {
            return false
        }
        //At least one letter
        if password.range(of: #"\p{Alphabetic}+"#, options: .regularExpression) == nil {
            return false
        }
        //No whitespace charcters
        if password.range(of: #"\s+"#, options: .regularExpression) != nil {
            return false
        }

        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
extension RegisterVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrOfCountriesWithTheirValues.count
    }


    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let instance = arrOfCountriesWithTheirValues[row]
        let title = "\(instance.flag)  \(instance.countryName)  +\(instance.code)"
        return title
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let instance = arrOfCountriesWithTheirValues[row]
        let title = "\(instance.countryCode) +\(instance.code)"
        countryCodeTextfield.text = title
        self.selectedCountryCode = instance.code
    }
}
