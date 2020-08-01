//
//  ListViewHP.swift
//  iOS_Demo
//
//  Created by Uri on 7/17/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI
struct ListViewHP: View {
    @State var isSelected = Set<UUID>()
    var movies: [Movies] = movieData
    @State var isStar = false
    @State var arrayFavorites = []
    @State var favoriteMovie = 0
    @State var idStar = 0
    var GetAllDataInfo = LocalDatabaseManager.getInstance().GetAllData()
    var body: some View{
        List(movies) { item in
            NavigationLink(destination: MovieDetailsScreen(urlImageMovie: item.imgUrl, releaseDate: item.releaseDay, rating: item.rating, title: item.tittle, overView: item.overView)){
                MultiSelectFavorite(isSelectedItems: self.$isSelected, dataMovieTemp: item)
            }
            
        }
        
    }
}


struct MultiSelectFavorite: View {
    var movies: [Movies] = movieData
    @State var isStar = false
    @State var arrayFavorites = []
    @State var favoriteMovie = 0
    @State var idStar = 0
    @Binding var isSelectedItems: Set<UUID>
    var isSelected: Bool{
        isSelectedItems.contains(dataMovieTemp.id)
    }
    var GetAllDataInfo = LocalDatabaseManager.getInstance().GetAllData()
    var dataMovieTemp: Movies
    var body: some View{
        VStack(alignment: .leading) {
            HStack{
                Text(dataMovieTemp.tittle).fontWeight(.bold).font(.system(size:25))
                Spacer()
                Button(action: {
                    if self.isSelected{
                        _ = LocalDatabaseManager.getInstance().DeleteData(dataID: (self.GetAllDataInfo.object(at: self.dataMovieTemp.testID) as! MoviesLocalDB).id)
                        self.isSelectedItems.remove(self.dataMovieTemp.id)
                    }else{
                        let modeInfor = MoviesLocalDB()
                        modeInfor.id = self.dataMovieTemp.testID
                        modeInfor.imgurl = self.dataMovieTemp.imgUrl
                        modeInfor.overview = self.dataMovieTemp.overView
                        modeInfor.rating = self.dataMovieTemp.rating
                        modeInfor.releaseday = self.dataMovieTemp.releaseDay
                        modeInfor.title = self.dataMovieTemp.tittle
                        let isSave = LocalDatabaseManager.getInstance().saveData(modeInfor)
                        print(modeInfor.releaseday)
                        print(isSave)
                        self.isSelectedItems.insert(self.dataMovieTemp.id)
                    }
                }) {
                    Image(
                        systemName: self.isSelected ? "star.fill" : "star").foregroundColor(.blue).font(.system(size: 25))
                }.buttonStyle(PlainButtonStyle()).onTapGesture {
                }
            }.padding(.bottom, 0).padding(.trailing, 40)
            HStack{
                Image(dataMovieTemp.imgUrl).resizable().frame(width: 150, height: 150, alignment:    .center)
                VStack(alignment: .leading, spacing: 10){
                    Text("Release date: ").fontWeight(.bold) + Text(dataMovieTemp.releaseDay).foregroundColor(.red)
                    Text("Rating:   ").fontWeight(.bold) + Text(dataMovieTemp.rating).foregroundColor(.red)
                    Text("Overview: ").fontWeight(.bold) + Text(dataMovieTemp.overView)
                }.padding(.top, 0).padding(.trailing, 40)
            }.frame(width: UIScreen.main.bounds.width, height: 150)
        }
    }
}
