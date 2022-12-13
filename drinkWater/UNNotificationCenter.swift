//
//  UNNotificationCenter.swift
//  drinkWater
//
//  Created by hwict on 2022/12/13.
//

import Foundation
import UserNotifications

extension UNUserNotificationCenter {
    func addNotificationRequest(by alert: Alert) {
        let content = UNMutableNotificationContent()
        content.title = "물 마실 시간이에요."
        content.body = "세계보건기구(WHO)가 권장하는 하루 물 섭취량은 1.5~2 리터 입니다."
        content.sound = .default
        content.badge = 1
        
        let component = Calendar.current.dateComponents([.hour, .minute], from: alert.date)
        debugPrint(component)
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: alert.isOn)
        
        let request = UNNotificationRequest(identifier: alert.id, content: content, trigger: trigger)
        debugPrint("request add Alert")
        self.add(request,withCompletionHandler: nil)
    }
}
