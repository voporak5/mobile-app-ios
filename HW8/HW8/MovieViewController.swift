//
//  TelevisionViewController.swift
//  HW4
//
//  Created by Bluestreet Mac on 1/28/23.
//

import UIKit

class MovieViewController: UIViewController {

    let RED     =   UIColor(red: 100/255,green: 0/255,blue: 0/255,alpha:1);
    let WHITE               =   UIColor(red: 255/255,green: 255/255,blue: 255/255,alpha:1);
    
    let titleLabel            =   UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 150))
    let releaseLabel          =   UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    
    let posterImageView = UIImageView()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = RED;
        
        self.view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30).isActive = true

        self.view.addSubview(releaseLabel)
        releaseLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 100).isActive = true
        releaseLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        let closeBtn = addButton(label: "Close")

        closeBtn.addAction(UIAction() { (action) in
            self.dismiss(animated: true)
        }, for: UIControl.Event.touchDown)
        self.view.addSubview(closeBtn)
        
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        closeBtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        
        
        posterImageView.frame = CGRect(x: 194.895/2, y: 150, width: 194.895, height: 300)
        self.view.addSubview(posterImageView)
        
    }
    
    func setLabel(label: UILabel,text: String,color: UIColor,size: CGFloat) {
        
        label.textColor = color;
        label.font = UIFont(name: "Chalkboard SE",size: size)
        label.text = text;
        label.numberOfLines = 3;
        label.textAlignment = .center

    }
    
    public func SetMovie(movie:Movie){
        
        self.setLabel(label:self.titleLabel,text:movie.name,color: WHITE,size: 20)
        self.setLabel(label:self.releaseLabel,text:movie.releaseDate,color: WHITE,size: 20)
        self.posterImageView.image = UIImage(named: movie.image)
        
    }
    
    func addButton(label: String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50));
        button.setTitle(label, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont(name:"GillSans",size:18)
        button.setTitleColor(.white, for: UIControl.State.normal)
        
        return button;
    }
}
