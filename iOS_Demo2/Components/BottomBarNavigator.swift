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
    @Binding var tittleHome: String
    @Binding var isView: Int
    var body: some View {
        VStack{
            Spacer()
            BottomBar(tittleHome: $tittleHome, isSelectedBottom: $isSelectedBottom, isView: $isView).background(CurvedShape()).padding()
            }.edgesIgnoringSafeArea(.bottom)
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
    @Binding var tittleHome: String
    @Binding var isSelectedBottom : Int
    @Binding var isView: Int
    var body: some View{
        HStack{
            Spacer().frame(width: 20)
            Button(action: {
                self.isSelectedBottom = 0
                self.tittleHome = "Popular"
                self.isView = 0
                print(self.tittleHome)
            }) {
                Image(systemName: isSelectedBottom == 0 ? "house.fill" : "house").resizable().frame(width: 30, height: 30)
            }.foregroundColor(.black)
            Spacer()
            Button(action: {
                self.isSelectedBottom = 1
                self.tittleHome = "Favorites"
                self.isView = 1
                print(self.tittleHome)
            }) {
                Image(systemName: isSelectedBottom == 1 ? "suit.heart.fill": "heart").resizable().frame(width: 30, height: 30)
            }.foregroundColor(.black)
            Spacer()
            Button(action: {
                self.isSelectedBottom = 2
                self.tittleHome = "Setting"
                self.isView = 2
                print(self.tittleHome)
            }) {
                Image(systemName: isSelectedBottom == 2 ? "paperplane.fill" : "paperplane").resizable().frame(width: 30, height: 30)
            }.foregroundColor(.black)
            Spacer()
            Button(action: {
                self.isSelectedBottom = 3
                self.tittleHome = "About"
                self.isView = 3
                print(self.tittleHome)
            }) {
                Image(systemName: isSelectedBottom == 3 ? "ellipsis.circle.fill" : "ellipsis.circle").resizable().frame(width: 30, height: 30)
            }.foregroundColor(.black)
            Spacer().frame(width: 20)
        }
    }
}



