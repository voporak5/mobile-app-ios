//
//  TelevisionViewController.swift
//  HW4
//
//  Created by Bluestreet Mac on 1/28/23.
//

import UIKit

class DVRDisplayViewController: UIViewController {

    let RED     =   UIColor(red: 100/255,green: 0/255,blue: 0/255,alpha:1);
    let WHITE               =   UIColor(red: 255/255,green: 255/255,blue: 255/255,alpha:1);
    
    let dvrLabel            =   UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let powerLabel          =   UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let powerStatusLabel    =   UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let stateLabel          =   UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let stateStatusLabel    =   UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = RED;
        
        setLabel(label:dvrLabel,text:"My DVR",color: WHITE,size: 20)

        self.view.addSubview(dvrLabel)
        dvrLabel.translatesAutoresizingMaskIntoConstraints = false
        dvrLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dvrLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true

        setLabel(label:powerLabel,text:"DVR Power:",color: WHITE,size: 20)

        self.view.addSubview(powerLabel)
        powerLabel.translatesAutoresizingMaskIntoConstraints = false
        powerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -10).isActive = true
        powerLabel.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -60).isActive = true
        
        setLabel(label:stateLabel,text:"State:",color: WHITE,size: 20)

        self.view.addSubview(stateLabel)
        stateLabel.translatesAutoresizingMaskIntoConstraints = false
        stateLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 20).isActive = true
        stateLabel.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -60).isActive = true

        setLabel(label:powerStatusLabel, text:"On",color: WHITE,size: 20)
        self.view.addSubview(powerStatusLabel)
        powerStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        powerStatusLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -10).isActive = true
        powerStatusLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        
        setLabel(label:stateStatusLabel, text:"",color: WHITE,size: 20)
        self.view.addSubview(stateStatusLabel)
        stateStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        stateStatusLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 20).isActive = true
        stateStatusLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
    }
    
    func setLabel(label: UILabel,text: String,color: UIColor,size: CGFloat) {
        
        label.textColor = color;
        label.font = UIFont(name: "Chalkboard SE",size: size)
        label.text = text;
        label.numberOfLines = 1;
        label.textAlignment = .left

    }
    
    public func SetPower(isOn:Bool){
        powerStatusLabel.text = isOn ? "On" : "Off"
    }
    
    public func SetState(state:String){
        stateStatusLabel.text = state
    }
}
