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
                                callback: (((_ textfieldText: String) -> Void)?)) {
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addTextField { (textField) in
            textField.placeholder = placeHolder
        }
        let add = UIAlertAction(title: "Add", style: .default) { (action) in
            guard let text = ac.textFields?[0].text?.trimmingCharacters(in: .whitespaces) else {
                self.showAlert(viewController: viewController, title: "Error", message: "Please enter a text")
                return
            }
            
            callback?(text)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(add)
        ac.addAction(cancel)
        
        viewController.present(ac, animated: true, completion: nil)
    }
    
    
    
}
