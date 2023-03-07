//
//  ViewController.swift
//
//
//  Created by Bluestreet Mac on 2/25/23.
//

import UIKit

class PausedViewController: UIViewController {

    let titleLabel            =   UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 150))
    
    var quitAction: () -> ()        =   { print("Quit Action") }
    var resumeAction: () -> ()      =   { print("Resume Action") }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        //view.isOpaque = false

        self.view.addSubview(titleLabel)
        self.setLabel(label:self.titleLabel,text:"Paused",color: .black,size: 30)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 25).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        
        let quitBtn = addButton(label: "Quit")

        quitBtn.addAction(UIAction() { (action) in
            self.quitAction()
        }, for: UIControl.Event.touchDown)
        self.view.addSubview(quitBtn)
        
        quitBtn.translatesAutoresizingMaskIntoConstraints = false
        quitBtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor,constant: 0).isActive = true
        quitBtn.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor,constant: 0).isActive = true
        
        
        let resumeBtn = addButton(label: "Resume")

        resumeBtn.addAction(UIAction() { (action) in
            self.resumeAction()
        }, for: UIControl.Event.touchDown)
        self.view.addSubview(resumeBtn)
        
        resumeBtn.translatesAutoresizingMaskIntoConstraints = false
        resumeBtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor,constant: 0).isActive = true
        resumeBtn.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor,constant: 50).isActive = true
        
    }
    
    public func setConstraints() {
        
        if let parent = self.parent {
            self.view.translatesAutoresizingMaskIntoConstraints = false
            
            
            self.view.centerXAnchor.constraint(equalTo: parent.view.safeAreaLayoutGuide.centerXAnchor,constant: 0).isActive = true
            
            self.view.leadingAnchor.constraint(equalTo: parent.view.leadingAnchor,constant: 50).isActive = true
            
            self.view.trailingAnchor.constraint(equalTo: parent.view.trailingAnchor,constant: -50).isActive = true
            
            self.view.centerYAnchor.constraint(equalTo: parent.view.centerYAnchor,constant: 0).isActive = true
            self.view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        }
        
        
    }

    public func setQuitObserver(callback:  @escaping () -> Void) {
        self.quitAction = callback;
    }
    
    public func setResumeObserver(callback:  @escaping () -> Void) {
        self.resumeAction = callback;
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
        button.setTitleColor(.blue, for: UIControl.State.normal)
        
        return button;
    }
}

