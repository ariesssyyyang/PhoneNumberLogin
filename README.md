# PhoneNumberLogin
Try to log in using the phone number through the Firebase Auth service.

## Steps

Short steps to setup Firebase:

### Installation

There are at least 2 services needed for getting phone number credential:

* `Firebase/Core`
* `Firebase/Auth`

Connect Firebase project to iOS project:

1. Create a new project from Firebase console

2. [Add Firebase to iOS project](https://firebase.google.com/docs/ios/setup)  
  a. Download `GoogleService-Info.plist` file  
  b. Drag and drop the file into Xcode

3. Enable Phone Number sign-in  
  a. Firebase console -> Authentication -> Sign-in Method   
  b. Enable Phone Number sign-in method

### APN Key

1. [Enable push notifications](https://help.apple.com/xcode/mac/current/#/devdfd3d04a1)  
  a. In the project editor, choose a target, then click Capabilities.  
  b. In the Push Notifications section, click the switch to turn it from OFF to ON.

2. [Configure APNs with FCM](https://firebase.google.com/docs/cloud-messaging/ios/certs)  
  a. [Create the authentication key](https://firebase.google.com/docs/cloud-messaging/ios/certs#create_the_authentication_key)
  (optional, if it is already created and saved)  
  b. [Create an App ID](https://firebase.google.com/docs/cloud-messaging/ios/certs#create_an_app_id)
  (optional, it might already exist in Apple Account Center)  
  c. [Create the Provisioning Profile](https://firebase.google.com/docs/cloud-messaging/ios/certs#create_the_provisioning_profile)
  (optional, it might already exist in Apple Account Center)

3. Upload APNs authentication key to Firebase console  
  a. Firebase console -> Project settings -> Cloud Messaging tab  
  b. APNs authentication key -> Upload button  
  c. Enter key ID, team ID (both can found in the Apple Developer Member Center)

### reCAPTCHA verification

1. Add custom URL schemes to Xcode project  
  a. Project -> TARGETS -> Info -> URL Types  
  b. + -> URL Schemes  
  c. Copy paste the value of `<key>REVERSED_CLIENT_ID</key>` in GoogleService-Info.plist

## Reference

Firebase Guides
https://firebase.google.com/docs/auth/ios/phone-auth
