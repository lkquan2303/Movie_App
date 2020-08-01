//
//  Movies.swift
//  iOS_Demo2
//
//  Created by Uri on 7/22/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import Foundation

struct Movies: Identifiable {
    var id = UUID();
    var testID: Int;
    var imgUrl: String;
    var releaseDay: String;
    var rating: String;
    var overView: String;
    var tittle:String;
}
let movieData = [
    Movies(testID: 1, imgUrl: "1", releaseDay: "2020-07-10", rating: "8", overView: "A first-time captain leads a convoy of allied ships carrying thousands of soldiers across the treacherous waters of the “Black Pit” to the front lines of WW2. With no air cover protection for 5 days, the captain and his convoy must battle the surrounding enemy Nazi U-boats in order to give the allies a chance to win the war.", tittle: "Greyhound"),
    Movies(testID: 2, imgUrl: "2",releaseDay: "2020-07-10", rating: "7.5", overView: "Four undying warriors who've secretly protected humanity for centuries become targeted for their mysterious powers just as they discover a new immortal.", tittle: "The Old Guard"),
    Movies(testID: 3, imgUrl: "3",releaseDay: "2020-06-24", rating: "6", overView: "A small unit of U.S. soldiers, alone at the remote Combat Outpost Keating, located deep in the valley of three mountains in Afghanistan, battles to defend against an overwhelming force of Taliban fighters in a coordinated attack. The Battle of Kamdesh, as it was known, was the bloodiest American engagement of the Afghan War in 2009 and Bravo Troop 3-61 CAV became one of the most decorated units of the 19-year conflict.", tittle: "The Outpost"),
    Movies(testID: 4, imgUrl: "4",releaseDay: "2019-09-17", rating: "9.5", overView: "The near future, a time when both hope and hardships drive humanity to look to the stars and beyond. While a mysterious phenomenon menaces to destroy life on planet Earth, astronaut Roy McBride undertakes a mission across the immensity of space and its many perils to uncover the truth about a lost expedition that decades before boldly faced emptiness and silence in search of the unknown.", tittle: "Ad Astra"),
]


