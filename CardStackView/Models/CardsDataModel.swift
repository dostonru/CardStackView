//
//  CardsDataModel.swift
//  CardStackView
//
//  Created by Doston Rustamov on 14/03/22.
//
import UIKit

struct CardsDataModel {
    
    var bgColor: UIColor
    var text : String
    var image : String
      
    init(bgColor: UIColor, text: String, image: String) {
        self.bgColor = bgColor
        self.text = text
        self.image = image
    
    }
}
