//
//  ViewController.swift
//  BaseUI
//
//  Created by Матвей Кашин on 06.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSliderOutlet: UISlider!
    @IBOutlet weak var greenSliderOutlet: UISlider!
    @IBOutlet weak var blueSliderOutlet: UISlider!
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextField.text = String(redSliderOutlet.value)
        greenTextField.text = String(greenSliderOutlet.value)
        blueTextField.text = String(blueSliderOutlet.value)
                
        redTextField.delegate = self
        blueTextField.delegate = self
        greenTextField.delegate = self
    }
    
    @IBAction func redSliderAction(_ sender: Any) {
        redTextField.text = String(redSliderOutlet.value)
    }
    
    @IBAction func greenSliderAction(_ sender: Any) {
        greenTextField.text = String(greenSliderOutlet.value)
    }
    
    @IBAction func blueSliderAction(_ sender: Any) {
        blueTextField.text = String(blueSliderOutlet.value)
    }
    
    func changeColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSliderOutlet.value), green: CGFloat(greenSliderOutlet.value), blue: CGFloat(blueSliderOutlet.value), alpha: 1)
    }
    
    @IBAction func rgbSliders(_ sender: Any) {
        changeColor()
    }
    
}

extension ViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

            let allowedCharacters = CharacterSet(charactersIn:"0123456789")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
    }
        
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        redSliderOutlet.value = Float(redTextField.text!)!
        greenSliderOutlet.value = Float(greenTextField.text!)!
        blueSliderOutlet.value = Float(blueTextField.text!)!

        changeColor()

        return true
}
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.resignFirstResponder()
        return true
    }
}

