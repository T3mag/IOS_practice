//
//  ViewController.swift
//  hw2
//
//  Created by Артур Миннушин on 02.07.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var loginTextFiled: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    let number : String = ""
    let password: String = "AAAA"
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
    }
    
    @IBAction func SignUp(_ sender: Any) {
        let number = loginTextFiled.text
        
        if((number?.hasPrefix("8908"))! && passwordTextField.text == password) {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "ContactViewController") else {return}
            
            navigationController?.pushViewController(vc, animated: true)
        } else {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "ErrorViewController") else {return}
            present(vc, animated: true)
        }
    }
}

