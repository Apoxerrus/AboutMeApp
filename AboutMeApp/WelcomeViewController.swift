//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by Виктор Зиновьев on 08.02.2025.
//

import UIKit

final class WelcomeViewController: UIViewController {

var userName: String?
    
@IBOutlet private var welcomeLabel: UILabel!

override func viewDidLoad() {
        super.viewDidLoad()
    welcomeLabel.text = "Welcome, \(userName ?? "")!"
    }
    
}

