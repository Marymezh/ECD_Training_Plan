//
//  NewCommentViewController.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 19/1/23.
//

import UIKit

class NewCommentViewController: UIViewController {
    
    var onSaveButtonPress: ((_ text: String)-> Void)?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Leave your comment here"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .black
        label.toAutoLayout()
        return label
    }()
    
    private let commentTextView: UITextView = {
       let textView = UITextView()
        textView.backgroundColor = .white
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 0.5
        textView.layer.cornerRadius = 5
        textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.textColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(named: "darkGreen")
        button.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        button.toAutoLayout()
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.titleLabel?.textColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(named: "darkGreen")
        button.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        button.toAutoLayout()
        return button
    }()
    
    @objc func cancelButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func saveButtonPressed() {
        if let text = commentTextView.text {
            self.onSaveButtonPress?(text)
        }
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "lightGreen")

        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
   private func setupUI () {
        view.addSubviews(titleLabel, commentTextView, saveButton, cancelButton)
       
       let constraints = [
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
        
        commentTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
        commentTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        commentTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        commentTextView.heightAnchor.constraint(equalToConstant: 250),
        
        saveButton.topAnchor.constraint(equalTo: commentTextView.bottomAnchor, constant: 20),
        saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        saveButton.heightAnchor.constraint(equalToConstant: 44),
        saveButton.widthAnchor.constraint(equalToConstant: 150),
        
        cancelButton.topAnchor.constraint(equalTo: commentTextView.bottomAnchor, constant: 20),
        cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        cancelButton.heightAnchor.constraint(equalToConstant: 44),
        cancelButton.widthAnchor.constraint(equalToConstant: 150)
        
       ]
       
       NSLayoutConstraint.activate(constraints)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
