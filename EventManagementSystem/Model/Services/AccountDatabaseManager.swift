//
//  AccountDatabaseManager.swift
//  EventManagementSystem
//
//  Created by kadir on 23.12.2023.
//

import Foundation

protocol UserDatabaseManagerDelegate: AnyObject {
    func databaseChanged()
}

class UserDatabaseManager {
    
    static let shared = UserDatabaseManager()
    weak var delegate: UserDatabaseManagerDelegate?
    private var userList: [UserModel] = []
    var currentUser: UserModel?
    
    private init() {
        addUser(user: UserModel(userName: "admin",
                                userEmail: "admin",
                                userPasswrod: "admin123",
                                usreRole: .Admin,
                                tickets: []))
        addUser(user: UserModel(userName: "softeng",
                                userEmail: "softeng",
                                userPasswrod: "softeng",
                                usreRole: .Customer, 
                                tickets: []))
    }
    
    func addUser(user: UserModel) {
        // Kullanıcının zaten var olup olmadığını kontrol edin
        if !userList.contains(where: { $0.userEmail == user.userEmail }) {
            userList.append(user)
            delegate?.databaseChanged()
        }
    }
    
    func removeUser(user: UserModel) {
        if let index = userList.firstIndex(of: user) {
            userList.remove(at: index)
            if currentUser == user {
                currentUser = nil // Mevcut kullanıcı silindiğinde null'a ayarla
            }
            delegate?.databaseChanged()
        }
    }
    
    func setCurrentUser(user: UserModel) {
        if userList.contains(user) {
            currentUser = user
        }
    }
    
    func getCurrentUser() -> UserModel? {
        return currentUser
    }
    
    func getAllUsers() -> [UserModel] {
        return userList
    }
}
