//
//  ViewController.swift
//  Gesture
//
//  Created by Матвей Кашин on 08.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var greenView: UIView!
    
    @IBOutlet weak private var centerXConstraint: NSLayoutConstraint!
    
    @IBOutlet weak private var centerYConstraint: NSLayoutConstraint!
    
    private let pinchGestureRecognizer = UIPinchGestureRecognizer()
    private let rotationGestureRecognizer = UIRotationGestureRecognizer()
    private let tapGestureRecognizer = UITapGestureRecognizer()
    private let panGestureRecognizer = UIPanGestureRecognizer()
    
    private var panGestureAnchorPoint: CGPoint?
    
    private var point: CGRect?
    private var centerGreenView: CGPoint?
        
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGreenView()
        setupGesture()
        
        point = greenView.frame
        centerGreenView = greenView.center
    }
    
    private func setupGreenView() {
        
        greenView.addGestureRecognizer(pinchGestureRecognizer)
        greenView.addGestureRecognizer(rotationGestureRecognizer)
        greenView.addGestureRecognizer(tapGestureRecognizer)
        greenView.addGestureRecognizer(panGestureRecognizer)
    }
    
    private func setupGesture() {
        
        pinchGestureRecognizer.addTarget(self, action: #selector(handlePinchGesture(_:)))
        rotationGestureRecognizer.addTarget(self, action: #selector(handleRotationGesture(_:)))
        tapGestureRecognizer.addTarget(self, action: #selector(handleTapGesture(_:)))
        panGestureRecognizer.addTarget(self, action: #selector(handlePanGesture(_:)))
        panGestureRecognizer.maximumNumberOfTouches = 1
        
        rotationGestureRecognizer.delegate = self
        pinchGestureRecognizer.delegate = self
    }
    
    
    @objc func handlePinchGesture(_ pinchRecognizer: UIPinchGestureRecognizer) {
        
        if let view = pinchRecognizer.view {
            
            view.transform = CGAffineTransform.identity.scaledBy(x: pinchRecognizer.scale, y: pinchRecognizer.scale).rotated(by: 0)
        }
    }

    @objc func handleRotationGesture(_ rotationhRecognizer: UIRotationGestureRecognizer) {
        
        if let view = rotationhRecognizer.view {
            
            view.transform = CGAffineTransform.identity.rotated(by: rotationGestureRecognizer.rotation)
        }
    }
    
    @objc func handleTapGesture(_ tapRecognizer: UITapGestureRecognizer) {
        
        if let view = tapGestureRecognizer.view {
            
            if view.backgroundColor != .yellow {
                view.backgroundColor = .yellow
            } else {
                view.backgroundColor = .blue
            }
        
            view.transform = CGAffineTransform.identity.rotated(by: 0)
            view.frame = point!
            view.center = centerGreenView!
        }
    }
    
    @objc func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        
        guard panGestureRecognizer === gestureRecognizer else { return }
        
        switch gestureRecognizer.state {
        case .began:
            panGestureAnchorPoint = gestureRecognizer.location(in: view)

        case .changed:
            guard let panGestureAnchorPoint = panGestureAnchorPoint else { return }
            
            let gesturePoint = gestureRecognizer.location(in: view)
            
            centerXConstraint.constant += gesturePoint.x - panGestureAnchorPoint.x
            centerYConstraint.constant += gesturePoint.y - panGestureAnchorPoint.y
            
            self.panGestureAnchorPoint = gesturePoint
            
        case .cancelled:
            panGestureAnchorPoint = nil
            
        case .failed, .possible:
            break
        
        default:
                break
        }
    }
}

extension ViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
