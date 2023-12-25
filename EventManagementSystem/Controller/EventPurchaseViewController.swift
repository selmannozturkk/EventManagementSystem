//
//  EventPurchaseViewController.swift
//  EventManagementSystem
//
//  Created by kadir on 24.12.2023.
//

import UIKit

class EventPurchaseViewController: UIViewController {
    
    @IBOutlet weak var eventPosterImageView: UIImageView!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDetailLabel: UILabel!
    @IBOutlet weak var eventPriceLabel: UILabel!
    @IBOutlet weak var eventSeatingPlanImageView: UIImageView!
    
    
    var event: EventModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setEventInfo()
    }
    
    func setEventInfo() {
        guard let event else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        eventPosterImageView.image = event.eventPoster
        eventNameLabel.text = event.eventName
        eventDetailLabel.text = "\(event.location.capitalized) \n\(dateFormatter.string(from: event.eventDate)) \n\(event.eventCategory.rawValue.capitalized)"
        eventSeatingPlanImageView.image = event.seatingPlan
        eventPriceLabel.text = "\(event.price)$"
    }
    
    @IBAction func buyButtonPressed(_ sender: UIButton) {
    }
}
