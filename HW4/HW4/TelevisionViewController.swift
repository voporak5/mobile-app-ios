//
//  TelevisionViewController.swift
//  HW4
//
//  Created by Bluestreet Mac on 1/28/23.
//

import UIKit

class TelevisionViewController: UIViewController {

    let CORNFLOWER_BLUE     =   UIColor(red: 100/255,green: 149/255,blue: 237/255,alpha:1);
    
    let WHITE     =   UIColor(red: 255/255,green: 255/255,blue: 255/255,alpha:1);
    
    let tvLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let powerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let powerStatusLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let speakerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let speakerStatusLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let channelLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let channelStatusLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = CORNFLOWER_BLUE;
        
        setLabel(label:tvLabel,text:"My TV",color: WHITE,size: 20)

        self.view.addSubview(tvLabel)
        tvLabel.translatesAutoresizingMaskIntoConstraints = false
        tvLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tvLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true

        setLabel(label:powerLabel,text:"TV Power:",color: WHITE,size: 20)

        self.view.addSubview(powerLabel)
        powerLabel.translatesAutoresizingMaskIntoConstraints = false
        powerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -30).isActive = true
        powerLabel.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -60).isActive = true
        
        setLabel(label:speakerLabel,text:"Speaker Volume:",color: WHITE,size: 20)

        self.view.addSubview(speakerLabel)
        speakerLabel.translatesAutoresizingMaskIntoConstraints = false
        speakerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 0).isActive = true
        speakerLabel.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -60).isActive = true
        
        setLabel(label:channelLabel, text:"Current Channel:",color: WHITE,size: 20)

        self.view.addSubview(channelLabel)
        channelLabel.translatesAutoresizingMaskIntoConstraints = false
        channelLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 30).isActive = true
        channelLabel.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -60).isActive = true

        setLabel(label:powerStatusLabel, text:"On",color: WHITE,size: 20)
        self.view.addSubview(powerStatusLabel)
        powerStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        powerStatusLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -30).isActive = true
        powerStatusLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        
        setLabel(label:speakerStatusLabel, text:"50",color: WHITE,size: 20)
        self.view.addSubview(speakerStatusLabel)
        speakerStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        speakerStatusLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 0).isActive = true
        speakerStatusLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        
        setLabel(label:channelStatusLabel, text:"7",color: WHITE,size: 20)
        self.view.addSubview(channelStatusLabel)
        channelStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        channelStatusLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 30).isActive = true
        channelStatusLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
    }
    
    func setLabel(label: UILabel,text: String,color: UIColor,size: CGFloat) {
        
        label.textColor = color;
        label.font = UIFont(name: "Chalkboard SE",size: size)
        label.text = text;
        label.numberOfLines = 1;
        label.textAlignment = .left

    }
    
    public func SetPower(isOn:Bool){
        powerStatusLabel.text = isOn ? "On" : "Off"
    }
    
    public func SetVolume(volume:Int){
        speakerStatusLabel.text = String(volume)
    }
    
    public func SetChannel(channel:Int){
        channelStatusLabel.text = String(channel)
    }
    
    public func IncrementChannel(){
        
        /*var channel : Int = Int(channelStatusLabel.text ?? "-1")
        channel = ((channel ?? 0) + 1) % 100
        channelStatusLabel.text = String(channel)*/
    }
    
    public func DecrementChannel(){
        
    }
}
