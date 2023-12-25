//
//  EventTableViewCell.swift
//  EventManagementSystem
//
//  Created by kadir on 23.12.2023.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    var eventModel: EventModel? {
        didSet {
            setEventCell()
        }
    }
    
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDetailLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    static let resueidentifier = "EventTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func setEventCell() {
        eventNameLabel.text = eventModel?.eventName.capitalized
        if let location = eventModel?.location,
           let date = eventModel?.eventDate,
           let category = eventModel?.eventCategory.rawValue,
           let price = eventModel?.price {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            eventDetailLabel.text = "\(location.capitalized) \n\(dateFormatter.string(from: date)) \n\(category.capitalized)"
            priceLabel.text = "\(price)$"
        }
    }
}
