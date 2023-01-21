//
//  ViewController.swift
//  CodePath Prework
//
//  Created by Anh Vu on 1/20/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Dropdown menu
        dropDownButton.menu = UIMenu(children: [
            UIAction(title: "Add Additional Info", state: .on, handler: toggleAdditionalInfo),
            UIAction(title: "Age", handler: toggleAdditionalInfo),
            UIAction(title: "City", handler: toggleAdditionalInfo),
        ])
        dropDownButton.changesSelectionAsPrimaryAction = true
        dropDownButton.showsMenuAsPrimaryAction = true
        
        // Additional info - hidden initially
        additionalField.isHidden = true
        additionalLabel.isHidden = true
    }
    
    // Text fields
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    
    // Segmented controls
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var themeSegmentedControl: UISegmentedControl!
    
    // Pets
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    
    // Additional info
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var dropDownMenu: UIMenu!
    @IBOutlet weak var additionalField: UITextField!
    @IBOutlet weak var additionalLabel: UILabel!
    
    // Handler for stepping pets count
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }
    
    // Handler for generating self introduction
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
        
        var additional = ""
        if !additionalField.isHidden {
            if additionalLabel.text == "Age" {
                additional = "I am \(additionalField.text!) years old as of today. "
            } else {
                additional = "I am living in \(additionalField.text!) right now. "
            }
        }
        
        let introduction = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I go to \(schoolNameTextField.text!). \(additional)I am currently in my \(year!) year and I have \(numberOfPetsLabel.text!) dogs. It is \(morePetsSwitch.isOn) that I want more pets."
        
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)

        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
    // Handler for toggling background color
    @IBAction func toggleTheme(_ sender: UISegmentedControl) {
        var color = self.view.backgroundColor;
        switch themeSegmentedControl.selectedSegmentIndex {
            case 0:
                color = UIColor.white
            case 1:
                color = UIColor.red
            default:
                break;
        }
        self.view.backgroundColor = color
    }
    
    // Helper for `toggleAdditionalInfo`
    func toggleAdditionalInfoVisibility(bool: Bool) {
        UIView.transition(with: additionalField, duration: 0.4, options: .transitionCrossDissolve, animations: {() -> Void in self.additionalField.isHidden = bool
        }, completion: { _ in })
        
        UIView.transition(with: additionalLabel, duration: 0.4, options: .transitionCrossDissolve, animations: {() -> Void in self.additionalLabel.isHidden = bool
        }, completion: { _ in })
    }
    
    // Handler for toggling visibility of additional field
    func toggleAdditionalInfo(_ sender: UIAction) {
        
        switch sender.title {
            case "Age":
                additionalLabel.text = "Age"
                toggleAdditionalInfoVisibility(bool: false)
            case "City":
                additionalLabel.text = "City"
                toggleAdditionalInfoVisibility(bool: false)
            default:
                toggleAdditionalInfoVisibility(bool: true);
                
        }
    }
    
}

