//
//  SmilesView.swift
//  HacatonStocksChatApp
//
//  Created by Стас Жингель on 27.11.2021.
//

import SwiftUI

struct SmilesView: View {
    @Binding var imageName: [String]
    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible()),
       ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(1..<20) { i in
                    Image(String(i))
                        .resizable()
                        .frame(width: 160, height: 160)
                        .onTapGesture {
    // need for use ScrollView without bugs
                        }
                        .onLongPressGesture {
                            print(i)
                            imageName.append(String(i)) 
                        }
                        
                }
                    
            }
        }
    }
}



