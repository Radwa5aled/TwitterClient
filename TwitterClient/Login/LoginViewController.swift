//
//  LoginViewController.swift
//  TwitterClient
//
//  Created by Radwa on 8/24/17.
//  Copyright © 2017 Eventus. All rights reserved.
//

import UIKit
import TwitterKit

class LoginViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    private let loginPresenter = LoginPresenter()
    
    var btnSignIn: TKTransitionSubmitButton!
    
    @IBOutlet weak var imgLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loginPresenter.attachView(view: self)
        
        loginBtnSetUp()
        btnSignIn.alpha = 0
        imgLogo.alpha = 0
        
       
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.5) {
            self.view.layoutIfNeeded()
            
            self.btnSignIn.alpha = 1
            self.imgLogo.alpha = 1
        }
        
        self.btnSignIn.spiner.spinnerColor = btnSignIn.spinnerColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Initialize login button 
    func loginBtnSetUp() {
        
        btnSignIn = TKTransitionSubmitButton(frame: CGRect(x: 0, y: 0, width: 180, height: 37))
        btnSignIn.center = self.view.center
        btnSignIn.frame.y = self.view.center.y + 150
        btnSignIn.backgroundColor = UIColor.white
        btnSignIn.setTitle("Sign in", for: UIControlState())
        self.view.addSubview(btnSignIn)
        btnSignIn.titleLabel?.font = UIFont(name: "HelveticaNeue-Regular", size: 14)
        btnSignIn.setTitleColor(UIColor(red: 22/257, green: 185/257, blue: 237/257, alpha: 1.0), for: .normal)
        btnSignIn.addTarget(self, action:#selector(handleLogin(_:)), for: .touchUpInside)
        
    }
    
    
   // MARK: - Actions
    func handleLogin(_ sender: UIButton){
        
        self.btnSignIn.startLoadingAnimation()
        loginPresenter.twitterLogin()
        
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
        
        self.btnSignIn.startFinishAnimation(0) {
            print("✅✅ \(session.userName)")
            self.performSegue(withIdentifier: "loginToFollowers", sender: self)
        }
        
    }
    
    func sentFailed(error: Error?){
        self.btnSignIn.startFinishAnimation(0) {
            print("❌❌ \(error!.localizedDescription)")
            self.alert(title: "Error", message: error!.localizedDescription , viewController: self)
        }
    }


}




