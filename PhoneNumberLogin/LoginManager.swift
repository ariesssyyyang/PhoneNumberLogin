//
//  LoginManager.swift
//  PhoneNumberLogin
//
//  Created by Aries Yang on 2019/4/9.
//  Copyright © 2019 Aries Yang. All rights reserved.
//

import Foundation
import FirebaseAuth

class LoginManager {

    func sendVerificationCode(phoneNumber: String, completion: @escaping (Result<String>) -> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                completion(.failure(error))
            } else if let verificationID = verificationID {
                completion(.success(verificationID))
            } else {
                completion(.failure(LoginError.unknown))
            }
        }
    }

    func getCredential(with verificationCode: String, verificationID: String) -> AuthCredential {
        return PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)
    }

    func signInUser(with credential: AuthCredential, completion: @escaping (Result<User>) -> Void) {
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                completion(.failure(error))
            } else if let authResult = authResult {
                completion(.success(authResult.user))
            } else {
                completion(.failure(LoginError.unknown))
            }
        }
    }
}
