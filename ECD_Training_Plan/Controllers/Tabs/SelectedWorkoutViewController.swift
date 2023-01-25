//
//  SelectedWorkoutTableViewController.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 19/1/23.
//

import UIKit

class SelectedWorkoutTableViewController: UITableViewController {

    private var commentsArray = ["Great workout, finished in 10:35 min", "It was too hard for me, only 3 rounds completed"]

    private let workoutTask = "4 Rounds for time: \n\n 30 DU, \n 10 Squat Snatch, \n 15 HSPU, \n 10 Clean and Jerk, \n 100 DU, \n 20 box jump over"
//    , \n 30 Wall BAll, \n 10 Wall Climb, \n Air Squat, \n 10 m Handstand walk, \n time cap - 25 min \n\n Post your results in the comments! \n\n And don't forget to tag me %)"
    
private let headerView = SelectedWorkoutHeaderView()
    
    init(frame: CGRect , style: UITableView.Style) {
        super.init(style: style)
        
        view.backgroundColor = UIColor(named: "darkGreen")
        headerView.workoutDescriptionLabel.text = workoutTask
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        
        headerView.onSendCommentPush = { text in
            self.commentsArray.insert(text, at: 0)
            self.headerView.commentTextView.text = ""
            self.tableView.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        headerView.onTextChanged = {
            tableView.performBatchUpdates(nil, completion: nil)
        }
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CellID1")
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = commentsArray[indexPath.row]
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy  HH:mm"
        cell.detailTextLabel?.text = formatter.string(from: Date())
        cell.backgroundColor = UIColor(named: "darkGreen")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

