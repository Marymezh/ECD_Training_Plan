//
//  CreateNewWorkoutViewController.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 26/1/23.
//

import UIKit

class CreateNewWorkoutViewController: UIViewController {
    
    var onWorkoutSave: ((String) -> Void)?
    
    private let workoutDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textView.textColor = .black
        textView.tintColor = .black
        textView.backgroundColor = .white
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.cornerRadius = 5
        textView.toAutoLayout()
        return textView
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.backgroundColor = UIColor(named: "darkGreen")
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(addNewWorkout), for: .touchUpInside)
        button.toAutoLayout()
        return button
    }()
    
    @objc func addNewWorkout() {
        if let text = workoutDescriptionTextView.text {
            self.onWorkoutSave?(text)
            navigationController?.popViewController(animated: true)
        }
    }
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = UIColor(named: "darkGreen")
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        button.toAutoLayout()
        return button
    }()
    
    @objc func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "lightGreen")
        setupSubviews()
        
    }
    
   func setupSubviews() {
        view.addSubviews(workoutDescriptionTextView, addButton, cancelButton)
       
       let buttonWidth = view.frame.width/2 - 30
       let textViewHeight = view.frame.height/3
       var baseInset: CGFloat { return 15 }
       
       let constraints = [
        workoutDescriptionTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: baseInset),
        workoutDescriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: baseInset),
        workoutDescriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -baseInset),
        workoutDescriptionTextView.heightAnchor.constraint(equalToConstant: textViewHeight),
        
        addButton.topAnchor.constraint(equalTo: workoutDescriptionTextView.bottomAnchor, constant: baseInset),
        addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: baseInset),
        addButton.heightAnchor.constraint(equalToConstant: 44),
        addButton.widthAnchor.constraint(equalToConstant: buttonWidth),
        
        cancelButton.topAnchor.constraint(equalTo: workoutDescriptionTextView.bottomAnchor, constant: baseInset),
        cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -baseInset),
        cancelButton.heightAnchor.constraint(equalTo: addButton.heightAnchor),
        cancelButton.widthAnchor.constraint(equalToConstant: buttonWidth)
        
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
