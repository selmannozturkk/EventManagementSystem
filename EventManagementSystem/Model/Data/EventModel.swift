//
//  EventModel.swift
//  EventManagementSystem
//
//  Created by kadir on 23.12.2023.
//

import UIKit

struct EventModel: Equatable {
    var eventName: String
    var eventCategory: EventCategory
    var eventDate: Date
    var location: String
    var kontenjan: Int
    var price: Double
    var seatingPlan: UIImage?
    var eventPoster: UIImage?
    
    enum EventCategory: String, CaseIterable {
        case Concert = "Concert"
        case Festival = "Festival"
        case Theatre = "Theatre"
    }
}

