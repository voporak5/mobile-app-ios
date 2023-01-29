//
//  RemoteViewController.swift
//  HW4
//
//  Created by Bluestreet Mac on 1/28/23.
//

import UIKit

class RemoteViewController: UIViewController {

    let RED     =   UIColor(red: 100/255,green: 100/255,blue: 0/255,alpha:1);
    let WHITE     =   UIColor(red: 255/255,green: 255/255,blue: 255/255,alpha:1);
    let CORNFLOWER_BLUE     =   UIColor(red: 100/255,green: 149/255,blue: 237/255,alpha:1);
    
    let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let powerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let volumeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let channelLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let favoriteLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let segment = UISegmentedControl(items: ["ABC","NBC","CBS","FOX"])
    
    var firstDigit = ""
    var elements : [UIControl] = []
    
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
        
        setLabel(label:powerLabel,text:"Power",color: WHITE,size: 20)
        self.view.addSubview(powerLabel)
        powerLabel.translatesAutoresizingMaskIntoConstraints = false
        powerLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 50).isActive = true
        powerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        
        
        setLabel(label:volumeLabel,text:"Volume",color: WHITE,size: 20)
        self.view.addSubview(volumeLabel)
        volumeLabel.translatesAutoresizingMaskIntoConstraints = false
        volumeLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        volumeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        
        
        setLabel(label:channelLabel,text:"Channel",color: WHITE,size: 20)
        self.view.addSubview(channelLabel)
        channelLabel.translatesAutoresizingMaskIntoConstraints = false
        channelLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 150).isActive = true
        channelLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        setLabel(label:favoriteLabel,text:"Favorite\nChannel",color: WHITE,size: 20)
        self.view.addSubview(favoriteLabel)
        favoriteLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 300).isActive = true
        favoriteLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        
        
        addPowerButton()
        
        addSlider()
        
        addChannelButton(digit: "0",yOffset: 150,xOffset: -50)
        addChannelButton(digit: "1",yOffset: 150,xOffset: 0)
        addChannelButton(digit: "2",yOffset: 150,xOffset: 50)
        addChannelButton(digit: "3",yOffset: 150,xOffset: 100)
        addChannelButton(digit: "4",yOffset: 200,xOffset: 0)
        addChannelButton(digit: "5",yOffset: 200,xOffset: 50)
        addChannelButton(digit: "6",yOffset: 200,xOffset: 100)
        addChannelButton(digit: "7",yOffset: 250,xOffset: 0)
        addChannelButton(digit: "8",yOffset: 250,xOffset: 50)
        addChannelButton(digit: "9",yOffset: 250,xOffset: 100)
        
        addIncrementButton(yOffset: 200, xOffset: -50)
        addDecrementButton(yOffset: 250, xOffset: -50)
        
        addFavoriteChannelSegment()
    }
    
    func addFavoriteChannelSegment(){
        let segment = self.segment
        segment.frame = CGRect(x: 0, y: 0, width: 250, height: 100)
        self.view.addSubview(segment)
        let action = getSegmentChangeAction(segment: segment)
        segment.addAction(action, for: .valueChanged)
        
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.topAnchor.constraint(equalTo: view.topAnchor,constant: 315).isActive = true
        segment.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 20).isActive = true
        
        
        elements.append(segment)
    }
    
    func addPowerButton() {
        let toggle = UISwitch(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let toggleChangedAction = getToggleChangeAction(toggle: toggle)
        toggle.isOn = true
        toggle.addAction(toggleChangedAction, for: .valueChanged)
        
        self.view.addSubview(toggle)
        
        toggle.translatesAutoresizingMaskIntoConstraints = false
        toggle.topAnchor.constraint(equalTo: view.topAnchor,constant: 50).isActive = true
        toggle.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
    }

    func addChannelButton(digit: String,yOffset: CGFloat, xOffset: CGFloat) {
        let btn = addButton(label: digit)

        let addPressAction = getButtonNumberPressAction(val:digit)
        btn.addAction(addPressAction, for: UIControl.Event.touchDown)
        self.view.addSubview(btn)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.topAnchor.constraint(equalTo: view.topAnchor,constant: yOffset).isActive = true
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xOffset).isActive = true

        elements.append(btn)
        
    }
    
    func addIncrementButton(yOffset: CGFloat, xOffset: CGFloat) {
        let btn = addButton(label: "Ch +")

        let action = getIncrementChannelAction()
        btn.addAction(action, for: UIControl.Event.touchDown)
        self.view.addSubview(btn)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.topAnchor.constraint(equalTo: view.topAnchor,constant: yOffset).isActive = true
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xOffset).isActive = true

        elements.append(btn)
        
    }
    
    func addDecrementButton(yOffset: CGFloat, xOffset: CGFloat) {
        let btn = addButton(label: "Ch -")

        let action = getDecrementChannelAction()
        btn.addAction(action, for: UIControl.Event.touchDown)
        self.view.addSubview(btn)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.topAnchor.constraint(equalTo: view.topAnchor,constant: yOffset).isActive = true
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xOffset).isActive = true

        elements.append(btn)
        
    }
    
    func addSlider() {
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        slider.minimumValue = 0
        slider.maximumValue = 100
        let sliderChangedAction = getSliderValChangeAction(slider: slider)
        slider.addAction(sliderChangedAction, for: .valueChanged)
        slider.value = 50
        self.view.addSubview(slider)
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.topAnchor.constraint(equalTo: view.topAnchor,constant: 105).isActive = true
        slider.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -60).isActive = true
        slider.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        
        elements.append(slider)
        
    }
    
    func addButton(label: String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50));
        button.setTitle(label, for: UIControl.State.normal)
        button.setTitleColor(CORNFLOWER_BLUE, for: UIControl.State.normal)
        button.setTitleColor(.gray, for: UIControl.State.disabled)
        
        return button;
    }
    
    func getButtonNumberPressAction(val: String) -> UIAction {
        
        let numberPressAction = UIAction() { (action) in
            
            if self.firstDigit == "" {
                self.firstDigit = val
            }
            else {
                let newChannelString = self.firstDigit + val
                let newChannelInt = Int(newChannelString)
                self.firstDigit = ""
                self.segment.selectedSegmentIndex = -1
                self.channelSetAction(newChannelInt ?? 00)
            }            
        }
                
        return numberPressAction
    }
    
    func getToggleChangeAction(toggle: UISwitch) -> UIAction {
        
        let toggleChangedAction = UIAction() { (action) in
            
            self.powerSwitchedAction(toggle.isOn)
            
            for element in self.elements {
                
                element.isEnabled = toggle.isOn
        
            }
        }
                
        return toggleChangedAction
        
    }
    
    func getSliderValChangeAction(slider: UISlider) -> UIAction {
                
        let sliderChangedAction = UIAction() { (action) in
            
            self.volumeSetAction(Int(slider.value))
        }
                
        return sliderChangedAction
        
    }
    
    func getIncrementChannelAction() -> UIAction {
        
        let action = UIAction() { (action) in
            
            self.segment.selectedSegmentIndex = -1
            self.channelIncrementAction()
        }
                
        return action
    }
    
    func getDecrementChannelAction() -> UIAction {
        
        let action = UIAction() { (action) in
            self.segment.selectedSegmentIndex = -1
            self.channelDecrementAction()
        }
                
        return action
    }
    
    func getSegmentChangeAction(segment: UISegmentedControl) -> UIAction {
                
        let action = UIAction() { (action) in
            
            self.channelSetAction(segment.selectedSegmentIndex + 1)
        }
                
        return action
        
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
        label.numberOfLines = 2;
        label.textAlignment = .left

    }
}
