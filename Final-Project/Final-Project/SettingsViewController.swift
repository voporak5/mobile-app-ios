//
//  TelevisionViewController.swift
//  HW4
//
//  Created by Bluestreet Mac on 1/28/23.
//

import UIKit

class SettingsViewController: UIViewController {

    let RED     =   UIColor(red: 100/255,green: 0/255,blue: 0/255,alpha:1);
    let WHITE               =   UIColor(red: 255/255,green: 255/255,blue: 255/255,alpha:1);
    
    let titleLabel            =   UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 150))
    //let creditsLabel          =   UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    
    var volumeSetAction: (Float) -> ()        =   { (val:Float) in print("Volume Changed") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = RED;
        
        self.view.addSubview(titleLabel)
        self.setLabel(label:self.titleLabel,text:"Volume",color: WHITE,size: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30).isActive = true

        addVolumeSlider()
        
        let closeBtn = addButton(label: "Close")

        closeBtn.addAction(UIAction() { (action) in
            self.dismiss(animated: true)
        }, for: UIControl.Event.touchDown)
        self.view.addSubview(closeBtn)
        
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50).isActive = true
        closeBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,constant: 50).isActive = true
    }
    
    func setLabel(label: UILabel,text: String,color: UIColor,size: CGFloat) {
        
        label.textColor = color;
        label.font = UIFont(name: "Chalkboard SE",size: size)
        label.text = text;
        label.numberOfLines = 3;
        label.textAlignment = .center

    }
    
    func addButton(label: String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50));
        button.setTitle(label, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont(name:"GillSans",size:18)
        button.setTitleColor(.white, for: UIControl.State.normal)
        
        return button;
    }
    
    func getSliderValChangeAction(slider: UISlider) -> UIAction {
                
        let action = UIAction() { (action) in
            
            self.volumeSetAction(slider.value)
        }
                
        return action
        
    }

    public func setVolumeSetObserver(callback:  @escaping (Float) -> Void) {
        self.volumeSetAction = callback;
    }

    func addVolumeSlider() {
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        slider.minimumValue = 0
        slider.maximumValue = 1
        let action = getSliderValChangeAction(slider: slider)
        slider.addAction(action, for: .valueChanged)
        slider.value = 1
        self.view.addSubview(slider)
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.topAnchor.constraint(equalTo: view.topAnchor,constant: 105).isActive = true
        slider.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -60).isActive = true
        slider.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
    }

}

