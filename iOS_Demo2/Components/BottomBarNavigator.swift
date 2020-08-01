//
//  BottomBarNavigator.swift
//  iOS_Demo
//
//  Created by Uri on 7/21/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct BottomBarNavigator: View {
    @State var isSelectedBottom = 0
    @Binding var titleHome: String
    @Binding var isShowView: Int
    var body: some View {
        VStack{
            Spacer()
            BottomBar(titleHome: $titleHome, isSelectedBottom: $isSelectedBottom, isShowView: $isShowView).background(CurvedShape()).padding()
            Spacer()
        }
    }
}

//struct BottomBarNavigator_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomBarNavigator(isSelectedBottom: $isSelectedBottom,tittleHome: $tittleHome)
//    }
//}
struct CurvedShape :View{
    var body: some View{
        Path{
            path in
            path.move(to: CGPoint(x:0, y:0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 60))
            path.addLine(to: CGPoint(x: 0, y: 60))
        }.fill(Color.white).rotationEffect(.init(degrees: 180))
    }
}
struct BottomBar: View{
    @Binding var titleHome: String
    @Binding var isSelectedBottom : Int
    @Binding var isShowView: Int
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        VStack{
            Spacer().frame(width: 10)
            HStack{
                
                VStack{
                    Button(action: {
                        self.isSelectedBottom = 0
                        self.titleHome = "Popular"
                        self.isShowView = 0
                        print(self.titleHome)
                    }) {
                        Image(systemName: isSelectedBottom == 0 ? "house.fill" : "house").resizable().frame(width: 30, height: 30)
                    }
                    Text("Home")
                }.foregroundColor(.black).padding(0)
                Spacer()
                VStack{
                    Button(action: {
                        self.isSelectedBottom = 1
                        self.titleHome = "Favorites"
                        self.isShowView = 1
                        self.presentationMode.wrappedValue.dismiss()
                        print(self.titleHome)
                    }) {
                        Image(systemName: isSelectedBottom == 1 ? "suit.heart.fill": "heart").resizable().frame(width: 30, height: 30)
                    }
                    Text("Favorites")
                }
                .foregroundColor(.black)
                Spacer()
                VStack{
                    Button(action: {
                        self.isSelectedBottom = 2
                        self.titleHome = "Setting"
                        self.isShowView = 2
                        print(self.titleHome)
                    }) {
                        Image(systemName: isSelectedBottom == 2 ? "paperplane.fill" : "paperplane").resizable().frame(width: 30, height: 30)
                    }
                    Text("Setting")
                }
                .foregroundColor(.black)
                Spacer()
                VStack{
                    Button(action: {
                        self.isSelectedBottom = 3
                        self.titleHome = "About"
                        self.isShowView = 3
                        print(self.titleHome)
                    }) {
                        Image(systemName: isSelectedBottom == 3 ? "ellipsis.circle.fill" : "ellipsis.circle").resizable().frame(width: 30, height: 30)
                    }
                    Text("About")
                }
                .foregroundColor(.black)
                
            }
        }
        
    }
}



