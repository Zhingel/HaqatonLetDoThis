//
//  TickerProfileController.swift
//  HacatonStocksChatApp
//
//  Created by Стас Жингель on 27.11.2021.
//

import Foundation
import UIKit
import SwiftUI
class TickerProfileController: UIViewController {
    var historyPrices = [CGFloat]()
    var news = [NewsElement]()
    var tickerInfo: TickerInfoElement?
    var imageTicker = UIImage()
    var tickerName: String?
    var flag = false
    let tickerNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Company Name"
        return label
    }()
    let priceNameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    

    let imageView: CustomImageView = {
        let iv = CustomImageView()
        iv.layer.cornerRadius = 60/2
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .white
        iv.clipsToBounds = true
        return iv
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        imageView.constraints(top: view.topAnchor, bottom: nil, left: view.leftAnchor, right: nil, paddingTop: 100, paddingBottom: 0, paddingleft: 15, paddingRight: 0, width: 60, height: 60)
//        view.addSubview(tickerNameLabel)
//        tickerNameLabel.constraints(top: view.topAnchor, bottom: nil, left: imageView.rightAnchor, right: nil, paddingTop: 123, paddingBottom: 0, paddingleft: 15, paddingRight: 0, width: 0, height: 0)
        view.addSubview(priceNameLabel)
        priceNameLabel.constraints(top: view.topAnchor, bottom: nil, left: imageView.rightAnchor, right: nil, paddingTop: 118, paddingBottom: 0, paddingleft: 15, paddingRight: 0, width: 0, height: 0)
        
        
        
        updateView()
       
       
    }
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    fileprivate func updateView() {
        print(tickerInfo)
        guard let tickerInfo = tickerInfo else {return}
        imageView.loadImage(urlString: tickerInfo.image)
        priceNameLabel.text = "\(tickerInfo.price) $"
        navigationItem.title = tickerInfo.companyName
        self.tickerNameLabel.text = self.tickerInfo?.companyName
        let contentView = UIHostingController(rootView: ContentView(ticker: tickerInfo, dataPoints: historyPrices, news: news, image: imageTicker))
        view.addSubview(contentView.view)
        contentView.view.constraints(top: imageView.bottomAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingBottom: 0, paddingleft: 0, paddingRight: 0, width: 0, height: 0)
    }
    fileprivate func fetchData()  {
        let fetchData = FetchData()
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let tickerName = self.tickerName else {
                return
            }
            fetchData.historyPricesStockInfo(tickerSymbol: tickerName) { prices in
                for price in prices {
                    self.historyPrices.append(price.historyPriceOpen)
                }
                print(self.historyPrices)
                DispatchQueue.main.async {
                    self.viewDidLoad()
                }
            }
            fetchData.fetchDataStockInfo(tickerSymbol: tickerName) { tickerInfo in
                self.tickerInfo = tickerInfo
                print(self.tickerInfo)
                DispatchQueue.main.async {
                    self.viewDidLoad()
                }
            }
            fetchData.newsForTickers(tickerSymbol: tickerName) { news in
                self.news = news
                print(news)
                DispatchQueue.main.async {
                    self.viewDidLoad()
                }
            }
        }
        
    }
}
