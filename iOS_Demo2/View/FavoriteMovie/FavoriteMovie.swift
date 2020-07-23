//
//  FavoriteMovie.swift
//  iOS_Demo
//
//  Created by Uri on 7/21/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct FavoriteMovie: View {
    
    var movies: [Movies] = movieData
    var body: some View{
        VStack{
            List(movies) { item in
                VStack(alignment: .leading) {
                    HStack{
                        Text(item.tittle).fontWeight(.bold).font(.system(size:25))
                        Spacer()
                        Image(systemName: "star").foregroundColor(.blue).font(.system(size: 25))
                    }.padding(.bottom, 0).padding(.trailing, 40)
                    HStack{
                        Image(item.imgUrl).resizable().frame(width: 150, height: 150, alignment: .center)
                        VStack(alignment: .leading, spacing: 10){
                            Text("Release date: ").fontWeight(.bold) + Text(item.releaseDay).foregroundColor(.red)
                            Text("Rating:   ").fontWeight(.bold) + Text(item.rating).foregroundColor(.red)
                            Text("Overview: ").fontWeight(.bold) + Text(item.overView)
                        }.padding(.top, 0).padding(.trailing, 40)
                    }.frame(width: UIScreen.main.bounds.width, height: 150)
                }
            }
        }
    }
}

struct FavoriteMovie_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteMovie()
    }
}
