//
//  SelectedWorkoutTableViewController.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 19/1/23.
//

import UIKit

class SelectedWorkoutViewController: UIViewController {

    private var commentsArray = ["Great workout, finished in 10:35 min", "It was too hard for me, only 3 rounds completed"]

    let workoutTask = " 4 Rounds for time: \n\n 30 DU, \n 10 Squat Snatch, \n 15 HSPU, \n time cap - 12 min \n\n Post your results in the comments!"
    
    private let workoutView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 5
        view.toAutoLayout()
        return view
    }()
    
    private let workoutDescriptionLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        label.layer.borderColor = UIColor.white.cgColor
        label.toAutoLayout()
        return label
    }()
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    private let commentTextField: UITextView = {
       let textField = UITextView()
        textField.toAutoLayout()
//        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
//        textField.leftViewMode = .always
        textField.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        textField.textColor = .black
        textField.sizeToFit()
        textField.backgroundColor = .white
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 5
        //textField.placeholder = "Write your comment and result"
        return textField
    }()
    
    private let addCommentButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.tintColor = .black
 //       button.backgroundColor = .white
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        button.addTarget(self, action: #selector(commentSent), for: .touchUpInside)
        return button
    }()
    
    @objc func commentSent() {
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workoutDescriptionLabel.text = workoutTask
        setUpNavBar()
        setupUI()
        setupTableView()
        
    }
    
    private func setUpNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add comment", style: .plain, target: self, action: #selector(addComment))
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        tableView.backgroundColor = UIColor(named: "lightGreen")
        tableView.toAutoLayout()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: "lightGreen")
        workoutView.addSubview(workoutDescriptionLabel)
        view.addSubviews(workoutView, tableView, commentTextField, addCommentButton)
        
        let constraints = [
            
            workoutView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            workoutView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            workoutView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            workoutView.bottomAnchor.constraint(equalTo: workoutDescriptionLabel.bottomAnchor, constant: 15),
            
            workoutDescriptionLabel.topAnchor.constraint(equalTo: workoutView.topAnchor, constant: 10),
            workoutDescriptionLabel.leadingAnchor.constraint(equalTo: workoutView.leadingAnchor, constant: 10),
            workoutDescriptionLabel.trailingAnchor.constraint(equalTo: workoutView.trailingAnchor, constant: -10),
            
            tableView.topAnchor.constraint(equalTo: workoutView.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -75),
            
            commentTextField.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 15),
            commentTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            commentTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -85),
            commentTextField.heightAnchor.constraint(equalToConstant: 40),
     //       commentTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            addCommentButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 15),
            addCommentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            addCommentButton.widthAnchor.constraint(equalToConstant: 40),
            addCommentButton.heightAnchor.constraint(equalToConstant: 40)
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
        return 1
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "COMMENTS"
//    }
//
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 25
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CellID1")
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = commentsArray[indexPath.row]
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy  HH:mm"
        cell.detailTextLabel?.text = formatter.string(from: Date())
        cell.backgroundColor = UIColor(named: "darkGreen")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}
    

