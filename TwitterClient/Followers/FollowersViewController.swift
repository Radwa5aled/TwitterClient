//
//  FollowersViewController.swift
//  TwitterClient
//
//  Created by Radwa on 8/25/17.
//  Copyright © 2017 Eventus. All rights reserved.
//

import UIKit

class FollowersViewController: UIViewController {
    
    
    @IBOutlet weak var followersTable: UITableView!
    
    private let followersPresenter = FollowersPresenter(service: AccessLayer())
    var followersData:ModFollowers!
    var followersArr:[User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        followersPresenter.attachView(view: self)
        followersPresenter.getFollowersData()
        
        self.title = "@" + (UserDefaults.standard.object(forKey: "userName") as? String)!
        
        self.followersTable.register(FollowersCell.self, forCellReuseIdentifier: "FollowersCell")
        self.followersTable.register(UINib(nibName: "FollowersCell",bundle: nil), forCellReuseIdentifier: "FollowersCell")
       
        followersTable.rowHeight = UITableViewAutomaticDimension
        followersTable.estimatedRowHeight = 96
        
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

extension FollowersViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return followersArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FollowersCell") as! FollowersCell
        
        let data = followersArr[indexPath.row]
        
        cell.lblName.text = data.name
        cell.lblUserName.text = "@" + data.screenName!
        cell.lblDesc.text = data.descriptionField
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
        
    }
    
}

extension FollowersViewController: FollowersView {
    
    func startLoading() {
        
    }
    
    func finishLoading() {
        
    }
    
    func sentSuccess(followerData: ModFollowers) {
        followersData = followerData
        followersArr = followerData.users!
        
        followersTable.reloadData()
    }
    
    func sentFailed() {
        self.alert(title: "Error", message: "Something went wrong, Please try again!", viewController: self)
    }
    
}

