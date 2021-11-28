//
//  tickerTableViewCell.swift
//  HacatonStocksChatApp
//
//  Created by Садык Мусаев on 27.11.2021.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    
    let avatar = UIImageView()
    let name = UILabel()
    let date = UILabel()
    let hashtag = UILabel()
    //let title = UILabel()
    let body = UILabel()
    let image = UIImageView()
    
    static let id = "postsCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        confCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func confCell(){

        addSubview(body)
        addSubview(avatar)
        addSubview(hashtag)
        addSubview(name)
        addSubview(date)
        addSubview(image)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapOnHashtag))
        hashtag.addGestureRecognizer(gesture)
        
        self.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        body.numberOfLines = 0
        
        image.layer.cornerCurve = .continuous
        image.layer.cornerRadius = 20
        
        hashtag.textColor = .blue
        
        NSLayoutConstraint.activate([
            
            avatar.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            avatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            avatar.heightAnchor.constraint(equalTo: avatar.widthAnchor, multiplier: 1.0/1.0),
            avatar.heightAnchor.constraint(equalToConstant: 70),
            
            name.topAnchor.constraint(equalTo: avatar.topAnchor),
            name.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            date.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
            date.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            date.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: -10),
            
            hashtag.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 20),
            hashtag.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            hashtag.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: -10),
            
            body.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 20),
            body.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            body.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: -10),
            
            image.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 20),
            image.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            image.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: -10),
        ])
        
        avatar.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        body.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    @objc func tapOnHashtag(){
        
        print(hashtag.text)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
