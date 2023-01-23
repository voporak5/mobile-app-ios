//
//  ViewController.swift
//  HW3
//
//  Created by Bluestreet Mac on 1/18/23.
//

import UIKit

class ViewController: UIViewController {

    let CORNFLOWER_BLUE     =   UIColor(red: 100/255,green: 149/255,blue: 237/255,alpha:1);
    var stack: [Character] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = self.view.center;
        
        let display = addNewLabel(text:"0",color: CORNFLOWER_BLUE,size: 50)
        display.center = CGPoint(x: center.x, y: 150);
        self.view.addSubview(display)
        
        for i in 1...3 {
            
            let y = (center.y - 250) + (CGFloat(i) * 100)
            
            for j in 1...3 {
                
                let x = (center.x-200) + (CGFloat(j) * 100)
                let n = ((i-1) * 3) + j
                let button = addButton(label: String(n))
                
                button.center = CGPoint(x: x, y: y);
                
                let buttonPressAction = getButtonPressAction(val: String(n), label: display)
                button.addAction(buttonPressAction, for: UIControl.Event.touchDown)
                
                self.view.addSubview(button)
            }
        }
        
        let btnAdd = addButton(label: "+")
        btnAdd.center = CGPoint(x: center.x-100, y: center.y + 150);
        let addPressAction = getButtonPressAction(val:"+",label: display)
        btnAdd.addAction(addPressAction, for: UIControl.Event.touchDown)
        self.view.addSubview(btnAdd)
        
        let button = addButton(label: "0")
        button.center = CGPoint(x: center.x, y: center.y + 150);
        let numberPressAction = getButtonPressAction(val:"0",label: display)
        button.addAction(numberPressAction, for: UIControl.Event.touchDown)
        self.view.addSubview(button)
        
        let btnEval = addButton(label: "=")
        btnEval.center = CGPoint(x: center.x+100, y: center.y + 150);
        let evaluatePressAction = getButtonPressAction(val:"=",label: display)
        btnEval.addAction(evaluatePressAction, for: UIControl.Event.touchDown)
        self.view.addSubview(btnEval)
    }
    
    func addButton(label: String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100));
        button.setTitle(label, for: UIControl.State.normal)
        button.setTitleColor(CORNFLOWER_BLUE, for: UIControl.State.normal)
        
        return button;
    }
    
    func getButtonPressAction(val: String, label: UILabel) -> UIAction {
        
        let numberPressAction = UIAction() { (action) in
            if(val == "=") {
                self.compute(label: label)
            }
            else {
                self.storeInputAndUpdateDisplay(val: Character(val),label: label)
            }
        }
                
        return numberPressAction
    }
    
    func compute(label: UILabel) {
        
        var input : String = "";
        var result : Int = 0;
        
        for char in stack.reversed() {
            
            if(char == "+") {
                result += Int(input) ?? 0
                input = ""
            }
            else {
                input.insert(char, at: input.startIndex)
            }
    
        }
        
        //Since there won't be a + at the very beginning
        //we will need to force addition here
        result += Int(input) ?? 0
        
        let input_str = String(result)
        label.text = ""
        stack = []
        
        for char in input_str {
            self.storeInputAndUpdateDisplay(val: char, label: label)
        }
    }
    
    func storeInputAndUpdateDisplay(val: Character, label: UILabel){
        stack.append(val)
        label.text?.append(val)
    }
    
    
    
    func addNewLabel(text: String,color: UIColor,size: CGFloat) -> UILabel {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width - 100, height: 200))
        label.textColor = color;
        label.font = UIFont(name: "Chalkboard SE",size: size)
        label.text = text;
        //Set to 0 to wrap text forever
        label.numberOfLines = 1;
        //label.lineBreakMode = .byWordWrapping;
        //label.sizeToFit()
        label.textAlignment = .right

        return label
    }


}

