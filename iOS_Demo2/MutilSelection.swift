//
//  MutilSelection.swift
//  iOS_Demo2
//
//  Created by Uri on 8/1/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI



struct MutilSelect: View {
    var movies: Movies
    @Binding var selectedItems: Set<UUID>
    var isSelected: Bool{
        selectedItems.contains(movies.id)
    }
    var body: some View{
        HStack{
            Text(self.movies.rating)
            Spacer()
            if self.isSelected{
                Image(systemName: "checkmark").foregroundColor(Color.blue)
            }
        }
        .onTapGesture {
            print("HI")
            if self.isSelected{
                self.selectedItems.remove(self.movies.id)
            }else{
                self.selectedItems.insert(self.movies.id)
            }
        }
    }
}

struct MutilSelection: View {
    @State var isSelected = Set<UUID>()
    var movies: [Movies] = movieData
    var body: some View {
        NavigationView{
            List(movies, selection: $isSelected){i in
                VStack{
                    MutilSelect(movies: i, selectedItems: self.$isSelected)
                }
            }
        }
    }
}

struct MutilSelection_Previews: PreviewProvider {
    static var previews: some View {
        MutilSelection()
    }
}
