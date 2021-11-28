//
//  StockViewGraphic.swift
//  HacatonStocksChatApp
//
//  Created by Стас Жингель on 27.11.2021.
//

import SwiftUI

struct LineGraph: Shape {
    var dataPoints: [CGFloat]
    func path(in rect: CGRect) -> Path {
        func point(at ix: Int) -> CGPoint {
            let point = dataPoints[ix]
            let x = rect.width*CGFloat(ix)/CGFloat(dataPoints.count - 1)
            let y = (1 - point) * rect.height
            return CGPoint(x: x, y: y)
        }
        return Path { p in
            guard dataPoints.count > 1 else {return}
            let start = dataPoints[0]
            p.move(to: CGPoint(x: 0, y: (1 - start) * rect.height))
            for index in dataPoints.indices {
                p.addLine(to: point(at: index))
            }
        }
    }
}
struct StockViewGraphic: View {
    var dataPoints: [CGFloat]
    var body: some View {
        

            LineGraph(dataPoints: dataPoints.normolized)
                .stroke(Color.rgb(red: 0, green: 190, blue: 240), lineWidth: 2.5)
                .padding(.vertical,8)
                .padding(.trailing, 100)
        
    }
}

struct StockViewGraphic_Previews: PreviewProvider {
    static var previews: some View {
        StockViewGraphic(dataPoints: [0.1,0.2,0.3,0.6])
    }
}


//struct Home: View {
//    @State var canvas = PKCanvasView()
//    var body: some View {
//        NavigationView {
//            DrawingView(canvas: $canvas)
//                .navigationTitle("drawing")
//                .navigationBarTitleDisplayMode(.inline )
//        }
//    }
//}


