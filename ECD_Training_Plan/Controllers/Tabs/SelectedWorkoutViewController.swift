//
//  SelectedWorkoutTableViewController.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 19/1/23.
//

import UIKit

class SelectedWorkoutViewController: UIViewController {

    private var commentsArray = ["Great workout, finished in 10:35 min", "It was too hard for me, only 3 rounds completed"]
    private let description = ["4 Rounds for time: 30 DU, 10 Squat Snatch, 15 HSPU, time cap - 12 min"]
    
    private let workoutDescriptionLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .white
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 0.5
        label.layer.cornerRadius = 5
        label.toAutoLayout()
    return label
    }()
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "lightGreen")
        setUpNavBar()
        
    }

    private func setUpNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add comment", style: .plain, target: self, action: #selector(addComment))
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID1")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID2")
        tableView.toAutoLayout()
    }
    
    private func setupUI() {
        view.addSubviews(workoutDescriptionLabel, tableView)
        
        let constraints = [
            workoutDescriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            workoutDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            workoutDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            workoutDescriptionLabel.heightAnchor.constraint(equalToConstant: 300),
            
            tableView.topAnchor.constraint(equalTo: workoutDescriptionLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func addComment() {
        
        //present new vc modally
        let newCommentVC = NewCommentViewController()
        navigationController?.pushViewController(newCommentVC, animated: true)
        newCommentVC.onSaveButtonPress = { [weak self] text in
            guard let self = self else {return}
            self.commentsArray.append(text)
            self.tableView.reloadData()
        }
    }
}

// MARK: - Table view data source

extension SelectedWorkoutViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Workout Description"
        default:
            return "Comments"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return commentsArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellID1", for: indexPath)
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = description[indexPath.row]
            return cell
            
        default:
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CellID2")
            
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = commentsArray[indexPath.row]
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM dd, yyyy  HH:mm"
            cell.detailTextLabel?.text = formatter.string(from: Date())
            
            return cell
        }
    }
}
    

