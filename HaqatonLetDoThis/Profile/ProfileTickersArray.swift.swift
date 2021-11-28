//
//  ProfileTicketsArray.swift.swift
//  HacatonStocksChatApp
//
//  Created by Садык Мусаев on 27.11.2021.
//

import UIKit

struct ProfileTicker{
    
    let name: String
    let code: String
    let image: UIImage
}

let tickersArray = [

    ProfileTicker(name: "Apple", code: "AAPL", image: UIImage(named: "AAPL")!),
    ProfileTicker(name: "Microsoft", code: "MSFT", image: UIImage(named: "MSFT")!),
    ProfileTicker(name: "Funko", code: "FNKO", image: UIImage(named: "FNKO")!)
]
