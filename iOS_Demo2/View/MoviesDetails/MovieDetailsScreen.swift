//
//  MovieDetailsScreen.swift
//  iOS_Demo2
//
//  Created by Uri on 7/22/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI
import UserNotifications
struct MovieDetailsScreen: View {
    var movies: [Movies] = movieData
    var urlImageMovie: String
    var releaseDate: String
    var rating: String
    var title: String
    var overView: String
    var actors: [Actor] = actorData
    @State var nowDay = Date()
    @State var isShowTime = false
    @State var isShowAlert = false
    var body: some View {
        NavigationView{
            ZStack{
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "star").resizable().frame(width: 30, height: 30)
                        Spacer().frame(width: 20)
                        VStack(alignment: .leading){
                            Text("Release date: \(releaseDate)").font(.system(size: 18))
                            Text("Rating: \(rating)").font(.system(size: 18))
                        }
                        Spacer()
                    }
                    HStack(alignment: .top){
                        VStack{
                            Image(urlImageMovie).resizable().frame(width: 200, height: 200)
                            Button(action: {
                                self.isShowTime.toggle()
                                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {
                                    success, error in
                                    if success{
                                        print("Done")
                                    }else if let error = error{
                                        print(error.localizedDescription)
                                    }
                                }
                            }) {
                                Text("REMINDER").foregroundColor(.white)
                            }.padding().frame(height: 35).background(Color.blue)
                        }
                        VStack(alignment: .leading){
                            Text("Overview:").foregroundColor(.red)
                            ScrollView{
                                Text(overView).font(.system(size: 18)).fontWeight(.bold).opacity(0.65)
                            }
                        }.frame(minHeight: 100, maxHeight: 350)
                    }
                    Text("Cast & Crew").font(.system(size: 20)).fontWeight(.bold)
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(0..<actorData.count){i in
                                VStack{
                                    Image(self.actors[i].imgUrlActor).resizable().frame(width: 100, height: 100)
                                    Text(self.actors[i].name)
                                }
                            }
                        }
                    }
                    Spacer()
                }.padding()
                CustomDatePicker(nowDay: self.$nowDay, isShowTime: $isShowTime, isShowAlert: $isShowAlert, releaseDate: title, rating: rating, title: releaseDate ).padding(.vertical)
                    .offset(y: self.isShowTime ? 0 : UIScreen.main.bounds.height).animation(.interactiveSpring(response: 0.6, dampingFraction: 0.9, blendDuration: 0.6))
            }.background(isShowTime ? Color.black.opacity(0.2) : Color.clear).hiddenNavigationBarStyle()
        }.navigationBarTitle(title)
    }
}



//struct MovieDetailsScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailsScreen(movies: movieData, actors: actorData)
//    }
//}

struct CustomDatePicker:View {
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, hh:mm a"
        return formatter
    }
    @Binding var nowDay: Date
    @Binding var isShowTime: Bool
    @Binding var isShowAlert: Bool
    var releaseDate: String
    var rating: String
    var title: String
    let calender = Calendar.current
    var body: some View{
        VStack{
            Spacer()
            VStack{
                DatePicker(selection: $nowDay,in: Date()..., label: {
                    Text("HI")
                }).labelsHidden().frame(width: UIScreen.main.bounds.width - 15).background(Color.white)
                HStack{
                    HStack{
                        Spacer()
                        Button(action: {
                            self.isShowTime.toggle()
                        }) {
                            Text("Cancel").foregroundColor(.red).font(.system(size: 20))
                        }
                        Spacer()
                    }
                    Divider().foregroundColor(Color.gray)
                    HStack{
                        Spacer()
                        Button(action: {
                            let content = UNMutableNotificationContent()
                            content.title = self.title
                            content.subtitle = "Let see the film, Guys"
                            content.sound = UNNotificationSound.default
                            
                            let imageName = "2"
                            let imageURL = Bundle.main.url(forResource: imageName, withExtension: "jpg")
                            
                            let attachment = try! UNNotificationAttachment(identifier: "Image", url: imageURL!, options: .none)
                            
                            content.attachments = [attachment]
                            
                            
                            let triggerWeekly = Calendar.current.dateComponents([.weekday,.hour,.minute,], from: self.nowDay)
                            print(triggerWeekly)
                            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerWeekly, repeats: false)
                            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                            UNUserNotificationCenter.current().add(request)
                            self.isShowTime.toggle()
                            self.isShowAlert.toggle()
                        }) {
                            Text("Select").font(.system(size: 20)).fontWeight(.bold)
                        }.alert(isPresented: $isShowAlert) {
                            Alert(title: Text("Reminder").font(.system(size: 18)).fontWeight(.bold), message: Text(self.releaseDate + " - 2020"), dismissButton: .default(Text("OK")))
                        }
                        Spacer()
                    }
                }.frame(width: UIScreen.main.bounds.width - 15, height: 50).background(Color.white).cornerRadius(15)
            }
        }
    }
}
extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }
    
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}




struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}
