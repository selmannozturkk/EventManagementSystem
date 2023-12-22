//
//  SeatCollectionViewCell.swift
//  EventManagementSystem
//
//  Created by Selman  on 22.12.2023.
//

import UIKit

class SeatCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var seatNumberLabel: UILabel!
    var seatNumber = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        seatNumberLabel.text = "\(seatNumber)"
    }

}
