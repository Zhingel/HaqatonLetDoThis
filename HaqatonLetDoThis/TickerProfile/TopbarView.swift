//
//  TopbarView.swift
//  HacatonStocksChatApp
//
//  Created by Стас Жингель on 27.11.2021.
//

import SwiftUI

struct TopBarView: View {
    @State var currentSelection: Int = 0
    @State var isPresented = false
    var dataPoints: [CGFloat]
    var image: UIImage
    var ticker: TickerInfoElement
    var news: News
    var body: some View {
        
        PagerTabView(tint: .black,selection: $currentSelection){
            
            Text("График")
                .font(Font.system(size: 14))
                .pageLabel()
            
            Text("Информация")
                .font(Font.system(size: 14))
                .pageLabel()
            
            Text("Новости")
                .font(Font.system(size: 14))
                .pageLabel()
                .offset(x: 8)
            
            Text("Чат")
                .font(Font.system(size: 14))
                .pageLabel()
            
        } content: {
            
            ZStack {
                Color.rgb(red: 243, green: 247, blue: 249)
                VStack {
                    Divider()
                    ScrollView {
                        VStack {
                            Text(ticker.companyName)
                            ZStack {
                                Rectangle()
                                    .strokeBorder()
                                StockViewGraphic(dataPoints: dataPoints)
                            }
                            .frame(height: 300)
                            .padding(.horizontal,5)
                            HStack {
                                Spacer()
                                Button {
                                    isPresented = true
                                } label: {
                                    Image("добавить")
                                }
                            }
                            .offset(y:-10)
                          
                        }
                        .fullScreenCover(isPresented: $isPresented) {
                            DrawView(dataPoints: dataPoints)
                        }
                    }
                }
            }
                .pageView(ignoresSafeArea: true, edges: .bottom)
            
            ZStack {
                Color.rgb(red: 243, green: 247, blue: 249)
                VStack {
                    Divider()
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("Marcket Cap: ")
                                .bold()
                                .font(Font.system(size: 14))
                            + Text("\(ticker.mktCap)")
                                .font(Font.system(size: 14))
                            Text("Country: ")
                                .bold()
                                .font(Font.system(size: 14))
                            + Text("\(ticker.country)")
                                .font(Font.system(size: 14))
                            Text("Sector: ")
                                .bold()
                                .font(Font.system(size: 14))
                            + Text("\(ticker.sector)")
                                .font(Font.system(size: 14))
                            Text("Ipo date: ")
                                .bold()
                                .font(Font.system(size: 14))
                            + Text("\(ticker.ipoDate)")
                                .font(Font.system(size: 14))
                            Text("Company Info: ")
                                .bold()
                                .font(Font.system(size: 14))
                            + Text(ticker.tickerInfoDescription)
                                .font(Font.system(size: 14))
                        }
                        .padding()
                    }
                }
            }
                .pageView(ignoresSafeArea: true, edges: .bottom)
            
            ZStack {
                Color.rgb(red: 243, green: 247, blue: 249)
                NewsView(tickerInfo: ticker, news: news)
            }
                .pageView(ignoresSafeArea: true, edges: .bottom)
            ZStack {
                Color.rgb(red: 243, green: 247, blue: 249)
                ChatView()
            }
                .pageView(ignoresSafeArea: true, edges: .bottom)
        }
        .padding(.top)
        .ignoresSafeArea(.container, edges: .bottom)

    }
}


