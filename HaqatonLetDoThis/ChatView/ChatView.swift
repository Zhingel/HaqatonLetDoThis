//
//  ChatView.swift
//  HacatonStocksChatApp
//
//  Created by Стас Жингель on 27.11.2021.
//

import SwiftUI

struct ChatView: View {
    @State var haveImage = false
    var body: some View {
        ScrollView {
            VStack {
                Divider()
                HStack {
                 Image("аватарка")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .shadow(color: .gray, radius: 1, x: 1, y: 0.5)
                    .padding(10)
                 VStack(alignment: .leading) {
                        Text("Ilon Mask")
                         .foregroundColor(Color.rgb(red: 0, green: 190, blue: 240))
                         .font(Font.system(size: 16))
                        Text("16:45 20.09.2021")
                         .foregroundColor(Color.rgb(red: 196, green: 196, blue: 196))
                         .font(Font.system(size: 12))
                    }
                 .padding(.bottom,10)
                    Spacer()
                    
                }
                .padding(.horizontal)
                VStack(alignment: .leading) {
                    Text("#TSLA")
                     .foregroundColor(Color.rgb(red: 0, green: 190, blue: 240))
                     .font(Font.system(size: 16))
                     .padding(.top,3)
                    Text("Buy Tesla🚀🚀🚀 to the 🌚🌝")
                     .font(Font.system(size: 16))
               //  if haveImage {
                     Image("1")
                         .resizable()
                         .frame(width: 200, height: 140)
                         .clipShape(RoundedRectangle(cornerRadius: 30))
              //   }
                }
                .padding(.leading,60)
                .offset(y: -25)
                Divider()
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
