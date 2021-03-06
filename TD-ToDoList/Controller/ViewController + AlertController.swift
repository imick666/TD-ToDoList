//
//  ViewController + AlertController.swift
//  TD-ToDoList
//
//  Created by mickael ruzel on 10/10/2020.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(viewController: UIViewController, title: String?, message: String?) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        ac.addAction(ok)
        
        viewController.present(ac, animated: true, completion: nil)
    }
    
    func showAlertWithTextField(viewController: UIViewController,
                                title: String?,
                                message: String?,
                                placeHolder: String?,
                                holdText: String?,
                                callback: (((_ textfieldText: String) -> Void)?)) {
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addTextField { (textField) in
            textField.placeholder = placeHolder
            textField.text = holdText
        }
        let add = UIAlertAction(title: "Add", style: .default) { (action) in
            guard let text = ac.textFields?[0].text, !text.trimmingCharacters(in: .whitespaces).isEmpty else {
                self.showAlert(viewController: viewController, title: "Error", message: "Please enter a text")
                return
            }
            
            callback?(text)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        ac.addAction(add)
        ac.addAction(cancel)
        
        viewController.present(ac, animated: true, completion: nil)
    }
    
    
    
}
