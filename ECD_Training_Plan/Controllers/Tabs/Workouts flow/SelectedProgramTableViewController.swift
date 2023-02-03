//
//  FreePlansTableViewController.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 26/1/23.
//

import UIKit

class SelectedProgramTableViewController: UITableViewController {
    
    private var numberOfWorkouts: Int {
        switch title {
        case "ECD/BEFIT TRAINING PLAN":
            return WorkoutDescriptionStorage.ecd.count
        case "BODYWEIGHT PLAN":
            return WorkoutDescriptionStorage.bodyweight.count
            case " 'STRUYACH' PLAN":
            return WorkoutDescriptionStorage.struyach.count
            case "BADASS":
            return WorkoutDescriptionStorage.badass.count
            case "HARD PRESS":
            return WorkoutDescriptionStorage.hardpress.count
            default: fatalError("Unable to count number of workouts")
            }
        }
    
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
            switch self.title {
            case "ECD/BEFIT TRAINING PLAN": WorkoutDescriptionStorage.ecd.insert(text, at: 0)
            case "BODYWEIGHT PLAN": WorkoutDescriptionStorage.bodyweight.append(text)
            case " 'STRUYACH' PLAN": WorkoutDescriptionStorage.struyach.append(text)
            case "BADASS": WorkoutDescriptionStorage.badass.append(text)
            case "HARD PRESS": WorkoutDescriptionStorage.hardpress.append(text)
            default: fatalError("Unable to identify category of workout")
            }
 //           self.numberOfWorkouts += 1
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        
        cell.tintColor = .black
        cell.backgroundColor = UIColor(named: "lightGreen")
        cell.textLabel?.text = "Workout for \(formatter.string(from: Date()))"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedWorkoutVC = SelectedWorkoutTableViewController(frame: .zero, style: .grouped)
        selectedWorkoutVC.title = "Workout \(indexPath.row + 1)"
 //       selectedWorkoutVC.programName = self.title
 //       selectedWorkoutVC.headerView.workoutDescriptionLabel.text = workoutDescription[indexPath.row]
        switch self.title {
        case "ECD/BEFIT TRAINING PLAN":
            workoutDescription = WorkoutDescriptionStorage.ecd
        case "BODYWEIGHT PLAN":
            workoutDescription = WorkoutDescriptionStorage.bodyweight
        case " 'STRUYACH' PLAN":
            workoutDescription = WorkoutDescriptionStorage.struyach
        case "BADASS":
            workoutDescription = WorkoutDescriptionStorage.badass
        case "HARD PRESS":
            workoutDescription = WorkoutDescriptionStorage.hardpress
        default: fatalError("Unable to load workout description")
        }
        selectedWorkoutVC.headerView.workoutDescriptionTextView.text = workoutDescription[indexPath.row]
        
        
        selectedWorkoutVC.onCompletion = {
            self.tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        navigationController?.pushViewController(selectedWorkoutVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableView.reloadData()
        
    }

}
