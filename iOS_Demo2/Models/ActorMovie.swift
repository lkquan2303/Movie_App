//
//  ActorMovie.swift
//  iOS_Demo2
//
//  Created by Uri on 7/23/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import Foundation

struct Actor: Identifiable {
    var id = UUID();
    var name: String;
    var imgUrlActor: String
}
 let  actorData = [
    Actor(name: "Nat Wolff", imgUrlActor: "actor1"),
    Actor(name: "Willem Dafoe", imgUrlActor: "actor2"),
    Actor(name: "Keith", imgUrlActor: "actor3"),
    Actor(name: "Margret", imgUrlActor: "actor4"),
    Actor(name: "The Rock", imgUrlActor: "actor5")
]
