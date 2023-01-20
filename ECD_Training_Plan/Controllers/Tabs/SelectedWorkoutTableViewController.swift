//
//  SelectedWorkoutTableViewController.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 19/1/23.
//

import UIKit

class SelectedWorkoutTableViewController: UITableViewController {

    private var commentsArray = ["Great workout, finished in 10:35 min", "It was too hard for me, only 3 rounds completed"]
    private let workoutDescription = ["4 Rounds for time: 30 DU, 10 Squat Snatch, 15 HSPU, time cap - 12 min"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "lightGreen")
        setUpNavBar()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID1")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID2")
    }

    private func setUpNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add comment", style: .plain, target: self, action: #selector(addComment))
    }
    
    @objc func addComment() {
        
//        //this code for Alert controller
//        let alertController = UIAlertController(title: "Add new comment", message: nil, preferredStyle: .alert)
//        alertController.view.tintColor = .black
//        alertController.addTextField { textfield in
//            textfield.placeholder = "Leave your comments and results here"
//        }
//        let createAction = UIAlertAction(title: "Create", style: .default) { action in
//            if let newComment = alertController.textFields?[0].text {
//                self.commentsArray.append(newComment)
//                self.tableView.reloadData()
//            }
//        }
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
//        alertController.addAction(cancelAction)
//        alertController.addAction(createAction)
//
//        present(alertController, animated: true)
        
        //present new vc modally
        let newCommentVC = NewCommentViewController()
        navigationController?.pushViewController(newCommentVC, animated: true)
        newCommentVC.onSaveButtonPress = { [weak self] text in
            guard let self = self else {return}
            self.commentsArray.append(text)
            self.tableView.reloadData()
        }
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Workout Description"
        default:
            return "Comments"
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return commentsArray.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellID1", for: indexPath)
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = workoutDescription[indexPath.row]
            
            
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
