//
//  ViewController.swift
//  Dactrofy
//
//  Created by Suvendu Kumar on 24/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var FullNameTextField: UITextField!
    @IBOutlet weak var EmailIdTextField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var monthsFiled: UITextField!
    
    private(set) var genderType: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTappedRegister(_ sender: Any) {
        self.registerUser()
    }
    
    
    
    private func registerUser() {
        guard let genderType = genderType,
              let fullName = FullNameTextField.text, !fullName.isEmpty,
              let email = EmailIdTextField.text, !email.isEmpty,
              let year = yearField.text, !year.isEmpty,
              let month = monthsFiled.text, !month.isEmpty else { return}
        
        let userData = RegistrationParameters(name: fullName, email: email, gender: genderType, practice_frm_month: month, practice_frm_year: year)
        NetworkManager.registerUser(with: userData)
    }
}


extension ViewController {
    @IBAction func genderForMaleBotton(_ sender: UIButton) {
        self.genderType = "M"
    }
    @IBAction func genderForFemaleButton(_ sender: Any) {
        self.genderType = "F"
    }
    
    @IBAction func genderForOthersButton(_ sender: UIButton) {
        self.genderType = "O"
    }
    
    
    
}
