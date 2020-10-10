//
//  ViewController.swift
//  TD-ToDoList
//
//  Created by mickael ruzel on 10/10/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addTaskLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addTaskButtonTapped(_ sender: Any) {
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - TableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        return cell
    }
    
    // MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
        }
    }
    
    
}

