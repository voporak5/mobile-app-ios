//
//  ViewController.swift
//  HW5
//
//  Created by Bluestreet Mac on 2/5/23.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    let headerLabel             =   UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    
    let descriptionLabel        =   UILabel(frame: CGRect(x: 0, y: 0, width: 500, height: 50))
    let quantityLabel           =   UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    
    let descriptionText         =   UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let quantityText            =   UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    
    let buttonsStackView        =   UIStackView();
    let descriptionStackView    =   UIStackView();
    let quantityStackView       =   UIStackView();
    let listStackView           =   UIStackView();


    var items : [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupHeader()
        setupButtonsStackView()
        setupInputsStackView()
        setupListStackView()
    }
    
    func setupHeader(){
        setLabel(label:headerLabel,text:"My Shopping List",color: .blue,size: 25)
        self.view.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupButtonsStackView(){
        let newListButton = addButton(label: "New List")
        let newItemButton = addButton(label: "New Item")
        let addButton = addButton(label: "Add")
        
        newListButton.addAction(newListAction(), for: UIControl.Event.touchDown)
        newItemButton.addAction(newItemAction(), for: UIControl.Event.touchDown)
        addButton.addAction(addAction(), for: UIControl.Event.touchDown)
        
        self.view.addSubview(buttonsStackView)
        
        buttonsStackView.axis = .horizontal
        buttonsStackView.spacing = 5
        buttonsStackView.alignment = .fill
        buttonsStackView.distribution = .equalCentering
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50).isActive = true
        buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        buttonsStackView.addArrangedSubview(newListButton)
        buttonsStackView.addArrangedSubview(newItemButton)
        buttonsStackView.addArrangedSubview(addButton)
    }
    
    func setupInputsStackView(){
        
        self.view.addSubview(descriptionStackView)
        self.view.addSubview(quantityStackView)
        
        
        setLabel(label:descriptionLabel,text:"Description",color: .blue,size: 16)
        setLabel(label:quantityLabel,text:"Quantity",color: .blue,size: 16)
        setTextField(field:descriptionText, text: "", keyboard: UIKeyboardType.default)
        setTextField(field:quantityText, text: "", keyboard: UIKeyboardType.asciiCapableNumberPad)
        
        descriptionStackView.addArrangedSubview(descriptionLabel)
        descriptionStackView.addArrangedSubview(descriptionText)
        
        quantityStackView.addArrangedSubview(quantityLabel)
        quantityStackView.addArrangedSubview(quantityText)
        
        descriptionStackView.axis = .horizontal
        descriptionStackView.distribution = .fill
        descriptionStackView.alignment = .fill
        descriptionStackView.spacing = 20
        
        quantityStackView.axis = .horizontal
        quantityStackView.distribution = .fill
        quantityStackView.alignment = .fill
        quantityStackView.spacing = 20
        
        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        descriptionStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 90).isActive = true
        descriptionStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        descriptionStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
        quantityStackView.translatesAutoresizingMaskIntoConstraints = false
        quantityStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 130).isActive = true
        quantityStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        quantityStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
    }
    
    func setupListStackView(){
        self.view.addSubview(listStackView)
        listStackView.axis = .vertical
        listStackView.distribution = .fill
        listStackView.alignment = .fill
        listStackView.spacing = 0
        
        listStackView.translatesAutoresizingMaskIntoConstraints = false
        listStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 170).isActive = true
        listStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        listStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
    }

    func addButton(label: String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50));
        button.setTitle(label, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont(name:"GillSans",size:18)
        button.setTitleColor(.blue, for: UIControl.State.normal)
        
        return button;
    }
    
    func setLabel(label: UILabel,text: String,color: UIColor,size: CGFloat) {
        
        label.textColor = color;
        label.font = UIFont(name: "Chalkboard SE",size: size)
        label.text = text;
        label.numberOfLines = 2;
        label.textAlignment = .left
        label.sizeToFit()

    }
    
    func setTextField(field: UITextField, text: String, keyboard: UIKeyboardType) {
        field.placeholder = text;
        field.borderStyle = .roundedRect
        field.font = UIFont.systemFont(ofSize: 12)
        field.keyboardType = keyboard
        field.delegate = self
    }
    
    func addItem(name:String,quantity:Int) {
        let item     =   UILabel(frame: CGRect(x: 0, y: 0, width: 500, height: 50))
        let string = String(quantity) + "x " + name
        setLabel(label: item, text: string, color: .blue, size: 12)
        listStackView.addArrangedSubview(item)
        items.append(item)
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func newListAction() -> UIAction {
        let action = UIAction() { (action) in

            for item in self.items {
                
                item.removeFromSuperview()
        
            }
            
            self.items.removeAll()
        }
                
        return action
    }
    
    func newItemAction() -> UIAction {
        let action = UIAction() { (action) in
            self.descriptionText.text = "";
            self.quantityText.text = "";
        }
                
        return action
        
    }
    
    func addAction() -> UIAction {
        let action = UIAction() { (action) in
            
            if(self.descriptionText.text == "" ) {
                return
            }
            
            if(self.quantityText.text == "") {
                return
            }
            
            self.addItem(name: self.descriptionText.text ?? "null", quantity: Int(self.quantityText.text ?? "0") ?? 0)
        }
                
        return action
        
        
    }

}
