//
//  FavoritesMoviesScreen.swift
//  iOS_Demo2
//
//  Created by Uri on 7/22/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct FavoritesMoviesScreen: View {
    var movies: [Movies] = movieData
    @State var isStar = false
    @State var arrayFavorites = []
    @State var favoriteMovie = 0
    var GetAllDataInfo = LocalDatabaseManager.getInstance().GetAllData()
    var body: some View {
        List(0..<GetAllDataInfo.count) { item in
            NavigationLink(destination: MovieDetailsScreen(urlImageMovie: (self.GetAllDataInfo.object(at: item) as! MoviesLocalDB).imgurl, releaseDate: (self.GetAllDataInfo.object(at: item) as! MoviesLocalDB).releaseday, rating: (self.GetAllDataInfo.object(at: item) as! MoviesLocalDB).rating, title: (self.GetAllDataInfo.object(at: item) as! MoviesLocalDB).title, overView: (self.GetAllDataInfo.object(at: item) as! MoviesLocalDB).overview)){
                VStack(alignment: .leading) {
                    HStack{
                        Text((self.GetAllDataInfo.object(at: item) as! MoviesLocalDB).title).fontWeight(.bold).font(.system(size:25))
                        Spacer()
                        Button(action: {
                            self.isStar.toggle()
                            print("Hello")
                        }) {
                            Image(
                                systemName: self.isStar ? "star.fill" : "star").foregroundColor(.blue).font(.system(size: 25))
                        }.buttonStyle(PlainButtonStyle())
                    }.padding(.bottom, 0).padding(.trailing, 40)
                    HStack{
                        Image((self.GetAllDataInfo.object(at: item) as! MoviesLocalDB).imgurl).resizable().frame(width: 150, height: 150, alignment:    .center)
                        VStack(alignment: .leading, spacing: 10){
                            Text("Release date: ").fontWeight(.bold) + Text((self.GetAllDataInfo.object(at: item) as! MoviesLocalDB).releaseday).foregroundColor(.red)
                            Text("Rating:   ").fontWeight(.bold) + Text((self.GetAllDataInfo.object(at: item) as! MoviesLocalDB).rating).foregroundColor(.red)
                            Text("Overview: ").fontWeight(.bold) + Text((self.GetAllDataInfo.object(at: item) as! MoviesLocalDB).overview)
                        }.padding(.top, 0).padding(.trailing, 40)
                    }.frame(width: UIScreen.main.bounds.width, height: 150)
                }
            }

        }
        
//        ScrollView(.vertical){
//            VStack{
//                ForEach(0..<GetAllDataInfo.count){i in
//
//                    Text((self.GetAllDataInfo.object(at: item) as! MoviesLocalDB).imgurl)
//                }
//            }
//        }
    }
}

struct FavoritesMoviesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesMoviesScreen()
    }
}
