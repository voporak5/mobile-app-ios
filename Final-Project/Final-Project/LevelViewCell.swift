//
//  LevelViewCell.swift
//  Final-Project
//
//  Created by Bluestreet Mac on 2/27/23.
//

import UIKit
import Foundation

class LevelViewCell:UITableViewCell{
    
    let profileImageView:UIImageView = {
             let img = UIImageView()
             img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
             img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
             //img.layer.cornerRadius = 35
             //img.clipsToBounds = true
            return img
         }()
    
    let nameLabel:UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 12)
            label.textColor = .black
            label.textAlignment = .left
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

    let containerView:UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = false//true // this will make sure its children do not go out of the boundary
      return view
    }()
    

    
    var level:Level? {
            didSet {
                guard let levelItem = level else {return}
                if let image = levelItem.image {
                    profileImageView.image = UIImage(named: image)
                }
                                
                if let title = levelItem.title {
                    nameLabel.text = "\(title)"
                }
            }
        }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        self.contentView.addSubview(containerView)
        
        profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant:70).isActive = true;
        profileImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor,constant: 60).isActive = true
        nameLabel.leftAnchor.constraint(equalTo:self.containerView.leftAnchor,constant: 100).isActive = true
        //nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        //nameLabel.centerXAnchor.constraint(equalTo:self.containerView.centerXAnchor).isActive = true
        //nameLabel.centerYAnchor.constraint(equalTo:self.containerView.centerYAnchor).isActive = true
        //nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        //jobTitleDetailedLabel.translatesAutoresizingMaskIntoConstraints = false
        //jobTitleDetailedLabel.centerXAnchor.constraint(equalTo:containerView.centerXAnchor).isActive = true
        //jobTitleDetailedLabel.centerYAnchor.constraint(equalTo:containerView.centerYAnchor).isActive = true
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
}
