//
//  ViewController.swift
//  BaseUI
//
//  Created by Матвей Кашин on 06.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var colorView: UIView!
    @IBOutlet weak private var redSlider: UISlider!
    @IBOutlet weak private var greenSlider: UISlider!
    @IBOutlet weak private var blueSlider: UISlider!
    @IBOutlet weak private var redTextField: UITextField!
    @IBOutlet weak private var greenTextField: UITextField!
    @IBOutlet weak private var blueTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        redTextField.text = String(redSlider.value)
        greenTextField.text = String(greenSlider.value)
        blueTextField.text = String(blueSlider.value)
        
        redTextField.delegate = self
        blueTextField.delegate = self
        greenTextField.delegate = self
    }
    
    @IBAction func redSliderDidChangeValue(_ sender: Any) {
        redTextField.text = String(redSlider.value)
    }
    
    @IBAction func greenSliderDidChangeValue(_ sender: Any) {
        greenTextField.text = String(greenSlider.value)
    }
    
    @IBAction func blueSliderDidChangeValue(_ sender: Any) {
        blueTextField.text = String(blueSlider.value)
    }
    
    func changeColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    @IBAction func slidersDidChangeViewColor(_ sender: Any) {
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
        
        redSlider.value = Float(redTextField.text ?? "") ?? 0.0
        greenSlider.value = Float(greenTextField.text ?? "") ?? 0.0
        blueSlider.value = Float(blueTextField.text ?? "") ?? 0.0
        
        changeColor()
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let slidersArray = [redSlider, greenSlider, blueSlider]
     
        guard let text = textField.text ,
              text.count <= 3 ,
              let currentValue = Float(text),
              currentValue >= 0,
              currentValue <= 255
        else { textField.text = "0.0"
            changeColor()
            textField.resignFirstResponder()
            return true
            
        }
        
        slidersArray.forEach {
            guard let slider = $0 else { return }
            slider.value = Float(currentValue)
            
            changeColor()
        }
        
        textField.resignFirstResponder()
        return true
    }
}

