//
//  ViewController.swift
//  EventManagementSystem
//
//  Created by Selman  on 22.12.2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private var menu = UIMenu(title: "")
    let database = EventDatabaseManager.shared
    let imagePicker = UIImagePickerController()
    var seatingPlan: UIImage?
    var eventPoster: UIImage?
    
    enum ImageSelectionContext {
        case seatingPlan
        case eventPoster
    }
    
    var currentSelectionContext: ImageSelectionContext?
    
    @IBOutlet weak var kategoriButton: UIButton!
    
    @IBOutlet weak var kontenjanTextField: UITextField!
    
    @IBOutlet weak var eventDate: UIDatePicker!
    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var etkinlikIsimTextField: UITextField!
    
    @IBOutlet weak var priceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCategoryMenu()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        setupImagePicker()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setupImagePicker() {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
    }
    
    func showImagePicker() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            // Handle the selected image based on the context
            switch currentSelectionContext {
            case .seatingPlan:
                seatingPlan = selectedImage
            case .eventPoster:
                eventPoster = selectedImage
            case .none:
                break
            }
        }
        
        // Reset the context after handling the selection
        currentSelectionContext = nil
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func kontenjanStepperTapped(_ sender: UIStepper) {
        kontenjanTextField.text = "\(Int(sender.value))"
    }
    
    @IBAction func choosePosterButtonTapped(_ sender: UIButton) {
        currentSelectionContext = .eventPoster
        showImagePicker()
    }
    
    @IBAction func olusturButtonTapped(_ sender: UIButton) {
        if isValidEvent() {
            let event = EventModel(eventName: etkinlikIsimTextField.text!,
                                   eventCategory: EventModel.EventCategory(rawValue: kategoriButton.titleLabel!.text!) ?? .Concert,
                                   eventDate: eventDate.date,
                                   location: locationTextField.text!,
                                   kontenjan: Int(kontenjanTextField.text!)!,
                                   price: Double(priceTextField.text!)!,
                                   seatingPlan: seatingPlan,
                                   eventPoster: eventPoster)
            
            database.addItemToList(item: event)
            
            self.view.showToast(message: "Etkinlik oluşturuldu.")
        } else {
            self.view.showToast(message: "Etkinlik oluşturulamadı, Değerleri tekrar kontrol ediniz!")
        }
    }
    
    @IBAction func seatingPlanButtonTapped(_ sender: UIButton) {
        currentSelectionContext = .seatingPlan
        showImagePicker()
    }
    
    private func isValidEvent() -> Bool {
        return kontenjanTextField.text?.count ?? 0 > 0
        && !eventDate.date.description.isEmpty
        && locationTextField.text?.count ?? 0 > 0
        && etkinlikIsimTextField.text?.count ?? 0 > 0
        && priceTextField.text?.count ?? 0 > 0
    }
}

extension ViewController {
    func setCategoryMenu() {
        let actionClosure = { (action: UIAction) in
            print(action.title)
        }
        
        var menuChildren: [UIMenuElement] = []
        for category in EventModel.EventCategory.allCases {
            menuChildren.append(UIAction(title: category.rawValue, handler: actionClosure))
        }
        
        kategoriButton.menu = UIMenu(options: .displayInline, children: menuChildren)
        kategoriButton.showsMenuAsPrimaryAction = true
        kategoriButton.changesSelectionAsPrimaryAction = true
        kategoriButton.menu = UIMenu(options: .displayInline, children: menuChildren)
        kategoriButton.showsMenuAsPrimaryAction = true
        kategoriButton.changesSelectionAsPrimaryAction = true
    }
}

