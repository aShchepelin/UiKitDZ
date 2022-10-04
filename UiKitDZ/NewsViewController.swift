//
//  NewsViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 03.10.2022.
//

import UIKit
/// Экран где отображаются новости с возможностью оформить подписку с сегментами слайдером и свичами
final class NewsViewController: UIViewController {
    // MARK: - IBOutlets
    
    @IBOutlet weak var newsSelectSegment: UISegmentedControl!
    @IBOutlet weak var newsLogoImage: UIImageView!
    @IBOutlet weak var exmpQuantitySlider: UISlider!
    @IBOutlet weak var exmpQuantityLabel: UILabel!
    
    // MARK: - Private properties
    private let news = [UIImage(named: "1.png"),
                UIImage(named: "2.jpg")]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func buyAction(_ sender: Any) {
        shureButtonAction()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        newsSelectSegment.addTarget(self,
                                    action: #selector(selectedNewsAction(target:)),
                                    for: .valueChanged)
        exmpQuantitySlider.minimumValue = 1
        exmpQuantitySlider.value = 6
        exmpQuantitySlider.maximumValue = 12
        exmpQuantitySlider.addTarget(self, action: #selector(exmpQuantityAction), for: .valueChanged)
    
    }
    @objc private func selectedNewsAction(target: UISegmentedControl) {
             if target == newsSelectSegment {
                 let segmentIndex = target.selectedSegmentIndex
                 newsLogoImage.image = news[segmentIndex]
             }
         }
    @objc private func exmpQuantityAction() {
        exmpQuantityLabel.text = "\(Int(exmpQuantitySlider.value))"
    }
    
    private func shureButtonAction() {
        let attention = UIAlertController(title: "Are you shure?", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: .default)
        let noAction = UIAlertAction(title: "No", style: .cancel)
        attention.addAction(okAction)
        attention.addAction(noAction)
        present(attention, animated: true)
    }
}
