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

    var mainMenuViewController  = MainMenuViewController()
    var guiController           = GUIViewController()
    var pausedViewController    = PausedViewController()
    var gameOverViewController  = GameOverViewController()
    
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
            //view.showsPhysics = true
            
        }
        
        addChild(mainMenuViewController)
        self.view.addSubview(mainMenuViewController.view);
        mainMenuViewController.didMove(toParent: self)
        mainMenuViewController.setLevelSelectObserver(callback: onLevelSelect)
        mainMenuViewController.setVolumeSetObserver(callback: onVolumeChanged)
        
        game?.setLevelCompleteObserver(callback: onLevelComplete)
        game?.setStarsEarnedObserver(callback: onStarEarned)
        
        guiController.setPauseObserver(callback: onPause)
        pausedViewController.setResumeObserver(callback: onResume)
        pausedViewController.setQuitObserver(callback: onQuit)
        
        gameOverViewController.setContinueObserver(callback: onGameOverContinue)
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
        
        guiController.setStars(starsEarned: 0)
    }
    
    func onVolumeChanged(volume:Float){
        game?.setVolume(volume: volume)
    }
    
    func onLevelComplete(level:Level,score:Int,stars:Int){
        
        addChild(gameOverViewController)
        self.view.addSubview(gameOverViewController.view);
        gameOverViewController.didMove(toParent: self)
        gameOverViewController.setConstraints()
        
        gameOverViewController.set(title: level.title ?? "",score:score,starsEarned: stars)
        
        guiController.removeFromParent()
        guiController.view.removeFromSuperview()
        
    }
    
    func onPause(){
        game?.pause()
        
        addChild(pausedViewController)
        self.view.addSubview(pausedViewController.view);
        pausedViewController.didMove(toParent: self)
        pausedViewController.setConstraints()
        
        
        guiController.removeFromParent()
        guiController.view.removeFromSuperview()
    }
    
    func onResume(){
        game?.resume()
        pausedViewController.removeFromParent()
        pausedViewController.view.removeFromSuperview()
        
        addChild(guiController)
        self.view.addSubview(guiController.view);
        guiController.didMove(toParent: self)
    }
    
    func onQuit(){
        game?.end()
        pausedViewController.removeFromParent()
        pausedViewController.view.removeFromSuperview()
    }
    
    func onGameOverContinue(){
        addChild(mainMenuViewController)
        self.view.addSubview(mainMenuViewController.view);
        mainMenuViewController.didMove(toParent: self)
        
        gameOverViewController.removeFromParent()
        gameOverViewController.view.removeFromSuperview()
    }
    
    func onStarEarned(stars:Int){
        guiController.setStars(starsEarned: stars)
    }
    
    
}
