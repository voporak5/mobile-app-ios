//
//  LevelViewCell.swift
//  Final-Project
//
//  Created by Bluestreet Mac on 2/27/23.
//

import UIKit
import Foundation

class LevelViewCell:UITableViewCell{
    
    let albumImageView:UIImageView = {
             let img = UIImageView()
             img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
             img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
            return img
         }()
    
    let star1View:UIImageView = {
             let img = UIImageView()
             img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
             img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
            return img
         }()
    
    let star2View:UIImageView = {
             let img = UIImageView()
             img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
             img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
            return img
         }()
    
    let star3View:UIImageView = {
             let img = UIImageView()
             img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
             img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
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
                    albumImageView.image = UIImage(named: image)
                }
                                
                if let title = levelItem.title {
                    nameLabel.text = "\(title)"
                }
                
                if(levelItem.stars > 0){
                    star1View.image = UIImage(named: "star-filled")
                }
                else {
                    star1View.image = UIImage(named: "star-outline")
                }
                
                if(levelItem.stars > 1){
                    star2View.image = UIImage(named: "star-filled")
                }
                else {
                    star2View.image = UIImage(named: "star-outline")
                }
                
                if(levelItem.stars > 2){
                    star3View.image = UIImage(named: "star-filled")
                }
                else {
                    star3View.image = UIImage(named: "star-outline")
                }                
            }
        }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(albumImageView)
        containerView.addSubview(star1View)
        containerView.addSubview(star2View)
        containerView.addSubview(star3View)
        containerView.addSubview(nameLabel)
        self.contentView.addSubview(containerView)
        
        albumImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        albumImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        albumImageView.widthAnchor.constraint(equalToConstant:70).isActive = true;
        albumImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor,constant: 60).isActive = true
        nameLabel.leftAnchor.constraint(equalTo:self.containerView.leftAnchor,constant: 100).isActive = true
        
        star1View.topAnchor.constraint(equalTo:self.containerView.topAnchor,constant: 0).isActive = true
        star1View.rightAnchor.constraint(equalTo:self.containerView.rightAnchor,constant: 240).isActive = true
        
        star2View.topAnchor.constraint(equalTo:self.containerView.topAnchor,constant: 0).isActive = true
        star2View.rightAnchor.constraint(equalTo:self.containerView.rightAnchor,constant: 300).isActive = true
        
        star3View.topAnchor.constraint(equalTo:self.containerView.topAnchor,constant: 0).isActive = true
        star3View.rightAnchor.constraint(equalTo:self.containerView.rightAnchor,constant: 360).isActive = true
        
        

     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
}
