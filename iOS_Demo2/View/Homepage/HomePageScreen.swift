//
//  HomePageScreen.swift
//  iOS_Demo2
//
//  Created by Uri on 7/22/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct HomePageScreen: View {
    @State var isListView = true
    @State var isShowView = 0
    @State var isView = 0
    @State var isShowMenu = false
    @State var titleHomepage = "Popular"
    var body: some View {
        ZStack{
            VStack{
                NavigationView{
                    viewBuilder()
                        .navigationBarTitle(Text(titleHomepage), displayMode: .inline).navigationBarItems(leading: Button(action: {
                            self.isShowMenu.toggle()
                        }, label: {
                            Image("menu").resizable().frame(width: 30, height: 30).foregroundColor(.black)
                        }), trailing: Button(action: {
                            self.isListView.toggle()
                        }, label: {
                            if isShowView == 0{
                                Image(
                                    isListView && isView == 0 ? "view1" : "view2").resizable().frame(width: 35, height: 35).foregroundColor(.black)
                            }else{
                                Image(
                                    isListView && isView == 0 ? "" : "").resizable().frame(width: 35, height: 35).foregroundColor(.black)
                            }
                        }))
                  
                }
                Spacer()
                BottomBarNavigator(titleHome: $titleHomepage, isShowView: $isShowView).frame( height: 20).padding()
                
            }.offset(x: isShowMenu ? UIScreen.main.bounds.width * 0.8 : 0).animation(.interactiveSpring(response: 0.6, dampingFraction: 0.9, blendDuration: 0.6))
            GeometryReader{_ in
                HStack{
                    Profile().offset(x: self.isShowMenu ? 0 : -UIScreen.main.bounds.width).animation(.interactiveSpring(response: 0.6, dampingFraction: 0.9, blendDuration: 0.6))
                }
            }
        }
    }
    func viewBuilder() -> AnyView {
        switch isShowView{
        case 1:
            print(isShowView)
            return AnyView(FavoritesMoviesScreen())
        case 2:
            print(isShowView)
            return AnyView(SettingScreen())
        case 3:
            print(isShowView)
            return AnyView(AboutScreen())
        default:
            if isListView == false {
                return AnyView(GridViewHP())
            }else{
                return AnyView(ListViewHP())
            }
        }
    }
}

struct HomePageScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomePageScreen()
    }
}
