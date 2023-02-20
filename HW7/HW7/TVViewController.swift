//
//  ViewController.swift
//  HW7
//
//  Created by Bluestreet Mac on 1/28/23.
//

import UIKit

class TVViewController: UIViewController {
    
    let BLACK     =   UIColor(red: 0/255,green: 0/255,blue: 0/255,alpha:1);
    
    let tvViewController = TelevisionViewController()
    let remoteViewController = RemoteViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create the TV
        addChild(tvViewController)
        self.view.addSubview(tvViewController.view);
        tvViewController.didMove(toParent: self)
        setTVConstraints()
        
        //Create the Remote
        addChild(remoteViewController)
        self.view.addSubview(remoteViewController.view);
        remoteViewController.didMove(toParent: self)
        setRemoteConstraints()
        
        //Setup listeners that send messages to the TV because
        //the TV and Remote don't know about each other
        remoteViewController.setChannelSetObserver(callback: onChannelSet)
        remoteViewController.setVolumeSetObserver(callback: onVolumeSet)
        remoteViewController.setIncrementObserver(callback: onChannelIncrement)
        remoteViewController.setDecrementObserver(callback: onChannelDecrement)
        remoteViewController.setPowerSwitchedObserver(callback: onPowerSwitched)
    }
    
    func setTVConstraints() {
        tvViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        tvViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0).isActive = true
        
        tvViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        
        tvViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        
        tvViewController.view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    func setRemoteConstraints() {
        remoteViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        remoteViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 200).isActive = true
        
        remoteViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        remoteViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        
        remoteViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        
    }
    
    func onPowerSwitched(isOn: Bool) {
        tvViewController.SetPower(isOn: isOn)
    }
    
    func onChannelSet(channel: Int) {
        tvViewController.SetChannel(channel: channel)
    }

    func onVolumeSet(volume: Int) {
        tvViewController.SetVolume(volume: volume)
    }
    
    func onChannelIncrement(){
        tvViewController.IncrementChannel()
    }
    
    func onChannelDecrement(){
        tvViewController.DecrementChannel()
    }
    
    public func setFavoriteButton(nBtn:Int,name:String,channel:Int){
        remoteViewController.setFavoriteChannel(nBtn: nBtn, name: name, channel: channel)
    }
}

