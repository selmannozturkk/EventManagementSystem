//
//  DatabaseManager.swift
//  EventManagementSystem
//
//  Created by kadir on 23.12.2023.
//

import Foundation

protocol EventDatabaseManagerDelegate: AnyObject {
    func databaseChanged()
}

class EventDatabaseManager {

    static let shared = EventDatabaseManager()
    weak var delegate: EventDatabaseManagerDelegate?

    private init() { }

    private var sharedList: [EventModel] = []

    func addItemToList(item: EventModel) {
        sharedList.append(item)
        delegate?.databaseChanged()
    }

    func removeItemFromList(item: EventModel) {
        if let index = sharedList.firstIndex(of: item) {
            sharedList.remove(at: index)
            delegate?.databaseChanged()
        }
    }

    func getAllItems() -> [EventModel] {
        return sharedList
    }
}
