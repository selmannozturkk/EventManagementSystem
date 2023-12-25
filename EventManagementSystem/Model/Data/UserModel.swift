//
//  UserModel.swift
//  EventManagementSystem
//
//  Created by kadir on 23.12.2023.
//

import Foundation

struct UserModel: Equatable {
    var userName: String
    var userEmail: String
    var userPasswrod: String
    var usreRole: UserRole
    var tickets: [TicketModel]
    
    enum UserRole: String {
        case Customer
        case Admin
    }
}

struct TicketModel: Equatable {
    
}
