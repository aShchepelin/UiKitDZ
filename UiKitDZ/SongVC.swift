//
//  SongVC.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 25.09.2022.
//

import Foundation
/// Здесь хранится класс для информации о песне
class Song {
    var name: String
    var artist: String
    var albumImage: String
    var song: String
    init(name: String, artist: String, albumImage: String, song: String) {
        self.name = name
        self.artist = artist
        self.albumImage = albumImage
        self.song = song
    }
}
