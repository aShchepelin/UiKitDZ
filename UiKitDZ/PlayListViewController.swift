//
//  ViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 21.09.2022.
//

import UIKit
/// Плейлист с кнопками которые передают информацию на экран плеера
class PlayListViewController: UIViewController {
    
    var counter = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
      setupUI()
    }
    
    func setupUI() {
    }
    @IBAction func dunaAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondVC = storyboard.instantiateViewController(
            withIdentifier: "PlayerViewController") as? PlayerViewController else { return }
        secondVC.song = Song(name: "Привет с большого бодуна",
                                           artist: "Дюна",
                                           albumImage: "1",
                                           song: "Duna - privet s bolshogo boduna")
        show(secondVC, sender: nil)
    }
    
    @IBAction func laertskiyAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondVC = storyboard.instantiateViewController(
            withIdentifier: "PlayerViewController") as? PlayerViewController else { return }
        secondVC.song = Song(name: "Дети хоронят коня",
                                           artist: "Александр Лаэртский",
                                           albumImage: "2",
                                           song: "Aleksandr Laertskij  - Deti horonyat konya")
        show(secondVC, sender: nil)
    }
    
}
