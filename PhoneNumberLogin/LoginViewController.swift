//
//  ViewController.swift
//  PhoneNumberLogin
//
//  Created by Aries Yang on 2019/4/9.
//  Copyright © 2019 Aries Yang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Number"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let phoneNumTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please Enter your phone number"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let verifyPhoneNumberButton: UIButton = {
        let button = UIButton()
        button.setTitle("Send verification code", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let verificationCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Verification Code"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let verificationCodeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please enter the code from SMS message"
        textField.textContentType = .oneTimeCode
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign-In", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}
