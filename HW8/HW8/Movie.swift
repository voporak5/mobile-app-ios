//
//  Movie.swift
//  HW8
//
//  Created by Bluestreet Mac on 2/25/23.
//

import Foundation

class Movie {
    
    var name = "";
    var releaseDate = "1970-01-01"
    var image = ""
    
    init(name:String,releaseDate:String,image:String) {
        self.name = name
        self.releaseDate = releaseDate
        self.image = image
    }
}
