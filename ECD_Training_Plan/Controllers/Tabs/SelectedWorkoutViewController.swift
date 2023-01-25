//
//  SelectedWorkoutTableViewController.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 19/1/23.
//

import UIKit

class SelectedWorkoutViewController: UIViewController {

    private var commentsArray = ["Great workout, finished in 10:35 min", "It was too hard for me, only 3 rounds completed"]

    private let workoutTask = " 4 Rounds for time: \n\n 30 DU, \n 10 Squat Snatch, \n 15 HSPU, \n 10 Clean and Jerk, \n 100 DU, \n 20 box jump over, \n 30 Wall BAll, \n 10 Wall Climb, \n Air Squat, \n 10 m Handstand walk, \n time cap - 25 min \n\n Post your results in the comments! \n\n And don't forget to tag me %)"
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.toAutoLayout()
        return scrollView
    }()

    private let contentView: UIView = {
        let contentView = UIView()
      //  screenView.backgroundColor = UIColor(named: "darkGreen")
        contentView.toAutoLayout()
        return contentView
    }()
    
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
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        tableView.backgroundColor = UIColor(named: "lightGreen")
        tableView.sizeToFit()
        tableView.toAutoLayout()
        return tableView
    }()
    
    private let commentTextView: UITextView = {
       let textView = UITextView()
        textView.toAutoLayout()
        textView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textView.textColor = .black
        textView.tintColor = .black
        textView.sizeToFit()
        textView.isScrollEnabled = false
        textView.backgroundColor = .white
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.cornerRadius = 5
        return textView
    }()
    
    private let addCommentButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.tintColor = .black
//        button.backgroundColor = .white
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        button.addTarget(self, action: #selector(commentSent), for: .touchUpInside)
        return button
    }()
    
    @objc func commentSent() {
        guard let text = commentTextView.text else {return}
        commentsArray.insert(text, at: 0)
        commentTextView.text = ""
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        workoutDescriptionLabel.text = workoutTask
        setupUI()
        setupSubviews()
        setupTableView()
        setupToolbar()
    }

    
    private func setupUI() {

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add comment", style: .plain, target: self, action: #selector(addComment))
        view.backgroundColor = UIColor(named: "lightGreen")
//        view.backgroundColor = .white
 //       tabBarController?.tabBar.isHidden = true
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupSubviews() {

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(workoutView, tableView, commentTextView, addCommentButton)
        workoutView.addSubview(workoutDescriptionLabel)
//
        let tableHeight = view.frame.height - workoutView.frame.height - commentTextView.frame.height - 450
        
        let constraints = [
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
 //           scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 80),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            workoutView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            workoutView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            workoutView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            workoutDescriptionLabel.topAnchor.constraint(equalTo: workoutView.topAnchor, constant: 10),
            workoutDescriptionLabel.leadingAnchor.constraint(equalTo: workoutView.leadingAnchor, constant: 10),
            workoutDescriptionLabel.trailingAnchor.constraint(equalTo: workoutView.trailingAnchor, constant: -10),
            workoutDescriptionLabel.bottomAnchor.constraint(equalTo: workoutView.bottomAnchor, constant: -10),
            
            commentTextView.topAnchor.constraint(equalTo: workoutView.bottomAnchor, constant: 15),
            commentTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            commentTextView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -70),
            commentTextView.heightAnchor.constraint(lessThanOrEqualToConstant: 200),
            
            addCommentButton.topAnchor.constraint(equalTo: workoutView.bottomAnchor, constant: 15),
            addCommentButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            addCommentButton.widthAnchor.constraint(equalToConstant: 35),
            addCommentButton.heightAnchor.constraint(equalToConstant: 35),
            
            tableView.topAnchor.constraint(equalTo: commentTextView.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            tableView.heightAnchor.constraint(equalToConstant: tableHeight),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        tableView.layoutIfNeeded()
    }
    
    private func setupToolbar() {
        let bar = UIToolbar()
        
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dissmissKeyboard))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        bar.items = [flexSpace, flexSpace, doneBtn]
        bar.isTranslucent = true
      //  bar.toAutoLayout()
        bar.backgroundColor = .systemGray6
        bar.tintColor = .black
        bar.sizeToFit()
        commentTextView.inputAccessoryView = bar
    }
    
    @objc func dissmissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func addComment() {
        
        //present new vc modally
        let newCommentVC = NewCommentViewController()
        navigationController?.pushViewController(newCommentVC, animated: true)
        newCommentVC.onSaveButtonPress = { [weak self] text in
            guard let self = self else {return}
            self.commentsArray.insert(text, at: 0)
            print("\(self.commentsArray)")
            self.tableView.reloadData()
        }
    }
}

// MARK: - Table view data source

extension SelectedWorkoutViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
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
    
    // MARK: Keyboard
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       // commentTextView.becomeFirstResponder()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scrollView.contentInset.bottom = keyboardSize.height + 40
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
}

extension SelectedWorkoutViewController: UITextViewDelegate {
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return commentTextView.resignFirstResponder()
    }
}

    

