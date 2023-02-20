//
//  ConfigViewController.swift
//  HW7
//
//  Created by Bluestreet Mac on 2/19/23.
//

import UIKit

class ConfigViewController: UIViewController,UITextFieldDelegate {
    
    let CORNFLOWER_BLUE     =   UIColor(red: 100/255,green: 149/255,blue: 237/255,alpha:1);
    
    let titleLabel          =   UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let buttonLabel         =   UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let labelLabel          =   UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let channelLabel        =   UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let channelValueLabel   =   UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))

    let labelText           =   UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    
    let segment =   UISegmentedControl(items: ["1","2","3","4"])
    
    let stepper = UIStepper()
    
    var favoriteChannelSetAction: (Int,String,Int) -> () = { (nBtn:Int,name:String,channel:Int) in print(nBtn) }
    
    var channel = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupHeader()
        setupButton()
        setupButton()
        setupLabel()
        setupChannel()
        setupSaveCancel()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    func setupHeader(){
        setLabel(label:titleLabel,text:"Configure Favorite Channels",color: .blue,size: 20)
        self.view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
    }
    
    func setupButton(){
        setLabel(label:buttonLabel,text:"Button",color: .blue,size: 20)
        self.view.addSubview(buttonLabel)
        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
        buttonLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70).isActive = true
        
        let segment = self.segment
        segment.frame = CGRect(x: 0, y: 0, width: 250, height: 100)
        self.view.addSubview(segment)
        segment.selectedSegmentIndex = 0
        
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.centerYAnchor.constraint(equalTo: buttonLabel.centerYAnchor).isActive = true
        segment.leftAnchor.constraint(equalTo: buttonLabel.rightAnchor, constant: 40).isActive = true
    }
    
    func setupLabel(){
        setLabel(label:labelLabel,text:"Label",color: .blue,size: 20)
        self.view.addSubview(labelLabel)
        labelLabel.translatesAutoresizingMaskIntoConstraints = false
        labelLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
        labelLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120).isActive = true
        
        
        setTextField(field:labelText,text:"", keyboard: UIKeyboardType.default)
        self.view.addSubview(labelText)
        labelText.translatesAutoresizingMaskIntoConstraints = false
        labelText.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 120).isActive = true
        labelText.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30).isActive = true
        labelText.topAnchor.constraint(equalTo: labelLabel.topAnchor).isActive = true
        labelText.bottomAnchor.constraint(equalTo: labelLabel.bottomAnchor).isActive = true
    }
    
    func setupChannel(){
        setLabel(label:channelLabel,text:"Channel",color: .blue,size: 20)
        self.view.addSubview(channelLabel)
        channelLabel.translatesAutoresizingMaskIntoConstraints = false
        channelLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
        channelLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 160).isActive = true
        
        setLabel(label:channelValueLabel,text:"1",color: .blue,size: 20)
        self.view.addSubview(channelValueLabel)
        channelValueLabel.translatesAutoresizingMaskIntoConstraints = false
        channelValueLabel.leftAnchor.constraint(equalTo: channelLabel.rightAnchor, constant: 30).isActive = true
        channelValueLabel.centerYAnchor.constraint(equalTo: channelLabel.centerYAnchor).isActive = true
        
        self.view.addSubview(stepper)
        stepper.minimumValue = 1
        stepper.maximumValue = 99
        stepper.value = 1
        stepper.wraps = true
        stepper.autorepeat = false
        stepper.addAction(UIAction() { (action) in
            self.channel = Int(self.stepper.value)
            self.channelValueLabel.text = String(self.channel)
        }, for: UIControl.Event.allTouchEvents)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.leftAnchor.constraint(equalTo: channelValueLabel.rightAnchor, constant: 30).isActive = true
        stepper.centerYAnchor.constraint(equalTo: channelValueLabel.centerYAnchor).isActive = true
    }
    
    func setupSaveCancel(){
        let cancelBtn = addButton(label: "Cancel")
        cancelBtn.addAction(UIAction() { (action) in
            self.labelText.text = ""
        }, for: UIControl.Event.touchDown)
        self.view.addSubview(cancelBtn)
        
        cancelBtn.translatesAutoresizingMaskIntoConstraints = false
        cancelBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        cancelBtn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -100).isActive = true
        
        let saveBtn = addButton(label: "Save")

        saveBtn.addAction(UIAction() { (action) in
            
            let labelCount = self.labelText.text?.count ?? 0
            
            if labelCount < 1 || labelCount > 4{
                self.showAlert();
            }
            
            self.favoriteChannelSetAction(self.segment.selectedSegmentIndex,self.labelText.text ?? "",self.channel)
            self.showSuccess()
            
        }, for: UIControl.Event.touchDown)
        self.view.addSubview(saveBtn)
        
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        saveBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        saveBtn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50).isActive = true
        
    }
    
    func setLabel(label: UILabel,text: String,color: UIColor,size: CGFloat) {
        
        label.textColor = color;
        label.font = UIFont(name: "Chalkboard SE",size: size)
        label.text = text;
        label.numberOfLines = 1;
        label.textAlignment = .left

    }
    
    func setTextField(field: UITextField, text: String, keyboard: UIKeyboardType) {
        field.placeholder = text;
        field.borderStyle = .roundedRect
        field.font = UIFont.systemFont(ofSize: 12)
        field.keyboardType = keyboard
        field.delegate = self
    }
    
    func addButton(label: String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50));
        button.setTitle(label, for: UIControl.State.normal)
        button.setTitleColor(CORNFLOWER_BLUE, for: UIControl.State.normal)
        button.setTitleColor(.gray, for: UIControl.State.disabled)
        
        return button;
    }
    
    public func setFavoriteChannelSetObserver(callback:  @escaping (Int,String,Int) -> Void) {
        self.favoriteChannelSetAction = callback;
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showSuccess() {
        let dialogMessage = UIAlertController(title: "Success", message: "Favorite Channel Was Updated", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        
        dialogMessage.addAction(ok)
        
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    func showAlert() {
        let dialogMessage = UIAlertController(title: "Error", message: "Label must be between 1-4 characters", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        
        dialogMessage.addAction(ok)
        
        self.present(dialogMessage, animated: true, completion: nil)
    }
}
