
//
//  Alarm.swift
//  iOS_Demo2
//
//  Created by Uri on 7/23/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI
import UserNotifications
struct Alarm: View {
    @State var isPresent = false
    @State var isAlert = false
    @State var isShowTime = false
    var currentDay = Date()
    @State var nowDay = Date()
    var dateComponent = DateComponents()
    var body: some View {
        VStack{
            Button("Show Time"){
                self.isShowTime.toggle()
                print(self.currentDay.get(.day))
            }
            VStack{
                Spacer()
                CustomDatePicker1(nowDay: $nowDay)
                
                .offset(y: self.isShowTime ? 0 : UIScreen.main.bounds.height).animation(.interactiveSpring(response: 0.6, dampingFraction: 0.9, blendDuration: 0.6))
            }
            Button("REQUEST PERMISS"){
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {
                    success, error in
                    if success{
                        print("Done")
                    }else if let error = error{
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Set REMINDER"){
                let content = UNMutableNotificationContent()
                content.title = "Hello"
                content.subtitle = "Di choi k, kkakakakakaka"
                content.sound = UNNotificationSound.default
                let triggerWeekly = Calendar.current.dateComponents([.weekday,.hour,.minute,], from: self.nowDay)
                print(triggerWeekly)
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerWeekly, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct Alarm_Previews: PreviewProvider {
    static var previews: some View {
        Alarm()
    }
}
func createDate(weekday: Int, hour: Int, minute: Int, year: Int)->Date{
    
    var components = DateComponents()
    components.hour = hour
    components.minute = minute
    components.year = year
    components.weekday = weekday // sunday = 1 ... saturday = 7
    components.weekdayOrdinal = 10
    components.timeZone = .current
    
    let calendar = Calendar(identifier: .gregorian)
    return calendar.date(from: components)!
}
struct CustomDatePicker1:View {
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, hh:mm a"
        return formatter
    }
    @Binding var nowDay: Date
    let calender = Calendar.current
    var body: some View{
        VStack{
            DatePicker(selection: $nowDay,in: Date()..., label: {
                Text("HI")
            }).labelsHidden().frame(width: UIScreen.main.bounds.width - 15).background(Color("Color").opacity(0.05))
            HStack{
                HStack{
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Text("Cancel").foregroundColor(.red).font(.system(size: 20))
                    }
                    Spacer()
                }
                Divider().foregroundColor(Color.gray)
                HStack{
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Text("Select").font(.system(size: 20)).fontWeight(.bold)
                    }
                    Spacer()
                }
            }.frame(width: UIScreen.main.bounds.width - 15, height: 50).background(Color("Color").opacity(0.05)).cornerRadius(15)
        }
        
    }
}
