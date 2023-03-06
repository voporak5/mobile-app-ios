//
//  ViewController.swift
//  
//
//  Created by Bluestreet Mac on 2/25/23.
//

import UIKit

class GUIViewController: UIViewController {

    var pauseAction: () -> ()        =   { print("Pause Action") }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear
        view.isOpaque = false

        let quitBtn = addButton(label: "Pause")

        quitBtn.addAction(UIAction() { (action) in
            self.pauseAction()
        }, for: UIControl.Event.touchDown)
        self.view.addSubview(quitBtn)
        
        quitBtn.translatesAutoresizingMaskIntoConstraints = false
        quitBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,constant: 0).isActive = true
        quitBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50).isActive = true
        
    }

    public func setPauseObserver(callback:  @escaping () -> Void) {
        self.pauseAction = callback;
    }

    func addButton(label: String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50));
        button.setTitle(label, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont(name:"GillSans",size:18)
        button.setTitleColor(.blue, for: UIControl.State.normal)
        
        return button;
    }
}

