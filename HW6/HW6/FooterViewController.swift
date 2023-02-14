//
//  RemoteViewController.swift
//  HW4
//
//  Created by Bluestreet Mac on 1/28/23.
//

import UIKit

class FooterViewController: UIViewController {

    let WHITE               =   UIColor(red: 255/255,green: 255/255,blue: 255/255,alpha:1);
    let CORNFLOWER_BLUE     =   UIColor(red: 100/255,green: 149/255,blue: 237/255,alpha:1);
    
    
    var firstDigit = ""
    var elements : [UIControl] = []
    
    var buttonPressedAction: () -> ()    =   { print("Channel Increment") }
    var didBuild = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = WHITE;
                
    }
    
    public func build(label:String){
        if didBuild {
            return;
        }
        
        let btn = self.addButton(label:label)
        self.view.addSubview(btn)
        
        btn.addAction(UIAction() { (action) in
            self.buttonPressedAction()
        }, for: UIControl.Event.touchDown)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor,constant: 0).isActive = true
        btn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        
        
    }

 
    func addButton(label: String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50));
        button.setTitle(label, for: UIControl.State.normal)
        button.setTitleColor(CORNFLOWER_BLUE, for: UIControl.State.normal)
        button.setTitleColor(.gray, for: UIControl.State.disabled)
        
        return button;
    }
    
    

    
    public func setButtonPressedObserver(callback:  @escaping () -> Void) {
        self.buttonPressedAction = callback;
    }

    
    func setLabel(label: UILabel,text: String,color: UIColor,size: CGFloat) {
        
        label.textColor = color;
        label.font = UIFont(name: "Chalkboard SE",size: size)
        label.text = text;
        label.numberOfLines = 2;
        label.textAlignment = .left

    }
}
