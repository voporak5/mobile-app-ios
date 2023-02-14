//
//  ViewController.swift
//  HW4
//
//  Created by Bluestreet Mac on 1/28/23.
//

import UIKit

class DVRViewController: UIViewController {

    let BLACK     =   UIColor(red: 0/255,green: 0/255,blue: 0/255,alpha:1);
    
    let dvrViewController = DVRDisplayViewController()
    let dvrRemoteViewController = DVRRemoteViewController()
    var mainViewController: UIViewController? = nil;
    let footerViewController = FooterViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = BLACK;
        
        dvrRemoteViewController.setPowerSwitchedObserver(callback: onPowerSwitched)
        dvrRemoteViewController.setStateChangedObserver(callback: onStateChanged)
        
        //Create the Display
        addChild(dvrViewController)
        self.view.addSubview(dvrViewController.view);
        dvrViewController.didMove(toParent: self)
        setTVConstraints()
        
        //Create the Controls
        addChild(dvrRemoteViewController)
        self.view.addSubview(dvrRemoteViewController.view);
        dvrRemoteViewController.didMove(toParent: self)
        setRemoteConstraints()
        
        addChild(footerViewController)
        self.view.addSubview(footerViewController.view)
        footerViewController.build(label: "Switch to TV")
        footerViewController.setButtonPressedObserver(callback: hide)
        setFooterContraints()
    }
    
    func setMainViewController(mainView:UIViewController){
        self.mainViewController = mainView;
    }
    
    func setTVConstraints() {
        dvrViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        dvrViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0).isActive = true
        
        dvrViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        
        dvrViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        
        dvrViewController.view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    func setRemoteConstraints() {
        dvrRemoteViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        dvrRemoteViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 100).isActive = true
        
        dvrRemoteViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -50).isActive = true
        
        dvrRemoteViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        
        dvrRemoteViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        
    }
    
    func setFooterContraints() {
        footerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        footerViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0).isActive = true
        
        footerViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        
        footerViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        
        footerViewController.view.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func onPowerSwitched(isOn: Bool) {
        dvrViewController.SetPower(isOn: isOn)
    }
    
    func onStateChanged(state: String) {
        dvrViewController.SetState(state: state)
    }
    
    func hide(){
        dismiss(animated: true)
    }
}

