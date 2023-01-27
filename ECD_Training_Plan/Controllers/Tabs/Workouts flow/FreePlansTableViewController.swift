//
//  FreePlansTableViewController.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 26/1/23.
//

import UIKit

class FreePlansTableViewController: UITableViewController {
    
    private var numberOfWorkouts: Int = 0
    
    private var workoutDescription: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "darkGreen")
        setupNavbar()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        print ("\(workoutDescription)")
    }
    
    private func setupNavbar() {
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: 25, weight: .bold)]
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addNewWorkout))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: self.title, style: .plain, target: nil, action: nil)
    }
    
    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    }
    
    @objc func addNewWorkout() {
        let newWorkoutVC = CreateNewWorkoutViewController()
        newWorkoutVC.title = "Add new workout"
        navigationController?.pushViewController(newWorkoutVC, animated: true)
        newWorkoutVC.onWorkoutSave = { text in
            self.workoutDescription.append(text)
            self.numberOfWorkouts += 1
        }
    }
    

    // MARK: - Table view data source and delegate methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numberOfWorkouts
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
        selectedWorkoutVC.headerView.workoutDescriptionLabel.text = workoutDescription[indexPath.row]
        selectedWorkoutVC.onCompletion = {
            self.tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
       // print("\(selectedWorkoutVC.workoutTask)")
        navigationController?.pushViewController(selectedWorkoutVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableView.reloadData()
        
    }

}
