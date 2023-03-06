//
//  GameScene.swift
//  Final-Project
//
//  Created by Bluestreet Mac on 2/27/23.
//

import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene {
    
    
    var audioPlayer = AVAudioPlayer()
    var isPlaying = false
    var gamePaused = false;
    var index = 0
    var currentLevel: Level?
    var words: [SKLabelNode] = []
    var previousTime: Double = 0
    
    
    
    private var player : SKSpriteNode?
    
    var levelCompleteAction: () -> ()    =   { print("Level Complete") }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        
    }
    
    public func loadLevel(level:Level){
        currentLevel = level
        let sound = Bundle.main.path(forResource: level.song, ofType: "mp3")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            audioPlayer.play()
            //audioPlayer.currentTime
        }
        catch{
            print(error)
        }
        
        isPlaying = true
        gamePaused = false
        index = 0
    }
    
    
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = UIColor(red:1,green: 0,blue: 0,alpha: 1)
        self.player = SKSpriteNode(imageNamed: "player")
        print(self.size)
        if let player = self.player {
            print(self.size.width)
            //let offset = self.size.height/(-2) + 100 + 50
            player.position = CGPoint(x: 0.5, y: 0.15)
            player.size = CGSize(width: 200.0, height: 200.0)
            player.setScale(0.001)
            player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
            //player.physicsBody?.categoryBitMask = PHYSICS_LAYER_1
            //player.physicsBody?.collisionBitMask = PHYSICS_LAYER_1
            player.physicsBody?.affectedByGravity = false;
            //player.physicsBody?.contactTestBitMask = PHYSICS_LAYER_1
            self.addChild(player)
        }
    
    
        //physicsWorld.contactDelegate = self
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
        if(gamePaused){
            return;
        }
        
        if let player = self.player {
            player.position.x = pos.x
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
        if(gamePaused){
            return;
        }
        
        if let player = self.player {
            player.position.x = pos.x
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
   
        
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
    
        let deltaTime = currentTime - previousTime
        previousTime = currentTime

        if(gamePaused){
            return;
        }
        
        for label in words {
            
            label.position = CGPointMake(label.position.x, label.position.y - (deltaTime * 0.5))
            if(label.position.y < player?.position.y ?? 0){
                label.alpha = 0;
            }
        }
        
        // Called before each frame is rendered
        if(audioPlayer.isPlaying == false || audioPlayer.currentTime >= audioPlayer.duration) {
            if(isPlaying) {
                self.words = []
                levelCompleteAction()
            }
            
            return
        }
        
        if(index >= currentLevel?.lyrics?.count ?? -1) {
            return
        }
        
        if(audioPlayer.currentTime + 2 >= currentLevel?.lyrics?[index].time ?? 999999999999){
            addLyric()
        }
        
    }
    
    public func setLevelCompleteObserver(callback:  @escaping () -> Void) {
        self.levelCompleteAction = callback;
    }
    
    public func resume() {
        self.audioPlayer.play()
        self.gamePaused = false
    }
    
    public func pause() {
        self.gamePaused = true
        self.audioPlayer.pause()
    }
    
    public func end(){
        self.words = []
        levelCompleteAction()
    }
    
    func addLyric() {
        
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        // Add them into same scene
        self.addChild(myLabel)
        
        myLabel.text = currentLevel?.lyrics?[index].text;
        myLabel.fontSize = 35
        myLabel.position = CGPointMake(0.5, 1.0)
        myLabel.fontColor = .white
        myLabel.setScale(0.001)
        
        words.append(myLabel)
        
        index += 1
    }
}
