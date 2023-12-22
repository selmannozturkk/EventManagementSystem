//
//  ViewController.swift
//  EventManagementSystem
//
//  Created by Selman  on 22.12.2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var kategoriButton: UIButton!
    let categories: [String] = ["Concert", "Festival", "Theatre"]
    private var menu = UIMenu(title: "")

    @IBOutlet weak var kontenjanTextField: UITextField!
        
    @IBOutlet weak var eventDate: UIDatePicker!
    
    @IBOutlet weak var locationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         setCategoryMenu()
    }
    
    @IBAction func kontenjanStepperTapped(_ sender: UIStepper) {
            kontenjanTextField.text = "\(Int(sender.value))"
    }
}

extension ViewController {
    func setCategoryMenu() {
        let actionClosure = { (action: UIAction) in
             print(action.title)
        }
        
        var menuChildren: [UIMenuElement] = []
        for category in categories {
            menuChildren.append(UIAction(title: category, handler: actionClosure))
        }

        kategoriButton.menu = UIMenu(options: .displayInline, children: menuChildren)
        kategoriButton.showsMenuAsPrimaryAction = true
        kategoriButton.changesSelectionAsPrimaryAction = true
        kategoriButton.menu = UIMenu(options: .displayInline, children: menuChildren)
        kategoriButton.showsMenuAsPrimaryAction = true
        kategoriButton.changesSelectionAsPrimaryAction = true
    }
}

