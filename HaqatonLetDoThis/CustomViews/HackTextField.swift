//
//  HackTextField.swift.swift
//  HacatonStocksChatApp
//
//  Created by Садык Мусаев on 27.11.2021.
//

import UIKit

class HackTextField: UITextField{
    
    private var holder: String
    
    init(placeholder: String){
        
        self.holder = placeholder
        
        super.init(frame: .zero)
        configurateTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurateTextField(){
        
        self.placeholder = holder
        
        self.layer.borderWidth = 0.6
        self.layer.borderColor = UIColor.systemGray2.cgColor
        self.layer.cornerCurve = CALayerCornerCurve.continuous
        self.layer.cornerRadius = 20
        
        self.textColor = .label
        self.tintColor = .label
        self.backgroundColor = .secondarySystemBackground

        self.textAlignment = .center
        self.font = UIFont.preferredFont(forTextStyle: .title2)
        
        self.adjustsFontSizeToFitWidth = true
        self.minimumFontSize = 12
        
        self.autocorrectionType = .no
        self.returnKeyType = .go
        self.clearButtonMode = .whileEditing
    }
}

