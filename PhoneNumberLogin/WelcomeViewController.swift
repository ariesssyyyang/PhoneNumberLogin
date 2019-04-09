//
//  WelcomeViewController.swift
//  PhoneNumberLogin
//
//  Created by Aries Yang on 2019/4/9.
//  Copyright © 2019 Aries Yang. All rights reserved.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {

    let contentTextView: UITextView = {
        let textView = UITextView()
        textView.text = """
        😼✌🏽🐷🍸🗿💸
        👶🏽 GOTCHA! ☺️
        👻💩👋🏽😈🎉👨🏽‍💻
        """
        textView.font = UIFont(name: "GillSans-Bold", size: 20)
        textView.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        textView.isEditable = false
        textView.isUserInteractionEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        setupWelcomeText()
    }

    func setupWelcomeText() {
        view.addSubview(contentTextView)
        contentTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        contentTextView.heightAnchor.constraint(equalTo: contentTextView.widthAnchor).isActive = true
        contentTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contentTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
