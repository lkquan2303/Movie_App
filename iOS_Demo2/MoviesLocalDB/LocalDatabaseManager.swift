//
//  LocalDatabaseManager.swift
//  iOS_Demo2
//
//  Created by Uri on 7/31/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import Foundation
var shareInstance = LocalDatabaseManager()
class LocalDatabaseManager: NSObject{
    var database: FMDatabase? = nil
    
    class func getInstance() -> LocalDatabaseManager{
        if shareInstance.database == nil{
            shareInstance.database = FMDatabase(path: Utils.getPath("FavoriteMovies.db"))
        }
        return shareInstance
    }
    func saveData(_ modelInfor: MoviesLocalDB) -> Bool{
        shareInstance.database?.open()
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO FavoriteMovies(id, imgurl, releaseday, rating, overview, title) VALUES (?,?,?,?,?,?)", withArgumentsIn: [modelInfor.id, modelInfor.imgurl, modelInfor.releaseday, modelInfor.rating, modelInfor.overview, modelInfor.title])
        shareInstance.database?.close()
        return isSave!
    }
    func GetAllData() -> NSMutableArray {
        shareInstance.database?.open()
        let resultSet:FMResultSet! =  shareInstance.database!.executeQuery("SELECT * FROM FavoriteMovies", withArgumentsIn: [0])
        let itemInfo: NSMutableArray = NSMutableArray()
        if resultSet != nil{
            while resultSet.next(){
                let item: MoviesLocalDB = MoviesLocalDB()
                item.id = Int(resultSet.int(forColumn: "id"))
                item.imgurl = String(resultSet.string(forColumn: "imgurl")!)
                item.overview = String(resultSet.string(forColumn: "overview")!)
                item.rating = String(resultSet.string(forColumn: "rating")!)
                item.releaseday = String(resultSet.string(forColumn: "releaseday")!)
                item.title = String(resultSet.string(forColumn: "title")!)
                itemInfo.add(item)
            }
        }
        shareInstance.database!.close()
        return itemInfo
    }
    func DeleteData(dataID: Int) -> NSMutableArray {
        shareInstance.database!.open()
        let resultSet: FMResultSet! = shareInstance.database!.executeQuery("DELETE FROM FavoriteMovies WHERE Id = ?", withArgumentsIn: [dataID])
        let itemInfo: NSMutableArray = NSMutableArray()
        if resultSet != nil{
            while resultSet.next(){
                let item: MoviesLocalDB = MoviesLocalDB()
                item.id = Int(resultSet.int(forColumn: "id"))
                item.imgurl = String(resultSet.string(forColumn: "imgurl")!)
                item.overview = String(resultSet.string(forColumn: "overview")!)
                item.rating = String(resultSet.string(forColumn: "rating")!)
                item.releaseday = String(resultSet.string(forColumn: "releaseday")!)
                item.title = String(resultSet.string(forColumn: "title")!)
                itemInfo.add(item)
            }
        }
        shareInstance.database!.close()
        return itemInfo
    }
}
