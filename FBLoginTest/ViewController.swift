//
//  ViewController.swift
//  FBLoginTest
//
//  Created by Md. Kamrul Hasan on 1/8/17.
//  Copyright © 2017 MKHG Lab. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let loginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        loginButton.readPermissions = ["email"]
        self.view.addSubview(loginButton)
        
        loginButton.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.logUserData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("logged in")
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("logged out")
    }

    
    func logUserData() {
        let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest?.start(completionHandler: { (connection
            , result, error) in
            if(error != nil){
                print(error)
            }else{
                print(result)
            }
        })
    }

}

