//
//  ViewController.swift
//  TD-ToDoList
//
//  Created by mickael ruzel on 10/10/2020.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addTaskLabel: UILabel!
    
    // MARK: - Properties
    
    private let coreDataHelper = CoreDataHelper()
    private var fetchedController: NSFetchedResultsController<Task>?
    
    private var talbleViewIsEmpty: Bool {
        return fetchedController?.fetchedObjects?.count == 0
    }
    
    // MARK: - ViewCycle Life
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupFetchedController()
    }
    
    // MARK: - Methodes
    
    private func setupFetchedController() {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(key: "title", ascending: true)
        ]
        
        fetchedController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: coreDataHelper.context, sectionNameKeyPath: nil, cacheName: nil)
        
        reloadData()
    }
    
    private func reloadData() {
        do {
            try fetchedController?.performFetch()
        } catch {
            return
        }
        
        addTaskLabel.isHidden = !talbleViewIsEmpty
        tableView.isHidden = talbleViewIsEmpty
        
        tableView.reloadData()
        
    }
    
    // MARK: - Actions
    
    @IBAction func addTaskButtonTapped(_ sender: Any) {
        showAlertWithTextField(viewController: self, title: "Add new task", message: nil, placeHolder: "Task") { (text) in
            self.coreDataHelper.createTask(title: text)
            self.reloadData()
        }
        
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        fetchedController?.fetchedObjects?.forEach { coreDataHelper.deleteTask($0) }
        reloadData()
    }
}

// MARK: - TableView

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - TableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedController?.fetchedObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        guard let task = fetchedController?.object(at: indexPath) else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = task.title
        if task.isDone {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    // MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            guard let task = fetchedController?.object(at: indexPath) else {
                return
            }
            coreDataHelper.deleteTask(task)
            
            reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = fetchedController?.object(at: indexPath)
        task?.isDone.toggle()
        coreDataHelper.saveContext()
        
        reloadData()
    }
    
    
}

