//
//  FetchData.swift
//  HacatonStocksChatApp
//
//  Created by Стас Жингель on 26.11.2021.
//
// old api = "691e17d38a1864f345b79310fdfe1654"
import Foundation
import SwiftUI
class FetchData: ObservableObject {
    let APIKey = "3ed4c61bea8c7937ab69c6a76f250e8f"
    
    func fetchData(searcText: String, completion: @escaping (Ticker) -> ()) {
        guard let url = URL(string: "https://financialmodelingprep.com/api/v3/search?query=\(searcText)&limit=10&exchange=NASDAQ&apikey=\(APIKey)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            do {
                let ticker = try JSONDecoder().decode(Ticker.self, from: data)
                completion(ticker)
            } catch {
                print("no symbol")
            }
        }
        task.resume()
         

    }
    func fetchDataStockInfo(tickerSymbol: String,  completion: @escaping (TickerInfoElement) -> ()) {
        let url = URL(string: "https://financialmodelingprep.com/api/v3/profile/\(tickerSymbol)?apikey=\(APIKey)")


        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            do {
                let ticker = try JSONDecoder().decode(TickerInfo.self, from: data)
                completion(ticker[0])
            } catch {
                print("no info")
            }
        }

        task.resume()
    }
    func historyPricesStockInfo(tickerSymbol: String,  completion: @escaping (HistoryPrices) -> ()) {
        let url = URL(string: "https://financialmodelingprep.com/api/v3/historical-chart/4hour/\(tickerSymbol)?apikey=\(APIKey)")
      


        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            let ticker = try! JSONDecoder().decode(HistoryPrices.self, from: data)
            completion(ticker)
        }

        task.resume()
    }
    func newsForTickers(tickerSymbol: String,  completion: @escaping (News) -> ()) {
        let url = URL(string: "https://financialmodelingprep.com/api/v3/stock_news?tickers=\(tickerSymbol)&limit=50&apikey=\(APIKey)")
      


        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            do {
                let ticker = try JSONDecoder().decode(News.self, from: data)
                completion(ticker)
            } catch {
                print("no news")
            }
            
        }

        task.resume()
    }
    
}

