//
//  ViewController.swift
//  HelloWord
//
//  Created by Burak Altunoluk on 05/07/2022.
//

import UIKit
import AVFoundation

final class MainVC: UIViewController {
 
    // MARK: Properties
    var DataModel = MainModel()
    var wordsArray = [String]()
    var meaningArray = [String]()
    
    @IBOutlet var addButton: UIButton!
    @IBOutlet var mainTableView: UITableView!
    @IBOutlet var wordTextInput: UITextField!
    @IBOutlet var meaningTextInput: UITextField!
   
    // MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        wordsArray = DataModel.wordsArray
        meaningArray = DataModel.meaningArray
      
    }
    
    @IBAction func addButton(_ sender: Any) {
        view.endEditing(true)
        if wordTextInput.text != "" && meaningTextInput.text != "" {
            wordsArray.insert(wordTextInput.text!, at: 0)
            meaningArray.insert(meaningTextInput.text!, at: 0)
            updateArrays()
            wordTextInput.text = ""
            meaningTextInput.text = ""
        
            
            
        }
    }
    
    
    private func updateArrays() {
        UserDefaults.standard.set(wordsArray, forKey: "words")
        UserDefaults.standard.set(meaningArray, forKey: "meaning")
        mainTableView.reloadData()
    }
    
    private func textToSpeech(choosedRow: String) {
        let string = choosedRow
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }
    
}

//MARK: TableViewDelegate
extension MainVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = wordsArray[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            wordsArray.remove(at: indexPath.row)
            meaningArray.remove(at: indexPath.row)
            updateArrays()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: wordsArray[indexPath.row], message: meaningArray[indexPath.row], preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        textToSpeech(choosedRow: wordsArray[indexPath.row])
    }
}

