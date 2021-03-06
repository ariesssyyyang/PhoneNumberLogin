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
        textField.placeholder = "ex: 0987654321"
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let verifyPhoneNumberButton: UIButton = {
        let button = UIButton()
        button.setTitle("Send verification code", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.setTitleColor(#colorLiteral(red: 0.1793702626, green: 0.586812639, blue: 0.6392614976, alpha: 1), for: .normal)
        button.layer.borderWidth = 0.4
        button.layer.borderColor = #colorLiteral(red: 0.1793702626, green: 0.586812639, blue: 0.6392614976, alpha: 1).cgColor
        button.layer.cornerRadius = 10
        button.contentEdgeInsets = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
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
        textField.placeholder = "ex: 000000"
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textContentType = .oneTimeCode
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = #colorLiteral(red: 0.5949766749, green: 0.12311565, blue: 0.05800817498, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let loadingView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .gray)
        view.hidesWhenStopped = true
        view.stopAnimating()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupButton()
    }

    func setupLayout() {
        view.addSubview(baseView)
        baseView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        baseView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        baseView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
        baseView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        baseView.addSubview(phoneNumberLabel)
        phoneNumberLabel.leftAnchor.constraint(equalTo: baseView.leftAnchor).isActive = true
        phoneNumberLabel.rightAnchor.constraint(equalTo: baseView.centerXAnchor).isActive = true
        phoneNumberLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        phoneNumberLabel.topAnchor.constraint(equalTo: baseView.topAnchor).isActive = true

        baseView.addSubview(phoneNumTextField)
        phoneNumTextField.leftAnchor.constraint(equalTo: phoneNumberLabel.leftAnchor).isActive = true
        phoneNumTextField.rightAnchor.constraint(equalTo: baseView.rightAnchor, constant: 20).isActive = true
        phoneNumTextField.heightAnchor.constraint(equalTo: phoneNumberLabel.heightAnchor).isActive = true
        phoneNumTextField.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 5).isActive = true

        baseView.addSubview(verifyPhoneNumberButton)
        verifyPhoneNumberButton.leftAnchor.constraint(equalTo: phoneNumTextField.leftAnchor, constant: 5).isActive = true
        verifyPhoneNumberButton.rightAnchor.constraint(equalTo: baseView.centerXAnchor, constant: 10).isActive = true
        verifyPhoneNumberButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        verifyPhoneNumberButton.topAnchor.constraint(equalTo: phoneNumTextField.bottomAnchor, constant: 10).isActive = true

        baseView.addSubview(verificationCodeLabel)
        verificationCodeLabel.leftAnchor.constraint(equalTo: phoneNumberLabel.leftAnchor).isActive = true
        verificationCodeLabel.rightAnchor.constraint(equalTo: phoneNumberLabel.rightAnchor).isActive = true
        verificationCodeLabel.heightAnchor.constraint(equalTo: phoneNumberLabel.heightAnchor).isActive = true
        verificationCodeLabel.topAnchor.constraint(equalTo: verifyPhoneNumberButton.bottomAnchor, constant: 30).isActive = true

        baseView.addSubview(verificationCodeTextField)
        verificationCodeTextField.leftAnchor.constraint(equalTo: phoneNumTextField.leftAnchor).isActive = true
        verificationCodeTextField.rightAnchor.constraint(equalTo: phoneNumTextField.rightAnchor).isActive = true
        verificationCodeTextField.heightAnchor.constraint(equalTo: phoneNumTextField.heightAnchor).isActive = true
        verificationCodeTextField.topAnchor.constraint(equalTo: verificationCodeLabel.bottomAnchor, constant: 5).isActive = true

        baseView.addSubview(signInButton)
        signInButton.centerXAnchor.constraint(equalTo: baseView.centerXAnchor).isActive = true
        signInButton.bottomAnchor.constraint(equalTo: baseView.bottomAnchor).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signInButton.widthAnchor.constraint(equalTo: baseView.widthAnchor, multiplier: 0.5).isActive = true

        baseView.addSubview(loadingView)
        loadingView.centerXAnchor.constraint(equalTo: verifyPhoneNumberButton.centerXAnchor).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: verifyPhoneNumberButton.centerYAnchor).isActive = true
        loadingView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        loadingView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}

extension LoginViewController {

    func setupButton() {
        verifyPhoneNumberButton.addTarget(self, action: #selector(sendVerificationCode), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
    }

    @objc func sendVerificationCode() {
        guard let phoneNumber = phoneNumTextField.text, !phoneNumber.isEmpty else {
            showFailAlert(message: "Please enter your phone number.")
            return
        }
        
        guard phoneNumber.count == 10 else {
            showFailAlert(message: "Please enter entire phone number (include prefix 0).")
            return
        }

        let phoneNumWithCountryCode = Util.addCountryCode(phoneNumber: phoneNumber)
        resignTextFields()
        loadingView.startAnimating()
        LoginManager.sendVerificationCode(phoneNumber: phoneNumWithCountryCode) { [weak self] (result) in
            self?.loadingView.stopAnimating()
            switch result {
            case .success(let verificationID):
                UserDefaults.standard.set(verificationID, forKey: "authVerificationId")
                self?.verificationCodeTextField.becomeFirstResponder()
            case .failure(let error):
                self?.showFailAlert(message: error.localizedDescription)
            }
        }
    }
    
    @objc func signIn() {
        guard let phoneNumber = phoneNumTextField.text, !phoneNumber.isEmpty else {
            showFailAlert(message: "Please enter your phone number.")
            return
        }

        guard let verificationCode = verificationCodeTextField.text, !verificationCode.isEmpty else {
            showFailAlert(message: "Please enter the verification code.")
            return
        }

        guard let verificationID = UserDefaults.standard.string(forKey: "authVerificationId") else {
            showFailAlert(message: "Please wait for the verification code from SMS message.")
            return
        }
        
        let credential = LoginManager.getCredential(with: verificationCode, verificationID: verificationID)
        LoginManager.signInUser(with: credential) { [weak self] (result) in
            switch result {
            case .success(let user):
                self?.resignTextFields()
                self?.showSuccessAlert(message: user.phoneNumber)
            case .failure(let error):
                self?.showFailAlert(message: error.localizedDescription)
            }
        }
    }

    func showFailAlert(message: String) {
        let alert = UIAlertController(title: "ERROR", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }

    func showSuccessAlert(message: String?) {
        let alert = UIAlertController(title: "CALL U MAYBE 😉", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            let welcomePage = WelcomeViewController()
            self?.present(welcomePage, animated: true, completion: nil)
        }
        alert.addAction(ok)
        self.present(alert, animated: true) { [weak self] in
            self?.phoneNumTextField.text?.removeAll()
            self?.verificationCodeTextField.text?.removeAll()
        }
    }

    func resignTextFields() {
        phoneNumTextField.resignFirstResponder()
        verificationCodeTextField.resignFirstResponder()
    }
}
