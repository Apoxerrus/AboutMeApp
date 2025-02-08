//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Виктор Зиновьев on 08.02.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userName: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBOutlet var logInButoon: UIButton!
    
    @IBOutlet var forgotUserName: UIButton!
    @IBOutlet var forrgotPassword: UIButton!
    
    let validUserName = "1"
    let validPassword = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            guard let userName = userName.text, let password = password.text,
                  userName == validUserName, password == validPassword else {
                let alert = UIAlertController(title: "Invalid Login or Password",
                                              message: "Please enter correct login and password",
                                              preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default) {_ in
                    self.password.text = ""}
                alert.addAction(okAction)
                present(alert, animated: true)
                return false
            }
            return true
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToWelcomeScreen" {
                if let welcomeVC = segue.destination as? WelcomeViewController {
                    welcomeVC.userName = userName.text
                }
            }
        }
    
    @IBAction func logInButtonTapped(_ sender: UIButton) {
        if shouldPerformSegue(withIdentifier: "goToWelcomeScreen", sender: sender) {
                    performSegue(withIdentifier: "goToWelcomeScreen", sender: sender)
                }
    }
    
    @IBAction func forgotUserNameTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Oops!",
                                      message: "Ваш логин: 1",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    @IBAction func forgotPasswordTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Oops!",
                                      message: "Ваш пароль: 1",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func unwindToLogin(_ segue: UIStoryboardSegue) {
        userName.text = ""
        password.text = ""
    }
}
