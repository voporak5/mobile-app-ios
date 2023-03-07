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
    var volume : Float = 1.0
    var isPlaying = false
    var gamePaused = false;
    var index = 0
    var currentLevel: Level?
    var words: [SKLabelNode] = []
    var previousTime: Double = 0
    var lyricsCollected = 0
    var starsEarned = 0
    var totalLyrics = 0
    
    private var player : SKSpriteNode?
    
    var levelCompleteAction: (Level,Int,Int) -> ()    =   { (level:Level,score:Int,stars:Int) in print("Level Complete") }
    var starEarnedAction: (Int) -> ()    =   { (stars:Int) in print("Star earned") }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
    }
    
    public func loadLevel(level:Level){
        
        currentLevel = level
        let sound = Bundle.main.path(forResource: level.song, ofType: "mp3")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            audioPlayer.play()
            audioPlayer.volume = volume
        }
        catch{
            print(error)
        }
        
        for label in words {
            
            if(label.parent == nil){
                continue;
            }
            
            label.removeFromParent()

        }
        
        isPlaying = true
        gamePaused = false
        index = 0
        lyricsCollected = 0
        totalLyrics = currentLevel?.lyrics?.count ?? 0
        self.words = []
    }
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = UIColor(red:1,green: 0,blue: 0,alpha: 1)
        self.player = SKSpriteNode(imageNamed: "player")

        if let player = self.player {
            //let offset = self.size.height/(-2) + 100 + 50
            player.position = CGPoint(x: 0.5, y: 0.15)
            player.size = CGSize(width: 200.0, height: 200.0)
            player.setScale(0.001)

            self.addChild(player)
        }
    
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

        if(isPlaying == false){
            return;
        }
        
        if(gamePaused){
            return;
        }
        
        for label in words {
            
            if(label.parent == nil){
                continue;
            }
            
            label.position = CGPointMake(label.position.x, label.position.y - (deltaTime * 0.5))
            
            let playerX = player?.position.x ?? 0
            let playerY = player?.position.y ?? 0
            let wordX = label.position.x;
            let wordY = label.position.y;
            
            let difX = abs(wordX - playerX);
            let difY = abs(wordY - playerY)
            
            //physics was being inaccurate so just
            //did a makeshift collision check that's significantly better
            //and gets the job done but does not look pretty
            if(difX < 0.1 && difY < 0.1){
                lyricsCollected += 1
                
                if(starsEarned == 0){
                    if(Double(lyricsCollected) > Double(totalLyrics) * 0.33){
                        starsEarned += 1
                        starEarnedAction(starsEarned)
                    }
                }
                
                if(starsEarned == 1){
                    if(Double(lyricsCollected) > Double(totalLyrics) * 0.66){
                        starsEarned += 1
                        starEarnedAction(starsEarned)
                    }
                }
                
                if(starsEarned == 2){
                    if(lyricsCollected >= totalLyrics){
                        starsEarned += 1
                        starEarnedAction(starsEarned)
                    }
                }
                
                label.removeFromParent()
            }
            
            if(label.position.y < 0){
                label.removeFromParent()
            }

        }
        
        // Called before each frame is rendered
        if(audioPlayer.isPlaying == false || audioPlayer.currentTime >= audioPlayer.duration) {
            if(isPlaying) {
                end()
            }
            
            return
        }
        
        if(index >= currentLevel?.lyrics?.count ?? -1) {
            return
        }
        
        //2 seconds for lyric to travel to the player
        if(audioPlayer.currentTime + 2 >= currentLevel?.lyrics?[index].time ?? 999999){
            addLyric()
        }
        
    }
    
    public func setLevelCompleteObserver(callback:  @escaping (Level,Int,Int) -> Void) {
        self.levelCompleteAction = callback;
    }
    
    public func setStarsEarnedObserver(callback:  @escaping (Int) -> Void) {
        self.starEarnedAction = callback;
    }
    
    public func setVolume(volume:Float){
        self.volume = volume
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
        isPlaying = false
        if let level = currentLevel {
            levelCompleteAction(level,lyricsCollected,starsEarned)
        }
    }
    
    func addLyric() {
        
        let randomX = Float.random(in: 0.35..<0.65)
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        // Add them into same scene
        self.addChild(myLabel)
        
        myLabel.text = currentLevel?.lyrics?[index].text;
        myLabel.fontSize = 35
        myLabel.position = CGPointMake(CGFloat(randomX), 1.0)
        myLabel.fontColor = .white
        myLabel.horizontalAlignmentMode = .center
        myLabel.setScale(0.001)

        
        words.append(myLabel)
        
        index += 1
    }
}
