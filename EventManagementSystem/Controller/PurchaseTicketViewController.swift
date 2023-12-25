//
//  PurchaseTicketViewController.swift
//  EventManagementSystem
//
//  Created by kadir on 24.12.2023.
//

import UIKit

class PurchaseTicketViewController: UIViewController {
    
    let database = UserDatabaseManager.shared
    
    @IBOutlet weak var cardCVCTextField: UITextField!
    @IBOutlet weak var cardDateTextField: UITextField!
    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func payButtonPressed(_ sender: UIButton) {
        if isValidPay() {
            database.currentUser?.tickets.append(TicketModel())
            self.view.showToast(message: "Payment is successful")
            performSegue(withIdentifier: "unwindToEvents", sender: self)
        } else {
            self.view.showToast(message: "Please check your payment values, Payment is unsuccessful")
        }
    }
    
    private func isValidPay() -> Bool {
        return cardCVCTextField.text?.count ?? 0 > 0
        && cardDateTextField.text?.count ?? 0 > 0
        && cardNumberTextField.text?.count ?? 0 > 0
        && nameTextField.text?.count ?? 0 > 0
    }
}
