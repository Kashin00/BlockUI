//
//  ViewController.swift
//  Autolayout
//
//  Created by Матвей Кашин on 07.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
}

private extension ViewController {
    
    func setupUI() {
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        greenView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greenView)
    
        greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greenView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        greenView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        greenView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8).isActive = true
        
        
        let redView = UIView()
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        greenView.addSubview(redView)
        
        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        redView.widthAnchor.constraint(equalTo: greenView.widthAnchor, multiplier: 0.8).isActive = true
        redView.heightAnchor.constraint(equalTo: greenView.heightAnchor, multiplier: 0.8).isActive = true
        
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        redView.addSubview(yellowView)
        
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowView.widthAnchor.constraint(equalTo: redView.widthAnchor, multiplier: 0.8).isActive = true
        yellowView.heightAnchor.constraint(equalTo: redView.heightAnchor, multiplier: 0.8).isActive = true
        
        let cyanView = UIView()
        cyanView.backgroundColor = .cyan
        cyanView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.addSubview(cyanView)
        
        cyanView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cyanView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cyanView.widthAnchor.constraint(equalTo: yellowView.widthAnchor, multiplier: 0.8).isActive = true
        cyanView.heightAnchor.constraint(equalTo: yellowView.heightAnchor, multiplier: 0.8).isActive = true
    }
}
