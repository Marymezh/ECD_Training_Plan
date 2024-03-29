//
//  ProfileTableViewController.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 27/1/23.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    
    private let movements = ["", "Back Squat", "Front Squat", "Squat Clean", "Power Clean", "Clean and Jerk", "Snatch", "Deadlift"]
    
    private var weights = ["", "00", "00", "00", "00", "00", "00", "00"]
    
    private let headerView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateWeights()
        setupNavigationBar()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .systemTeal
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: String(describing: ProfileTableViewCell.self))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        tableView.sectionHeaderHeight = UITableView.automaticDimension
    }
    
   private func setupNavigationBar () {
        navigationController?.navigationBar.tintColor = .darkGray
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Sign Out",
            style: .done,
            target: self,
            action: #selector(didTapSignOut))
    }
    
    
    @objc private func didTapSignOut() {
        
    }
    
    private func updateWeights() {
        if let savedWeights = UserDefaults.standard.object(forKey: "savedWeights")  as? [String] {
            if savedWeights != [""] {
                weights = savedWeights
            }
        }
    }

    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movements.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
            cell.backgroundColor = UIColor(named: "tealLight")
            cell.textLabel?.text = "YOUR PERSONAL RECORDS"
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
            return cell
        default:
            let cell: ProfileTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileTableViewCell.self), for: indexPath) as! ProfileTableViewCell
            
            cell.backgroundColor = UIColor(named: "tealLight")
            cell.movementLabel.text = movements[indexPath.row]
            cell.weightIsSet = { text in
                self.weights.remove(at: indexPath.row)
                self.weights.insert(text, at: indexPath.row)
                tableView.reloadData()
                UserDefaults.standard.set(self.weights, forKey: "savedWeights")
            }
            cell.weightLabel.text = "\(weights[indexPath.row]) kg"

            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        headerView.onNameChanged = {
            tableView.performBatchUpdates(nil, completion: nil)
        }
        return headerView
    }
    
//    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        switch section {
//        case 0:
//            let footer = UIView()
//            footer.backgroundColor = .systemTeal
//            return footer
//        default:
//            return nil
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 5
//    }

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
