//
//  Model.swift
//  MemoWord
//
//  Created by Burak Altunoluk on 06/07/2022.
//

import Foundation

class MainModel {
    var wordsArray: [String]
    var meaningArray: [String]
    init() {
        wordsArray = UserDefaults.standard.stringArray(forKey: "words") ?? [String]()
        meaningArray = UserDefaults.standard.stringArray(forKey: "meaning") ?? [String]()
    }
    
}
