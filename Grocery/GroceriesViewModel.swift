//
//  GroceriesViewModel.swift
//  Grocery
//
//  Created by Jordy Kingama on 17/10/2020.
//

import Foundation
import EventKit

class GroceriesViewModel: ObservableObject {
    
    @Published var groceries: [GroceryItem] = []
    
    var eventStore: EKEventStore
    
    init() {
        eventStore = EKEventStore()
        
        let status = EKEventStore.authorizationStatus(for: .reminder)
        
        switch status {
        case .authorized:
            print("Ok")
            self.getReminders()
        case .denied:
            print("NOk")
        case .notDetermined:
            print("NOk")
            requestAccess()
        default:
            print("NOk")
        }
    }

    private func requestAccess() {
        eventStore.requestAccess(to: .reminder) { (granted, error) in
            if granted {
                print("Access granted")
                self.getReminders()
            }
        }
    }
    
    func getReminders() {
        let predicate: NSPredicate? = eventStore.predicateForReminders(in: nil)
        
        if let aPredicate = predicate {
            eventStore.fetchReminders(matching: aPredicate) { (ekReminders) in
                guard let reminders = ekReminders else {
                    return
                }
                
                for reminder in reminders {
                    print(reminder.title!)
                    
                    var grocery = GroceryItem()
                    grocery.name = reminder.title
                    self.groceries.append(grocery)
                }
            }
        }
    }
}
