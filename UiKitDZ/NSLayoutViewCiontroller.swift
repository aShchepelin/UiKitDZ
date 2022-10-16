//
//  SecondVC.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 14.10.2022.
//

import UIKit

///  Экран с констрейнтами
final class NSLayoutViewCiontroller: UIViewController {
    // MARK: - Visual Components
     
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    // MARK: - Lifeсycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
  
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        greenView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        redView.translatesAutoresizingMaskIntoConstraints = false
        blackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blackView)
        view.addSubview(greenView)
        view.addSubview(yellowView)
        view.addSubview(redView)
        createYellowViewConstraints()
        createBlackViewConstraints()
        createRedViewConstraints()
        createGreenViewConstraints()
    }
    
    private func createYellowViewConstraints() {
        NSLayoutConstraint(item: yellowView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: yellowView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: yellowView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .height,
                           multiplier: 0.240521,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: yellowView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
        
    }
    
    private func createRedViewConstraints() {
        NSLayoutConstraint(item: redView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: redView,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: redView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: redView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: redView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerY,
                           multiplier: 0.5,
                           constant: 0).isActive = true
    }
    
    private func createGreenViewConstraints() {
        NSLayoutConstraint(item: greenView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: greenView,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: greenView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: greenView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: greenView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerY,
                           multiplier: 1.5,
                           constant: 0).isActive = true
    }
    
    private func createBlackViewConstraints() {
        NSLayoutConstraint(item: blackView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true

        NSLayoutConstraint(item: blackView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true

        NSLayoutConstraint(item: blackView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .height,
                           multiplier: 3.2,
                           constant: 0).isActive = true

        NSLayoutConstraint(item: blackView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .height,
                           multiplier: 21 / 20,
                           constant: 0).isActive = true
        
    }
}
