//
//  ViewController.swift
//  HW8
//
//  Created by Bluestreet Mac on 2/25/23.
//

import UIKit

class MainMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var levelArr: [Level] = []
    var creditsViewController = CreditsViewController()
    
    var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        levelArr.append(Level(image: "what-is-love", title: "What Is Love?"))
        levelArr.append(Level(image: "steve-bill", title: "Jobs vs Gates"))
        levelArr.append(Level(image: "artist-tmnt", title: "TMNT vs Art"))
        
        let barHeight: CGFloat = self.view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(LevelViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)

        let closeBtn = addButton(label: "Credits")

        closeBtn.addAction(UIAction() { (action) in
            self.present(self.creditsViewController,animated:true,completion:nil)
        }, for: UIControl.Event.touchDown)
        self.view.addSubview(closeBtn)
        
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0).isActive = true
        closeBtn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: -50).isActive = true
        
        
        
        
        let settingsBtn = addButton(label: "Settings")

        settingsBtn.addAction(UIAction() { (action) in
            self.present(self.creditsViewController,animated:true,completion:nil)
        }, for: UIControl.Event.touchDown)
        self.view.addSubview(settingsBtn)
        
        settingsBtn.translatesAutoresizingMaskIntoConstraints = false
        settingsBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0).isActive = true
        settingsBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,constant: 50).isActive = true
        
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //self.movieViewController.SetMovie(movie: moviesArr[indexPath.row])
        //self.present(self.movieViewController,animated:true,completion:nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levelArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! LevelViewCell
        cell.level = levelArr[indexPath.row]
        //cell.textLabel!.text = "\(levelArr[indexPath.row].name)"
        //cell.imag
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }

    func addButton(label: String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50));
        button.setTitle(label, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont(name:"GillSans",size:18)
        button.setTitleColor(.blue, for: UIControl.State.normal)
        
        return button;
    }
}

