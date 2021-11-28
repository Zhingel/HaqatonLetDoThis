//
//  tickerTableViewCell.swift
//  HacatonStocksChatApp
//
//  Created by Садык Мусаев on 27.11.2021.
//

import UIKit

class TickerTableViewCell: UITableViewCell {
    
    let tickerImage = UIImageView()
    let tickerName = UILabel()
    let tickerCode = UILabel()
    
    static let id = "tickerCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.layer.cornerCurve = .continuous
        self.layer.cornerRadius = 20
        self.backgroundColor = UIColor(named: "SecondaryBackColor")
        self.layer.borderWidth = 0.2
        
        confCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func confCell(){
        
        addSubview(tickerImage)
        addSubview(tickerCode)
        addSubview(tickerName)
        
        tickerName.font = UIFont.boldSystemFont(ofSize: 20)
        
        tickerCode.textColor = .darkGray
        
        tickerImage.contentMode = .scaleAspectFit
        tickerImage.layer.cornerCurve = .continuous
        tickerImage.layer.cornerRadius = 20
        tickerImage.backgroundColor = .white
        tickerImage.clipsToBounds = true
        
        NSLayoutConstraint.activate([
        
            tickerImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            tickerImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            tickerImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            tickerImage.heightAnchor.constraint(equalTo: tickerImage.widthAnchor, multiplier: 1.0/1.0),
            
            tickerName.topAnchor.constraint(equalTo: tickerImage.topAnchor, constant: 5),
            tickerName.leadingAnchor.constraint(equalTo: tickerImage.trailingAnchor, constant: 10),
            tickerName.trailingAnchor.constraint(greaterThanOrEqualTo: self.trailingAnchor, constant: -10),
            
            tickerCode.topAnchor.constraint(equalTo: tickerName.bottomAnchor, constant: 5),
            tickerCode.bottomAnchor.constraint(greaterThanOrEqualTo: self.bottomAnchor, constant: -10),
            //tickerCode.bottomAnchor.constraint(equalTo: tickerImage.bottomAnchor, constant: -10),
            tickerCode.leadingAnchor.constraint(equalTo: tickerImage.trailingAnchor, constant: 10),
            tickerCode.trailingAnchor.constraint(greaterThanOrEqualTo: self.trailingAnchor, constant: -10)
        ])
        
        tickerImage.translatesAutoresizingMaskIntoConstraints = false
        tickerName.translatesAutoresizingMaskIntoConstraints = false
        tickerCode.translatesAutoresizingMaskIntoConstraints = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
