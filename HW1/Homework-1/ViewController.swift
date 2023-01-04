//
//  ViewController.swift
//  Homework-1
//
//  Created by Bluestreet Mac on 1/3/23.
//

import UIKit

class ViewController: UIViewController {

    let CORNFLOWER_BLUE     =   UIColor(red: 100/255,green: 149/255,blue: 237/255,alpha:1);
    let MICROSOFT_ORANGE    =   UIColor(red: 1,green: 187/255,blue: 0,alpha:1);
    let MICROSOFT_RED       =   UIColor(red: 246/255, green: 83/255, blue: 20/255, alpha: 1);
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = CORNFLOWER_BLUE;
        
        let center = self.view.center;

        let headerText = "Cameron Cintron";
        let header = addNewLabel(text: headerText,color: MICROSOFT_RED,size: 40);
        //position 100 units from the top
        header.center = CGPoint(x: center.x, y: 100);
        self.view.addSubview(header)
        
        let bodyText = "Here's a riddle\n\nWhat gets bigger the more you take away from it?";
        let body = addNewLabel(text: bodyText,color: MICROSOFT_ORANGE,size: 20);
        body.center = CGPoint(x: center.x, y: center.y);
        self.view.addSubview(body);
    }
    
    func addNewLabel(text: String,color: UIColor,size: CGFloat) -> UILabel {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 0))
        label.textColor = color;
        label.font = UIFont(name: "Chalkboard SE",size: size)
        label.textAlignment = .center
        label.text = text;
        //Set to 0 to wrap text forever
        label.numberOfLines = 0;
        label.lineBreakMode = .byWordWrapping;
        label.sizeToFit()
        return label
    }


}

