//
//  ViewController.swift
//
//
//  Created by Bluestreet Mac on 2/25/23.
//

import UIKit

class PausedViewController: UIViewController {

    var quitAction: () -> ()        =   { print("Quit Action") }
    var resumeAction: () -> ()      =   { print("Resume Action") }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear
        view.isOpaque = false

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

    public func setQuitObserver(callback:  @escaping () -> Void) {
        self.quitAction = callback;
    }
    
    public func setResumeObserver(callback:  @escaping () -> Void) {
        self.resumeAction = callback;
    }

    func addButton(label: String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50));
        button.setTitle(label, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont(name:"GillSans",size:18)
        button.setTitleColor(.blue, for: UIControl.State.normal)
        
        return button;
    }
}

