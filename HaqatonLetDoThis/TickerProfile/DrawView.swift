//
//  drawView.swift
//  HacatonStocksChatApp
//
//  Created by Стас Жингель on 27.11.2021.
//

import SwiftUI
import PencilKit

struct DrawView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var imageView = [String]()
    @State var canvas = PKCanvasView()
    @State var isDraw = true
    @State var color : Color = .black
    @State var type : PKInkingTool.InkType = .pencil
    @State var showSheet: Bool = false
    @State var isDraging = false
    @State var position = CGSize.zero
    @State private var currentPosition: CGSize = .zero
        @State private var newPosition: CGSize = .zero
    var dataPoints: [CGFloat]
    var saveImageView: some View {
        ZStack {
            DrawingView(canvas: $canvas, isDraw: $isDraw,type: $type,color: $color)
            Rectangle()
                .strokeBorder()
            StockViewGraphic(dataPoints: dataPoints)
            ForEach(imageView, id: \.self) { i in
                Image(i)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .draggable()
                    
            }
        }
        .frame(width: 380, height: 300)
    }
    var body: some View {
        NavigationView {
            VStack {
                saveImageView
                ColorPicker("Pick Color", selection: $color)
                    .padding()
                HStack {
                    Spacer()
                    NavigationLink {
                        AddTextView()
                    } label: {
                        Text("Next")
                    }
                }
                .padding(.horizontal)
                Spacer()
            }
            .padding(.top, 40)
            .navigationTitle("Post")
            .navigationBarTitleDisplayMode(.inline)
            .halfSheet(showSheet: $showSheet, sheetView: {
                SmilesView(imageName: $imageView)
            })
            .navigationBarItems(leading: Button(action: {
                
                let image = saveImageView.snapshot()
                
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                
            }, label: {
                
                Image(systemName: "square.and.arrow.down.fill")
                    .font(.title2)
                    .foregroundColor(.black)
            }),trailing: HStack{
                Menu {
                    Button(action: {
                        isDraw = true
                        type = .pencil
                        
                    }) {
                        
                        Label {
                            
                            Text("Pencil")
                            
                        } icon: {
                            
                            Image(systemName: "pencil")
                        }
                        
                    }
                    
                    Button(action: {
                        
                        isDraw = true
                        type = .pen
                        
                    }) {
                        
                        Label {
                            
                            Text("Pen")
                            
                        } icon: {
                            
                            Image(systemName: "pencil.tip")
                        }
                        
                    }
                    
                    Button(action: {
                        isDraw = true
                        type = .marker
                    }) {
                        Label {
                            Text("Marker")
                        } icon: {
                            Image(systemName: "highlighter")
                        }
                    }
                } label: {
                    Image("three")
                    
                }
                .offset(x: 120)
                Button(action: {
                    showSheet.toggle()
                }) {
                    Image("смайлик")
                        
                }
                .offset(x: 75)
                Button(action: {
                    isDraw = false
                }) {
                    Image("Ластик")
                       
                }
                .offset(x: 30)
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image("крестик")
                        
                }
                .offset(x: -10)

            }
                                    .offset(y: 10)
            )
        }
        
    }
}


struct DrawingView : UIViewRepresentable {
    
    @Binding var canvas : PKCanvasView
    @Binding var isDraw : Bool
    @Binding var type : PKInkingTool.InkType
    @Binding var color : Color
    var ink : PKInkingTool{
        PKInkingTool(type, color: UIColor(color))
    }
    
    let eraser = PKEraserTool(.bitmap)
    
    func makeUIView(context: Context) -> PKCanvasView{
        
        canvas.drawingPolicy = .anyInput
        
        canvas.tool = isDraw ? ink : eraser
        
        return canvas
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {

        uiView.tool = isDraw ? ink : eraser
    }
}



