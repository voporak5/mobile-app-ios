//
//  ViewController.swift
//
//
//  Created by Bluestreet Mac on 2/25/23.
//

import UIKit

class GameOverViewController: UIViewController {

    let BLACK               =   UIColor(red: 0/255,green: 0/255,blue: 0/255,alpha:1);
    
    let songLabel   =   UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 150))
    let scoreLabel  =   UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 150))
    
    var stars: [UIImageView] = []
    
    var continueAction: () -> ()        =   { print("Continue Action") }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        //view.isOpaque = false

        var star = UIImageView()
        self.view.addSubview(star)
        star.frame = CGRect(x: 27, y: 34, width: 54, height: 68)
        star.contentMode = .scaleAspectFill
        star.translatesAutoresizingMaskIntoConstraints = false
        star.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor,constant: -75).isActive = true
        star.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0).isActive = true
        self.view.addSubview(star)
        stars.append(star)

        star = UIImageView()
        self.view.addSubview(star)
        star.contentMode = .scaleAspectFill
        star.translatesAutoresizingMaskIntoConstraints = false
        star.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor,constant: 0).isActive = true
        star.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0).isActive = true
        self.view.addSubview(star)
        stars.append(star)
        
        star = UIImageView()
        self.view.addSubview(star)
        star.contentMode = .scaleAspectFill
        star.translatesAutoresizingMaskIntoConstraints = false
        star.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor,constant: 75).isActive = true
        star.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0).isActive = true
        self.view.addSubview(star)
        stars.append(star)
        
        self.view.addSubview(songLabel)
        //self.setLabel(label:self.songLabel,text:"Song:",color: .black,size: 20)
        songLabel.translatesAutoresizingMaskIntoConstraints = false
        songLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor,constant: 0).isActive = true
        songLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor,constant: -25).isActive = true
        
        self.view.addSubview(scoreLabel)
        //self.setLabel(label:self.scoreLabel,text:"Score:",color: .black,size: 20)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor,constant: 0).isActive = true
        scoreLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor,constant: 0).isActive = true
        
        let continueBtn = addButton(label: "Continue")

        continueBtn.addAction(UIAction() { (action) in
            self.continueAction()
        }, for: UIControl.Event.touchDown)
        self.view.addSubview(continueBtn)
        
        continueBtn.translatesAutoresizingMaskIntoConstraints = false
        continueBtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor,constant: 0).isActive = true
        continueBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -25).isActive = true
        
    }

    public func setContinueObserver(callback:  @escaping () -> Void) {
        self.continueAction = callback;
    }
    
    public func set(title:String,score:Int,starsEarned:Int){
        
        let songText = "Song: " + title
        let scoreText = "Score: " + String(score)
        
        self.setLabel(label:self.songLabel,text:songText,color: .black,size: 20)
        self.setLabel(label:self.scoreLabel,text:scoreText,color: .black,size: 20)
                
        for (index, star) in stars.enumerated() {
            if(index < starsEarned){
                star.image = UIImage(named: "star-filled")
            }
            else {
                star.image = UIImage(named: "star-outline")
            }
        }
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

