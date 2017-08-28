//
//  FollowersViewController.swift
//  TwitterClient
//
//  Created by Radwa on 8/25/17.
//  Copyright © 2017 Eventus. All rights reserved.
//

import UIKit
import Kingfisher
import TwitterKit
import UIScrollView_InfiniteScroll
import NVActivityIndicatorView

class FollowersViewController: UIViewController {
    
    
    @IBOutlet weak var followersTable: UITableView!
    
    private let followersPresenter = FollowersPresenter(service: AccessLayer())
    var followersData:ModFollowers!
    var followersArr:[User] = []
    
     let refresher = UIRefreshControl()
    var activityProgress: NVActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Add indicator
        let progressSize = CGRect(x: self.view.center.x - 40.0, y: self.view.center.y - 40.0 - 64.0 , width: 80.0, height: 80.0)
        activityProgress = self.setNVActivityIndicatorView(viewController: self, rectProgress: progressSize, progressType: .ballScale, progressColor: UIColor(red: 22/257, green: 185/257, blue: 237/257, alpha: 1.0))
        
        //
        followersPresenter.attachView(view: self)
        followersPresenter.getFollowersData(curser: 0, infiniteRefresher: false, displayIndicator: true)
        
        //set navigation controller title
        self.title = "@" + (UserDefaults.standard.object(forKey: "userName") as? String)!
        
        // Register followers cell
        self.followersTable.register(FollowersCell.self, forCellReuseIdentifier: "FollowersCell")
        self.followersTable.register(UINib(nibName: "FollowersCell",bundle: nil), forCellReuseIdentifier: "FollowersCell")
        
        // Automatic Height for tableView
        followersTable.rowHeight = UITableViewAutomaticDimension
        followersTable.estimatedRowHeight = 88
        
        // Add refresher to table view
        refresher.addTarget(self, action: #selector(refresh), for: .valueChanged)
        followersTable.addSubview(refresher)
        
        // Add infinite scroll to table view 
        followersTable.addInfiniteScroll { (UITableView) in
            
            if self.followersData.nextCursor! != 0 {
                self.followersPresenter.getFollowersData(curser: self.followersData.nextCursor!, infiniteRefresher: true, displayIndicator: false)
                
            }else {
                self.followersTable.finishInfiniteScroll()
                
            }
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = false
        navigationItem.hidesBackButton = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func refresh()
    {
        followersPresenter.getFollowersData(curser: 0, infiniteRefresher: false, displayIndicator: false)
    }

    func setIndicator()  {
        let rectProgress = CGRect(x: self.view.center.x - 40.0, y: self.view.center.y - 40.0 - 64.0 , width: 80.0, height: 80.0)
        self.activityProgress = NVActivityIndicatorView(frame: rectProgress, type: .ballScale, color: UIColor(red: 22/257, green: 185/257, blue: 237/257, alpha: 1.0), padding: 12)
        self.view.addSubview(self.activityProgress!)
        self.view.bringSubview(toFront: self.activityProgress!)
    }

    

     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        
        if segue.identifier == "followerToTimline" {
            
            let userTimlineViewController:UserTimlineViewController = segue.destination as! UserTimlineViewController

            if let selectedRowIndexPath = followersTable.indexPathForSelectedRow {
                
                 userTimlineViewController.userData = followersArr[selectedRowIndexPath.row]
                
            }
            
           
        }
        
     }
 
    
    @IBAction func btnChangeLang(_ sender: Any) {
    
        
        Language.changeLanguages()
        // changeButtonBG(sender)
        let window = Initializer.getWindow()
        let navigation = Initializer.createNavigation()
        let homeVC = Initializer.createViewControllerWithId(storyBoardId: "FollowersViewController") as! FollowersViewController
        
        navigation.pushViewController(homeVC, animated: false)
        window.rootViewController = navigation
        
        UIView.transition(with: window, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        Localizer.DoLangaueExchange()
        print("licalized=\(Language.localizeStringForKey(word: "sign_in"))")
        //self.alert(title: Language.localizeStringForKey(word: "sign_in"), message: "", viewController: self)
    
    }
    
    
    
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
        
        cell.selectionStyle = .none
        
        let data = followersArr[indexPath.row]
        
        cell.lblName.text = data.name
        cell.lblUserName.text = "@" + data.screenName!
        cell.lblDesc.text = data.descriptionField
        cell.imgProfile.kf.setImage(with: URL(string: data.profileImageUrl!))
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         self.performSegue(withIdentifier: "followerToTimline", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
        
    }
    
}

extension FollowersViewController: FollowersView {
    
    func startLoading() {
         self.activityProgress?.startAnimating()
    }
    
    func finishLoading() {
        
        refresher.endRefreshing()
        followersTable.finishInfiniteScroll()
        self.activityProgress?.stopAnimating()
    }
    
    func sentSuccess(followerData: ModFollowers, append: Bool) {
        
        if append {
            followersData = followerData
            followersArr.append(contentsOf: followerData.users!)
            
        }else {
            followersData = followerData
            followersArr = followerData.users!
        }
        
        followersTable.reloadData()
       
    }
    
    func sentFailed(error:String) {
        
        if error == "fail" {
            
            self.alert(title: "Error", message: "Something went wrong, Please try again!", viewController: self)
        }else {
            
            self.alert(title: "Error", message: error, viewController: self)
            
        }
        
        
    }
    
}

