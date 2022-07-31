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
    @IBOutlet weak var countryCodeTextfield: UITextField!
    
    //MARK: Variables
    private let pickerView = UIPickerView()
    private lazy var arrOfCountriesWithTheirValues = [CountryCodeModel]()
    private var selectedCountryCode :String?
    var user = UserModel()
    
    //MARK: View Life Cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCountryPicker()
        UISetup()
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
    private func UISetup(){
        passwordTextField.UISetupToTextField()
        emailTextField.UISetupToTextField()
        nameTextField.UISetupToTextField()
        phoneTextField.UISetupToTextField()
        countryCodeTextfield.UISetupToTextField()
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
    
}
extension RegisterVC: UITextFieldDelegate{
    func isValidEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
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
