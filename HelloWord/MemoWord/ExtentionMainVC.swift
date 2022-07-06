//
//  ExtentionMainVC.swift
//  HelloWord
//
//  Created by Burak Altunoluk on 05/07/2022.
//

import Foundation
import UIKit

extension MainVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = UITableViewCell()
        Cell.textLabel?.text = wordsArray[indexPath.row]
        return Cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            wordsArray.remove(at: indexPath.row)
            updateArrays()
        }
     
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: wordsArray[indexPath.row], message: meaningArray[indexPath.row], preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        self.textToSpeech(choosedRow: wordsArray[indexPath.row])
        
    }
}
