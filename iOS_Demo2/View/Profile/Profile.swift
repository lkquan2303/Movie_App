//
//  Profile.swift
//  iOS_Demo
//
//  Created by Uri on 7/17/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct Profile: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var loadImage = UIImage()
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(uiImage: loadImage).resizable().frame(width: 200, height: 200)
                    }
                    Spacer()
                }
                HStack{
                    Spacer()
                    Text("John Marker").font(.system(size: 25)).fontWeight(.bold)
                    Spacer()
                }
                HStack{
                    Image("cake").resizable().frame(width: 40, height: 40)
                    Spacer().frame(width: 20)
                    Text("1970-01-01").font(.system(size: 25))
                }
                HStack(){
                    Image("mail").resizable().frame(width: 40, height: 40)
                    Spacer().frame(width: 20)
                    Text("johnmarker@gmail.com").font(.system(size: 25))
                }
                HStack(){
                    Image("person").resizable().frame(width: 40, height: 40)
                    Spacer().frame(width: 20)
                    Text("Male").font(.system(size: 25))
                }
                HStack{
                    Spacer()
                    Spacer()
                }
                Text("Reminder List: ").fontWeight(.bold).font(.system(size: 25)).padding()
                VStack{
                    Text("The Dark Tower - 2017 - 5.6/10 2017-03-02 10:06                    ").background(Color("Color1")).font(.system(size: 25)).lineLimit(2)
                    Spacer().frame(width: 10, height: 10)
                    Text("The Dark Tower - 2017 - 5.6/10 2017-03-02 10:06                    ").background(Color("Color1")).font(.system(size: 25)).lineLimit(2)
                    Spacer()
                }.padding()
                HStack{
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Text("Show All").font(.system(size: 20)).foregroundColor(.black).frame(width: 150, height: 10).padding(10)
                    }.overlay(RoundedRectangle(cornerRadius: 20).stroke())
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    Text("Copyright@Enc 2017").font(.system(size: 20))
                    Spacer()
                }.padding()
                }.padding()        .background(Color("bg2")).overlay(Rectangle().stroke(Color.primary.opacity(0.2), lineWidth: 2)).shadow(radius: 3).edgesIgnoringSafeArea(.all).frame(width: UIScreen.main.bounds.width / 1.2)
            Spacer()
        }.frame(width: UIScreen.main.bounds.width)

    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
