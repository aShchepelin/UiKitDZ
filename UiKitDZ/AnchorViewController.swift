//
//  AnchorViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 16.10.2022.
//

import UIKit

/// Экран с якорями
final class AnchorViewController: UIViewController {
    
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
        setupYellowView()
        setupRedView()
        setupGreenView()
        setupBlackView()
    }
    
    private func setupYellowView() {
        yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.240521).isActive = true
        yellowView.widthAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
    }
    
    private func setupRedView() {
        redView.widthAnchor.constraint(equalTo: redView.heightAnchor).isActive = true
        redView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        redView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        redView.centerYAnchor.anchorWithOffset(
            to: yellowView.centerYAnchor).constraint(
                equalTo: yellowView.heightAnchor, multiplier: 1.040).isActive = true
    }
    
    private func setupGreenView() {
        greenView.widthAnchor.constraint(equalTo: greenView.heightAnchor).isActive = true
        greenView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        greenView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        greenView.centerYAnchor.anchorWithOffset(
            to: yellowView.centerYAnchor).constraint(
                equalTo: yellowView.heightAnchor, multiplier: -1.040).isActive = true
    }
    
    private func setupBlackView() {
        blackView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        blackView.centerYAnchor.constraint(equalTo: yellowView.centerYAnchor).isActive = true
        blackView.heightAnchor.constraint(equalTo: yellowView.heightAnchor, multiplier: 3.140).isActive = true
        blackView.widthAnchor.constraint(equalTo: yellowView.heightAnchor, multiplier: 21 / 20).isActive = true
    }
}
