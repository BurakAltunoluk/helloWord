//
//  ViewController.swift
//  HelloWord
//
//  Created by Burak Altunoluk on 05/07/2022.
//

import UIKit
import AVFoundation

class MainVC: UIViewController {
    
    var wordsArray = [String]()
    var meaningArray = [String]()
    
    @IBOutlet var addButton: UIButton!
    @IBOutlet var mainTableView: UITableView!
    @IBOutlet var wordTextInput: UITextField!
    @IBOutlet var MeaningTextInput: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        view.endEditing(true)
        if wordTextInput.text != "" && MeaningTextInput.text != "" {
            wordsArray.insert(wordTextInput.text!, at: 0)
            meaningArray.insert(MeaningTextInput.text!, at: 0)
            wordTextInput.text = "" ; MeaningTextInput.text = ""
            updateArrays()
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getArraysData()
    }
    
    
    func getArraysData() {
        wordsArray = UserDefaults.standard.stringArray(forKey: "words") ?? [String]()
        meaningArray = UserDefaults.standard.stringArray(forKey: "meaning") ?? [String]()
    }
    func updateArrays() {
        UserDefaults.standard.set(wordsArray, forKey: "words")
        UserDefaults.standard.set(meaningArray, forKey: "meaning")
        mainTableView.reloadData()
    }
    
    func textToSpeech(choosedRow: String) {
        let string = choosedRow
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }
    
}

