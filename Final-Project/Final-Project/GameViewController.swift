//
//  GameViewController.swift
//  Final-Project
//
//  Created by Bluestreet Mac on 2/27/23.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var mainMenuViewController = MainMenuViewController()
    var guiController = GUIViewController()
    var pausedViewController = PausedViewController()
    var game : GameScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            
            game = GameScene()
            game?.scaleMode = .aspectFill

            view.presentScene(game)
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
        addChild(mainMenuViewController)
        self.view.addSubview(mainMenuViewController.view);
        mainMenuViewController.didMove(toParent: self)
        mainMenuViewController.setLevelSelectObserver(callback: onLevelSelect)
        
        game?.setLevelCompleteObserver(callback: onLevelComplete)
        
        guiController.setPauseObserver(callback: onPause)
        pausedViewController.setResumeObserver(callback: onResume)
        pausedViewController.setQuitObserver(callback: onQuit)
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func onLevelSelect(level: Level){
        game?.loadLevel(level: level)
        mainMenuViewController.removeFromParent()
        mainMenuViewController.view.removeFromSuperview()
        
        addChild(guiController)
        self.view.addSubview(guiController.view);
        guiController.didMove(toParent: self)
    }
    
    func onLevelComplete(){
        addChild(mainMenuViewController)
        self.view.addSubview(mainMenuViewController.view);
        mainMenuViewController.didMove(toParent: self)
        
        guiController.removeFromParent()
        guiController.view.removeFromSuperview()
    }
    
    func onPause(){
        game?.pause()
        
        addChild(pausedViewController)
        self.view.addSubview(pausedViewController.view);
        pausedViewController.didMove(toParent: self)
    }
    
    func onResume(){
        game?.resume()
        pausedViewController.removeFromParent()
        pausedViewController.view.removeFromSuperview()
    }
    
    func onQuit(){
        game?.end()
        pausedViewController.removeFromParent()
        pausedViewController.view.removeFromSuperview()
    }
}
