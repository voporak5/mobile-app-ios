//
//  ViewController.swift
//  HW7
//
//  Created by Bluestreet Mac on 1/28/23.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate {
    
    let BLACK     =   UIColor(red: 0/255,green: 0/255,blue: 0/255,alpha:1);
    
    let tvViewController = TVViewController()
    let dvrViewController = DVRViewController()
    let configViewController = ConfigViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViewController.setFavoriteChannelSetObserver(callback: onFavoriteChannelSet)
        
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tabOneBarItem = UITabBarItem(title: "TV", image: UIImage(named:"defaultImage"), selectedImage: UIImage(named:"selectedImage"))
        tvViewController.tabBarItem = tabOneBarItem;
        
        let tabTwoBarItem = UITabBarItem(title: "DVR", image: UIImage(named:"defaultImage2"), selectedImage: UIImage(named:"selectedImage2"))
        dvrViewController.tabBarItem = tabTwoBarItem;
        
        let tabThreeBarItem = UITabBarItem(title: "Configuration", image: UIImage(named:"defaultImage2"), selectedImage: UIImage(named:"selectedImage2"))
        configViewController.tabBarItem = tabThreeBarItem;
        
        self.viewControllers = [tvViewController,dvrViewController,configViewController]
    }

    func onFavoriteChannelSet(nBtn:Int,name:String,channel:Int) {
        self.tvViewController.setFavoriteButton(nBtn: nBtn, name: name, channel: channel)
    }
}
