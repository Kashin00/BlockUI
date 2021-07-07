//
//  ViewController.swift
//  PickerView
//
//  Created by Матвей Кашин on 07.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var genderTextField: UITextField!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    let gender = ["Male", "Female", "Unknown"]
    
    var pickerView = UIPickerView()
    var datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.dataSource = self
        pickerView.delegate = self
            
        genderTextField.inputView = pickerView
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
        avatarImageView.contentMode = .scaleAspectFit
        
        createDatePicker()
    }
    
    func createDatePicker() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonSelector))
        toolBar.setItems([doneButton], animated: true)
        dateTextField.inputAccessoryView = toolBar
        dateTextField.inputView = datePicker
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: 0, to: Date())
        datePicker.datePickerMode = .date
    }
    
    @objc func doneButtonSelector() {
        
        let format = DateFormatter()
        format.dateStyle = .medium
        format.timeStyle = .none
        
        dateTextField.text = format.string(from: datePicker.date)
        view.endEditing(true)
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return gender[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        
        genderTextField.text = gender[row]
        genderTextField.resignFirstResponder()
    }
    
}
