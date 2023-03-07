//
//  ViewController.swift
//  
//
//  Created by Bluestreet Mac on 2/25/23.
//

import UIKit

class GUIViewController: UIViewController {

    var stars: [UIImageView] = []
    
    var pauseAction: () -> ()        =   { print("Pause Action") }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear
        view.isOpaque = false

        var star = UIImageView()
        self.view.addSubview(star)
        star.frame = CGRect(x: 27, y: 34, width: 54, height: 68)
        star.contentMode = .scaleAspectFill
        star.translatesAutoresizingMaskIntoConstraints = false
        star.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: -140).isActive = true
        star.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0).isActive = true
        self.view.addSubview(star)
        stars.append(star)

        star = UIImageView()
        self.view.addSubview(star)
        star.contentMode = .scaleAspectFill
        star.translatesAutoresizingMaskIntoConstraints = false
        star.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: -80).isActive = true
        star.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0).isActive = true
        self.view.addSubview(star)
        stars.append(star)
        
        star = UIImageView()
        self.view.addSubview(star)
        star.contentMode = .scaleAspectFill
        star.translatesAutoresizingMaskIntoConstraints = false
        star.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: -25).isActive = true
        star.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0).isActive = true
        self.view.addSubview(star)
        stars.append(star)
        
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
    
    public func setStars(starsEarned:Int){
        for (index, star) in stars.enumerated() {
            if(index < starsEarned){
                star.image = UIImage(named: "star-filled")
            }
            else {
                star.image = UIImage(named: "star-outline")
            }
        }
    }

    func addButton(label: String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50));
        button.setTitle(label, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont(name:"GillSans",size:18)
        button.setTitleColor(.blue, for: UIControl.State.normal)
        
        return button;
    }
    
    
}

