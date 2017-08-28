//
//  UserTimlineViewController.swift
//  TwitterClient
//
//  Created by Radwa on 8/26/17.
//  Copyright © 2017 Eventus. All rights reserved.
//

import UIKit
import TwitterKit
import RKParallaxEffect
import SKPhotoBrowser

class UserTimlineViewController: UIViewController, TWTRTweetViewDelegate {

     private let userTimlinePresenter = UserTimlinePresenter(service: AccessLayer())
   
     var userData:User!
     var userTimlineArr: [ModUserTimline] = []
     var tweets: [Any] = []
    
     var parallaxEffect: RKParallaxEffect!
    
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var profileTable: UITableView!
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "@" + (userData.screenName ?? "")
        
        profileTable.estimatedRowHeight = 150
        profileTable.rowHeight = UITableViewAutomaticDimension
        
        userTimlinePresenter.attachView(view: self)
        userTimlinePresenter.getTimlineData(userId: userData.idStr!)
        
        lblName.text = userData.name ?? ""
        lblUserName.text = "@" + (userData.screenName ?? "")
        imgProfile.kf.setImage(with: URL(string: userData.profileImageUrl ?? "") , placeholder: UIImage(named: "default_profile"), options: nil, progressBlock: nil, completionHandler: nil)
        imgCover.kf.setImage(with: URL(string: userData.profileBannerUrl ?? ""), placeholder:  UIImage(named: "default_cover"), options: nil, progressBlock: nil, completionHandler: nil)
        
        
        profileTable.register(TWTRTweetTableViewCell.self, forCellReuseIdentifier: "ProfileCell")

        parallaxEffect = RKParallaxEffect(tableView: profileTable)
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UserTimlineViewController.animateImage(_:)))
        
        imgProfile.isUserInteractionEnabled = true
        imgProfile.addGestureRecognizer(tapGestureRecognizer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        parallaxEffect.isParallaxEffectEnabled = true
        parallaxEffect.isFullScreenTapGestureRecognizerEnabled = true
        parallaxEffect.isFullScreenPanGestureRecognizerEnabled = true
    }

    
    func animateImage(_ sender:AnyObject) {
    
        var images = [SKPhoto]()
        let photo = SKPhoto.photoWithImageURL(userData.profileImageUrl!)
        photo.shouldCachePhotoURLImage = true // you can use image cache by true(NSCache)
        images.append(photo)
        
        let browsers = SKPhotoBrowser(originImage: imgProfile.image ?? UIImage(), photos: images, animatedFromView: imgProfile)
      //  let browsers = SKPhotoBrowser(photos: images)
        browsers.initializePageIndex(0)
        present(browsers, animated: true, completion: {})
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


extension UserTimlineViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell")! as! TWTRTweetTableViewCell
        
         cell.tweetView.delegate = self
        
         let tweet = tweets[indexPath.row]
         cell.configure(with: tweet as! TWTRTweet)
        
         cell.tweetView.showActionButtons = true
        
        cell.selectionStyle = .none
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       // self.performSegue(withIdentifier: "followerToTimline", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
        
    }
    
}



extension UserTimlineViewController: UserTimelineView {
    
    func startLoading() {
        
    }
    
    func finishLoading() {
        
    }
    
    func sentSuccess(userTimlineData: [ModUserTimline], tweetsData: [Any]) {
         userTimlineArr = userTimlineData
         tweets = tweetsData
         profileTable.reloadData()
    
    }
    
    
    func sentFailed(error:String) {
        
        if error == "fail" {
            
            self.alert(title: "Error", message: "Something went wrong, Please try again!", viewController: self)
        }else {
            
            self.alert(title: "Error", message: error, viewController: self)
            
        }
    }
    
}




