//
//  HackButton.swift.swift
//  HacatonStocksChatApp
//
//  Created by Садык Мусаев on 27.11.2021.
//

import UIKit

class HackButton:  UIButton{
    
    init(bgColor: UIColor, title: String) {
        super.init(frame: .zero)
        
        configurateButton(color: bgColor, title: title)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurateButton(color: UIColor, title: String){
        
        self.layer.cornerCurve = .continuous
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        
        self.backgroundColor = color
        self.setTitle(title, for: .normal)
    }
}

