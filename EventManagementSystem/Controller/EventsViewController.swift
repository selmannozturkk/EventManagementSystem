//
//  EventsViewController.swift
//  EventManagementSystem
//
//  Created by kadir on 23.12.2023.
//

import UIKit

class EventsViewController: UIViewController {
    
    let database = EventDatabaseManager.shared
    
    @IBOutlet weak var eventsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        database.delegate = self
        
        eventsTableView.register(UINib(nibName: "EventTableViewCell", bundle: nil), forCellReuseIdentifier: EventTableViewCell.resueidentifier)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "goEventPurchase":
            let vc = segue.destination as! EventPurchaseViewController
            if let selectedIndex = eventsTableView.indexPathForSelectedRow?.row {
                vc.event = database.getAllItems()[selectedIndex]
            }
        default:
            break
        }
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
}

// MARK: -TableView Methods
extension EventsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return database.getAllItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.resueidentifier, for: indexPath) as! EventTableViewCell
        
        let event = database.getAllItems()[indexPath.row]
        cell.eventModel = event
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goEventPurchase", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let items = database.getAllItems()
        if editingStyle == .delete {
            database.removeItemFromList(item: items[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
}

// MARK: -Database methods
extension EventsViewController: EventDatabaseManagerDelegate {
    func databaseChanged() {
        eventsTableView.reloadData()
    }
}
