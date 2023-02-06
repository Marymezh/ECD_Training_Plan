//
//  FreePlansTableViewController.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 26/1/23.
//

import UIKit

class SelectedProgramTableViewController: UITableViewController {
    
    private var numberOfWorkouts: Int = 0
    private var workoutDescription: [WorkoutDescription] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "darkGreen")
        setupNavbar()
        setupTableView()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadWorkoutsList()
        tableView.reloadData()

    }
    
    private func setupNavbar() {
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: 25, weight: .bold)]
        self.navigationController?.navigationBar.tintColor = .black
        #if Admin
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addNewWorkout))
        print ("this is admins app")
        #else
        print ("this is clients app")
        #endif
        navigationItem.backBarButtonItem = UIBarButtonItem(title: self.title, style: .plain, target: nil, action: nil)
    }
    
    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    }
    
    private func loadWorkoutsList() {
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
        numberOfWorkouts = workoutDescription.count
    }
    
    @objc func addNewWorkout() {
        let newWorkoutVC = CreateNewWorkoutViewController()
        newWorkoutVC.title = "Add new workout"
        navigationController?.pushViewController(newWorkoutVC, animated: true)
        newWorkoutVC.onWorkoutSave = { text in
            let formatter = DateFormatter()
            formatter.dateFormat = "dd MMM yyyy"
            let date = formatter.string(from: Date())
            switch self.title {
            case "ECD/BEFIT TRAINING PLAN": WorkoutDescriptionStorage.ecd.insert(WorkoutDescription(description: text, date: date), at: 0)
            case "BODYWEIGHT PLAN": WorkoutDescriptionStorage.bodyweight.insert(WorkoutDescription(description: text, date: date), at: 0)
            case " 'STRUYACH' PLAN": WorkoutDescriptionStorage.struyach.insert(WorkoutDescription(description: text, date: date), at: 0)
            case "BADASS": WorkoutDescriptionStorage.badass.insert(WorkoutDescription(description: text, date: date), at: 0)
            case "HARD PRESS": WorkoutDescriptionStorage.hardpress.insert(WorkoutDescription(description: text, date: date), at: 0)
            default: fatalError("Unable to identify category of workout")
            }
        }
    }

    // MARK: - Table view data source and delegate methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfWorkouts
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        
        cell.tintColor = .black
        cell.backgroundColor = UIColor(named: "lightGreen")
        cell.textLabel?.text = "Workout for \(workoutDescription[indexPath.row].date)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedWorkoutVC = SelectedWorkoutTableViewController(frame: .zero, style: .grouped)
        
        selectedWorkoutVC.title = "Workout for \(workoutDescription[indexPath.row].date)"
        
        selectedWorkoutVC.headerView.workoutDescriptionTextView.text = workoutDescription[indexPath.row].description
        
        
        selectedWorkoutVC.onCompletion = {
            self.tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        navigationController?.pushViewController(selectedWorkoutVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableView.reloadData()
    }
}
