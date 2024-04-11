//
//  ContentView.swift
//  HotProspects
//
//  Created by Rob Ranf on 4/10/24.
//

import SwiftUI
import UserNotifications

struct NotificationViewTest: View {
    let users = ["Tohru", "Yuki", "Kyo", "Yui", "Megumin"]
    @State private var selection = Set<String>()
    @State private var selectedTab = "One"
    
    var body: some View {
        List(users, id: \.self, selection: $selection) { user in
            Text(user)
        }
        
        EditButton()
        
        if selection.isEmpty == false {
            Text("You selected \(selection.formatted())")
        }
        
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default
                
                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                // add our notification request
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

#Preview {
    NotificationViewTest()
}
