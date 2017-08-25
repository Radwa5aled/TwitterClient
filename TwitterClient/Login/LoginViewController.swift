//
//  LoginViewController.swift
//  TwitterClient
//
//  Created by Radwa on 8/24/17.
//  Copyright © 2017 Eventus. All rights reserved.
//

import UIKit
import TwitterKit

class LoginViewController: UIViewController {
    
    private let loginPresenter = LoginPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loginPresenter.attachView(view: self)
        loginPresenter.twitterLogin()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension LoginViewController: LoginView {

    func addLoginBtn (btnLogin:TWTRLogInButton){
        
                btnLogin.center = self.view.center
                self.view.addSubview(btnLogin)
        
    }
    
    func sentSuccess(session: TWTRSession){
        
        print("✅✅ \(session.userName)")
        
    }
    
    func sentFailed(error: Error?){
        
        print("❌❌ \(error!.localizedDescription)")
        
    }


}
