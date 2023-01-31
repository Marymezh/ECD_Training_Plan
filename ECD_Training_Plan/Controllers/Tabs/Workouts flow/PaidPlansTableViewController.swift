//
//  SelectedProgramTableViewController.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 18/1/23.
//

import UIKit


class PaidPlansTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "darkGreen")
        setupNavbar()
        setupTableView()
    }
    
    private func setupNavbar() {
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: 25, weight: .bold)]
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: self.title, style: .plain, target: nil, action: nil)
    }
    
    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    }
    

    // MARK: - Table view data source and delegate methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CellID")
        
        cell.tintColor = .black
        cell.backgroundColor = UIColor(named: "lightGreen")
        cell.textLabel?.text = "Workout \(indexPath.row + 1)"
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        cell.detailTextLabel?.text = formatter.string(from: Date())
      
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedWorkoutVC = SelectedWorkoutTableViewController(frame: .zero, style: .grouped)
        selectedWorkoutVC.title = "Workout \(indexPath.row + 1)"
        selectedWorkoutVC.onCompletion = {
            self.tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        navigationController?.pushViewController(selectedWorkoutVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableView.reloadData()
        
    }

}
