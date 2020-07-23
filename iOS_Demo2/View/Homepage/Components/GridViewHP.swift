//
//  GridViewHP.swift
//  iOS_Demo
//
//  Created by Uri on 7/17/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI
import QGrid
struct GridViewHP: View {
    var movies: [Movies] = movieData
    var body: some View{
        QGrid(movies,columns: 2){item in
            ScrollView{
                VStack{
                    Image(item.imgUrl).resizable().frame(width: 200, height: 200).padding(.bottom, 0)
                    Text(item.tittle).fontWeight(.bold).padding(.top, 0).font(.system(size: 25))
                }.padding()
            }
        }
    }
}

struct GridViewHP_Previews: PreviewProvider {
    static var previews: some View {
        GridViewHP()
    }
}
