//
//  Utils.swift
//  iOS_Demo2
//
//  Created by Uri on 7/31/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import Foundation

class Utils: NSObject{
    class func getPath(_ fileName: String) -> String {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileUrl = documentDirectory.appendingPathComponent(fileName)
        print("Database patch: \(fileUrl.path)")
        return fileUrl.path
    }
    class func copyDatabase(_ filename: String){
        let dbPath = getPath("FavoriteMovies.db")
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: dbPath){
            let bundle = Bundle.main.resourceURL
            let file = bundle?.appendingPathComponent(filename)
            var error: NSError?
            do{
                try fileManager.copyItem(atPath: (file?.path)!, toPath: dbPath)
            }catch let error1 as NSError{
                error = error1
            }
            if error == nil{
                print("error in db")
            }else{
                print("Yeh")
            }
        }
    }
}
