//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Виктор Зиновьев on 08.02.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    let validUserName = "1"
    let validPassword = "1"
    
    @IBOutlet private var userName: UITextField!
    @IBOutlet private var password: UITextField!
    
    @IBOutlet private var logInButoon: UIButton!
    
    @IBOutlet private var forgotUserName: UIButton!
    @IBOutlet private var forrgotPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logInButtonTapped(_ sender: UIButton) {
        if shouldPerformSegue(withIdentifier: "goToWelcomeScreen", sender: sender) {
                    performSegue(withIdentifier: "goToWelcomeScreen", sender: sender)
                }
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           super .touchesBegan(touches, with: event)
           view.endEditing(true)
       }
    
    @IBAction func unwindToLogin(_ segue: UIStoryboardSegue) {
            userName.text = ""
            password.text = ""
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
    
}
