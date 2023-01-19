//
//  ViewController.swift
//  HW3
//
//  Created by Bluestreet Mac on 1/18/23.
//

import UIKit

class ViewController: UIViewController {

    let CORNFLOWER_BLUE     =   UIColor(red: 100/255,green: 149/255,blue: 237/255,alpha:1);
    

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
                
                let numberPressAction = getNumberPressAction(val: n)
                button.addAction(numberPressAction, for: UIControl.Event.touchDown)
                
                self.view.addSubview(button)
            }
        }
        
        let btnAdd = addButton(label: "+")
        btnAdd.center = CGPoint(x: center.x-100, y: center.y + 150);
        let addPressAction = getAddPressAction()
        btnAdd.addAction(addPressAction, for: UIControl.Event.touchDown)
        self.view.addSubview(btnAdd)
        
        let button = addButton(label: "0")
        button.center = CGPoint(x: center.x, y: center.y + 150);
        let numberPressAction = getNumberPressAction(val: 0)
        button.addAction(numberPressAction, for: UIControl.Event.touchDown)
        self.view.addSubview(button)
        
        let btnEval = addButton(label: "=")
        btnEval.center = CGPoint(x: center.x+100, y: center.y + 150);
        let evaluatePressAction = getEvaluatePressAction()
        btnEval.addAction(evaluatePressAction, for: UIControl.Event.touchDown)
        self.view.addSubview(btnEval)
    }
    
    func addButton(label: String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100));
        button.setTitle(label, for: UIControl.State.normal)
        button.setTitleColor(CORNFLOWER_BLUE, for: UIControl.State.normal)
        
        return button;
    }
    
    func getNumberPressAction(val: Int) -> UIAction {
        
        let numberPressAction = UIAction(title: String(val)) { (action) in
            print(val)
        }
                
        return numberPressAction
    }
    
    func getAddPressAction() -> UIAction {
        
        let addPressAction = UIAction(title: "Add") { (action) in
            print("add")
        }
                
        return addPressAction
    }
    
    func getEvaluatePressAction() -> UIAction {
        
        let evaluatePressAction = UIAction(title: "Evaluate") { (action) in
            print("evaluate")
        }
                
        return evaluatePressAction
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

