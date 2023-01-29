//
//  ViewController.swift
//  HW4
//
//  Created by Bluestreet Mac on 1/28/23.
//

import UIKit

class ViewController: UIViewController {

    let BLACK     =   UIColor(red: 0/255,green: 0/255,blue: 0/255,alpha:1);
    
    let tvViewController = TelevisionViewController()
    let remoteViewController = RemoteViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = BLACK;
        
        addChild(tvViewController)
        self.view.addSubview(tvViewController.view);
        tvViewController.didMove(toParent: self)
        setTVConstraints()
        
        addChild(remoteViewController)
        self.view.addSubview(remoteViewController.view);
        remoteViewController.didMove(toParent: self)
        setRemoteConstraints()
        
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
        
        remoteViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0).isActive = true
        
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
        tvViewController
    }
    
    func onChannelDecrement(){
        
    }
}

