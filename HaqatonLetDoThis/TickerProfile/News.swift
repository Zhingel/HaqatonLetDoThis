//
//  News.swift
//  HacatonStocksChatApp
//
//  Created by Стас Жингель on 28.11.2021.
//

import SwiftUI

struct NewsView: View {
    var tickerInfo: TickerInfoElement
    var news: News
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(news) {newsinfo in
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(newsinfo.title)
                            .bold()
                            .font(Font.system(size: 18))
                        Text(newsinfo.text)
                        Text("\(newsinfo.publishedDate)")
                            .font(Font.system(size: 14))
                            .foregroundColor(Color.rgb(red: 196, green: 196, blue: 196))
                        Divider()
                    }
                } .padding()
                }
            }
        }
    }
}


