//
//  BirthsdayList.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 23.09.2022.
//

import UIKit
/// Отрисовка списка именниников
class BirthdayListViewController: UIViewController {
    
    let jeremyLabel: UILabel = {
        let label = UILabel()
        label.text = "Jeremy"
        label.font = .boldSystemFont(ofSize: 17)
        label.frame = CGRect(x: 70, y: 120, width: 100, height: 30)
        return label
    }()
    
    let jeremyButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "person.circle.fill"), for: .normal)
        button.tintColor = .systemGray
        button.frame = CGRect(x: 5, y: 120, width: 60, height: 60)
        return button
    }()
    
    let jeremyInfo: UILabel = {
        let label = UILabel()
        label.text = "10 марта, в среду исполнится 25 лет"
        label.textColor = .systemGray
        label.frame = CGRect(x: 70, y: 150, width: 400, height: 30)
        return label
    }()
    
    let jeremyBrthd: UILabel = {
        let label = UILabel()
        label.text = "18 дней"
        label.textColor = .systemGray
        label.frame = CGRect(x: 300, y: 120, width: 100, height: 30)
        return label
    }()
    
    let mariaLabel: UILabel = {
        let label = UILabel()
        label.text = "Maria Lui"
        label.font = .boldSystemFont(ofSize: 17)
        label.frame = CGRect(x: 70, y: 220, width: 100, height: 30)
        return label
    }()
    
    let mariaButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "person.circle.fill"), for: .normal)
        button.tintColor = .systemGray
        button.frame = CGRect(x: 5, y: 220, width: 60, height: 60)
        return button
    }()
    
    let mariaInfo: UILabel = {
        let label = UILabel()
        label.text = "30 марта, в четверг исполнится 20 лет"
        label.textColor = .systemGray
        label.frame = CGRect(x: 70, y: 250, width: 400, height: 30)
        return label
    }()
    
    let mariaBrthd: UILabel = {
        let label = UILabel()
        label.text = "28 дней"
        label.textColor = .systemGray
        label.frame = CGRect(x: 300, y: 220, width: 100, height: 30)
        return label
    }()
    
    let jonyLabel: UILabel = {
        let label = UILabel()
        label.text = "Maria Lui"
        label.font = .boldSystemFont(ofSize: 17)
        label.frame = CGRect(x: 70, y: 320, width: 100, height: 30)
        return label
    }()
    
    let jonyButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "person.circle.fill"), for: .normal)
        button.tintColor = .systemGray
        button.frame = CGRect(x: 5, y: 320, width: 60, height: 60)
        return button
    }()
    
    let jonyInfo: UILabel = {
        let label = UILabel()
        label.text = "30 марта, в четверг исполнится 20 лет"
        label.textColor = .systemGray
        label.frame = CGRect(x: 70, y: 350, width: 400, height: 30)
        return label
    }()
    
    let jonyBrthd: UILabel = {
        let label = UILabel()
        label.text = "28 дней"
        label.textColor = .systemGray
        label.frame = CGRect(x: 300, y: 320, width: 100, height: 30)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func rightBarButtonAction() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(pushAddPersonAction))
        
    }
    
    func leftBarButtonAction() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(pushViewControllerAction))
    }
    
    @objc func pushAddPersonAction() {
        let addPerson = CreatePersonViewController()
        self.navigationController?.pushViewController(addPerson, animated: true)
    }
    
    @objc func pushViewControllerAction() {
        let vc = ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
        
        func setupUI() {
            view.backgroundColor = .white
            view.addSubview(jeremyLabel)
            view.addSubview(jeremyButton)
            view.addSubview(jeremyInfo)
            view.addSubview(jeremyBrthd)
            view.addSubview(mariaLabel)
            view.addSubview(mariaInfo)
            view.addSubview(mariaBrthd)
            view.addSubview(mariaButton)
            view.addSubview(jonyInfo)
            view.addSubview(jonyBrthd)
            view.addSubview(jonyLabel)
            view.addSubview(jonyButton)
            rightBarButtonAction()
            leftBarButtonAction()
        }
        
    }
