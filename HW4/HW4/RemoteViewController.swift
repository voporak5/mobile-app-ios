//
//  RemoveViewController.swift
//  HW4
//
//  Created by Bluestreet Mac on 1/28/23.
//

import UIKit

class RemoteViewController: UIViewController {

    let RED     =   UIColor(red: 100/255,green: 100/255,blue: 0/255,alpha:1);
    let WHITE     =   UIColor(red: 255/255,green: 255/255,blue: 255/255,alpha:1);
    
    var firstDigit = ""
    
    let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let powerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let volumeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let channelLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    
    var channelSetAction: (Int) -> () = { (val:Int) in print(val) }
    var channelIncrementAction: () -> () = { print("Channel Increment") }
    var channelDecrementAction: () -> () = { print("Channel Decrement") }
    var volumeSetAction: (Int) -> () = { (val:Int) in print("Volume Changed") }
    var powerSwitchedAction: (Bool) -> () = { (val:Bool) in print("Power Flipped") }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = RED;
        
        
        setLabel(label:headerLabel,text:"My Remote Control",color: WHITE,size: 25)
        self.view.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 10).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        setLabel(label:powerLabel,text:"Power:",color: WHITE,size: 20)
        self.view.addSubview(powerLabel)
        powerLabel.translatesAutoresizingMaskIntoConstraints = false
        powerLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 50).isActive = true
        powerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        
        
        setLabel(label:volumeLabel,text:"Volume:",color: WHITE,size: 20)
        self.view.addSubview(volumeLabel)
        volumeLabel.translatesAutoresizingMaskIntoConstraints = false
        volumeLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        volumeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        
        
        setLabel(label:channelLabel,text:"Channel:",color: WHITE,size: 20)
        self.view.addSubview(channelLabel)
        channelLabel.translatesAutoresizingMaskIntoConstraints = false
        channelLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 150).isActive = true
        channelLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
    }

    func getButtonNumberPressAction(val: String, label: UILabel) -> UIAction {
        
        let numberPressAction = UIAction() { (action) in
            
            if self.firstDigit == "" {
                self.firstDigit = val
            }
            else {
                let newChannelString = self.firstDigit + val
                let newChannelInt = Int(newChannelString)
                self.firstDigit = ""
                self.channelSetAction(newChannelInt ?? 00)
            }            
        }
                
        return numberPressAction
    }
    
    func getIncrementChannelAction(val: String, label: UILabel) -> UIAction {
        
        let numberPressAction = UIAction() { (action) in
            
            
            /*if(val == "=") {
                self.compute(label: label)
            }
            else {
                self.storeInputAndUpdateDisplay(val: Character(val),label: label)
            }*/
        }
                
        return numberPressAction
    }
    
    func getDecrementChannelAction(val: String, label: UILabel) -> UIAction {
        
        let numberPressAction = UIAction() { (action) in
            /*if(val == "=") {
                self.compute(label: label)
            }
            else {
                self.storeInputAndUpdateDisplay(val: Character(val),label: label)
            }*/
        }
                
        return numberPressAction
    }
    
    public func setChannelSetObserver(callback:  @escaping (Int) -> Void) {
        self.channelSetAction = callback;
    }
    
    public func setIncrementObserver(callback:  @escaping () -> Void) {
        self.channelIncrementAction = callback;
    }
    
    public func setDecrementObserver(callback:  @escaping () -> Void) {
        self.channelDecrementAction = callback;
    }
    
    public func setVolumeSetObserver(callback:  @escaping (Int) -> Void) {
        self.volumeSetAction = callback;
    }
    
    public func setPowerSwitchedObserver(callback:  @escaping (Bool) -> Void) {
        self.powerSwitchedAction = callback;
    }
    
    func setLabel(label: UILabel,text: String,color: UIColor,size: CGFloat) {
        
        label.textColor = color;
        label.font = UIFont(name: "Chalkboard SE",size: size)
        label.text = text;
        label.numberOfLines = 1;
        label.textAlignment = .left

    }
}
