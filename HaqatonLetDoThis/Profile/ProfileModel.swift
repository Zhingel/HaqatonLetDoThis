//
//  ProfileModel.swift
//  HacatonStocksChatApp
//
//  Created by Садык Мусаев on 27.11.2021.
//

import Foundation


struct ProfileModel: Codable{
    
    let id: Int
    let username: String
    let rating: Int
    let createdAt: String
    let favouriteTickers: [String]

}
