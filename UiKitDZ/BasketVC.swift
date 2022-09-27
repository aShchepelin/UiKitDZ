//
//  BasketVC.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 26.09.2022.
//

import UIKit
/// Экран корзины с переносом инфы из второго вьюконтроллера
class BasketViewController: UIViewController {
    
    let logo: UIImageView = {
        var logo = UIImageView(frame: CGRect(x: -50,
                                             y: 0,
                                             width: 500,
                                             height: 500))
        logo.image = UIImage(named: "StoreLogo.jpg.png")
        return logo
    }()
   
    let buyingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Buy", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = .systemMint
        button.frame = CGRect(x: 150, y: 700, width: 200, height: 50)
        return button
    }()
    
    let bikeType: UILabel = {
       let label = UILabel()
        label.frame = CGRect(x: 200, y: 500, width: 100, height: 30)
       return label
    }()
    
    let bikeTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Bike Type:"
        label.frame = CGRect(x: 100, y: 500, width: 100, height: 30)
        return label
    }()
    
    let bikeMark: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 200, y: 525, width: 100, height: 30)
        return label
    }()
    
    let bikeMarkLabel: UILabel = {
        let label = UILabel()
        label.text = "Mark:"
        label.frame = CGRect(x: 100, y: 525, width: 100, height: 30)
        return label
    }()
    
    let bikeCost: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 200, y: 550, width: 200, height: 30)
        return label
    }()
    
    let bikeCostLabel: UILabel = {
        let label = UILabel()
        label.text = "Cost:"
        label.frame = CGRect(x: 100, y: 550, width: 100, height: 30)
        return label
    }()
    
    var bikeInfo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        switch bikeInfo {
        case "Road race bike":
            bikeType.text = "Road race bike"
            bikeMark.text = "Marin"
            bikeCost.text = "200000 rub"
        case "City bike":
            bikeType.text = "City bike"
            bikeMark.text = "Brooklyn"
            bikeCost.text = "70000 rub"
        case "Mountain bike":
            bikeType.text = "Mountain bike"
            bikeMark.text = "Trek"
            bikeCost.text = "170000 rub"
            
        default:
            break
        }
        view.addSubview(logo)
        view.addSubview(buyingButton)
        view.addSubview(bikeType)
        view.addSubview(bikeMark)
        view.addSubview(bikeCost)
        view.addSubview(bikeCostLabel)
        view.addSubview(bikeMarkLabel)
        view.addSubview(bikeTypeLabel)
        }
}
    
