//
//  RemoteViewController.swift
//  HW4
//
//  Created by Bluestreet Mac on 1/28/23.
//

import UIKit

class DVRRemoteViewController: UIViewController {

    let RED                 =   UIColor(red: 76/255,green: 128/255,blue: 54/255,alpha:1);
    let WHITE               =   UIColor(red: 255/255,green: 255/255,blue: 255/255,alpha:1);
    let CORNFLOWER_BLUE     =   UIColor(red: 100/255,green: 149/255,blue: 237/255,alpha:1);
    
    let headerLabel     =   UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let powerLabel      =   UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        
    var stateChangedAction: (String) -> ()       =   { (val:String) in print(val) }
    var powerSwitchedAction: (Bool) -> ()   =   { (val:Bool) in print("Power Flipped") }
    
    var state = "Stopped"
    var elements : [UIControl] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = RED;
 
        setupHeader();
        setupPower();
        setupStateButtons();
        setState(state: "Stopped")
    }
    
    func setupHeader(){
        setLabel(label:headerLabel,text:"DVR Remote Control",color: WHITE,size: 25)
        self.view.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 10).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupPower(){
        setLabel(label:powerLabel,text:"Power",color: WHITE,size: 20)
        self.view.addSubview(powerLabel)
        powerLabel.translatesAutoresizingMaskIntoConstraints = false
        powerLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 50).isActive = true
        powerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        addPowerButton()
    }
    
    func setupStateButtons(){
        
        addStateButton(digit: "Play",yOffset: 100,xOffset: -100,action:  UIAction(){ (action) in
            
            self.setState(state: "Playing")
            
        });
        addStateButton(digit: "Stop",yOffset: 100,xOffset: 0,action: UIAction(){ (action) in
            
            self.setState(state: "Stopped")
            
        })
        addStateButton(digit: "Pause",yOffset: 100,xOffset: 100,action: UIAction(){ (action) in
            
            if self.state != "Playing" {
                self.showAlert { UIAlertAction in
                    self.setState(state: "Paused")
                }
                return;
            }
            
            self.setState(state: "Paused")
            
        })
        addStateButton(digit: "Fast Forward",yOffset: 150,xOffset: 100,action: UIAction(){ (action) in
            
            if self.state != "Playing" {
                self.showAlert { UIAlertAction in
                    self.setState(state: "Fast Forwarding")
                }
                return;
            }
            
            self.setState(state: "Fast Forwarding")
            
        })
        addStateButton(digit: "Fast Rewind",yOffset: 150,xOffset: -100,action: UIAction(){ (action) in
            
            if self.state != "Playing" {
                self.showAlert { UIAlertAction in
                    self.setState(state: "Fast Rewinding")
                }
                return;
            }
            
            self.setState(state: "Fast Rewinding")
            
        })
        addStateButton(digit: "Record",yOffset: 200,xOffset: -100,action: UIAction(){ (action) in
            
            if self.state != "Stopped" {
                self.showAlert { UIAlertAction in
                    self.setState(state: "Recording")
                }
                return;
            }
            
            self.setState(state: "Recording")
            
        })
                
        
    }
    
    func setState(state:String) {
        self.state = state;
        self.stateChangedAction(state)
    }
    
    func addPowerButton() {
        let toggle = UISwitch(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let action = getPowerChangedAction(toggle: toggle)
        toggle.isOn = true
        toggle.addAction(action, for: .valueChanged)
        
        self.view.addSubview(toggle)
        
        toggle.translatesAutoresizingMaskIntoConstraints = false
        toggle.topAnchor.constraint(equalTo: view.topAnchor,constant: 50).isActive = true
        toggle.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
    }

    func addStateButton(digit: String,yOffset: CGFloat, xOffset: CGFloat, action: UIAction) {
        let btn = addButton(label: digit)

        btn.addAction(action, for: UIControl.Event.touchDown)
        self.view.addSubview(btn)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.topAnchor.constraint(equalTo: view.topAnchor,constant: yOffset).isActive = true
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xOffset).isActive = true
        
        self.elements.append(btn)
    }

    
    func addButton(label: String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50));
        button.setTitle(label, for: UIControl.State.normal)
        button.setTitleColor(CORNFLOWER_BLUE, for: UIControl.State.normal)
        button.setTitleColor(.gray, for: UIControl.State.disabled)
        
        return button;
    }

    
    func getPowerChangedAction(toggle: UISwitch) -> UIAction {
        
        let action = UIAction() { (action) in
            
            self.powerSwitchedAction(toggle.isOn)
            
            for element in self.elements {
                
                element.isEnabled = toggle.isOn
        
            }
            
            if toggle.isOn == false {
                self.setState(state: "Stopped")
            }
        }
                
        return action
        
    }

    
    public func setStateChangedObserver(callback:  @escaping (String) -> Void) {
        self.stateChangedAction = callback;
    }
    
    public func setPowerSwitchedObserver(callback:  @escaping (Bool) -> Void) {
        self.powerSwitchedAction = callback;
    }
    
    func setLabel(label: UILabel,text: String,color: UIColor,size: CGFloat) {
        
        label.textColor = color;
        label.font = UIFont(name: "Chalkboard SE",size: size)
        label.text = text;
        label.numberOfLines = 2;
        label.textAlignment = .left

    }
    
    func showAlert(callback:  @escaping (UIAlertAction) -> Void) {
        var dialogMessage = UIAlertController(title: "Error", message: "The operation is not allowed.\nForce Action?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default,handler: callback)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        
        self.present(dialogMessage, animated: true, completion: nil)
    }
}
