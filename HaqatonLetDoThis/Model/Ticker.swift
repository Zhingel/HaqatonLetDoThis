//
//  Ticker.swift
//  HacatonStocksChatApp
//
//  Created by Стас Жингель on 26.11.2021.
//

import Foundation

// MARK: - TickerElement
struct TickerElement: Codable {
    let symbol, name: String
    let currency: Currency
    let stockExchange: String
    let exchangeShortName: ExchangeShortName
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum ExchangeShortName: String, Codable {
    case nasdaq = "NASDAQ"
}

typealias Ticker = [TickerElement]


struct TickerInfoElement: Codable {
    let symbol: String
    let price, beta: Double
    let volAvg, mktCap: Int
    let lastDiv: Double
    let range: String
    let changes: Double
    let companyName, currency, isin: String
    let exchange, exchangeShortName, industry: String
    let website: String
    let tickerInfoDescription, sector, country: String
    
   
    let image: String
    let ipoDate: String
    let defaultImage: Bool

    enum CodingKeys: String, CodingKey {
        case symbol, price, beta, volAvg, mktCap, lastDiv, range, changes, companyName, currency, isin, exchange, exchangeShortName, industry, website
        case tickerInfoDescription = "description"
        case sector, country, image, ipoDate, defaultImage
    }
}

typealias TickerInfo = [TickerInfoElement]


struct HistoryPrice: Codable {
    let historyPriceOpen: Double

    enum CodingKeys: String, CodingKey {
        case historyPriceOpen = "open"
    }
}

typealias HistoryPrices = [HistoryPrice]

// MARK: - NewsElement
struct NewsElement: Identifiable, Codable {
    let id = UUID()
    let symbol: String
    let publishedDate, title: String
    let image: String
    let site, text: String
    let url: String
}


typealias News = [NewsElement]
