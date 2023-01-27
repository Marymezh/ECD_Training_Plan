//
//  SelectedWorkoutHeaderView.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 25/1/23.
//

import UIKit

class SelectedWorkoutHeaderView: UIView, UITextViewDelegate {
    
    var onSendCommentPush: ((String) -> Void)?
    
    var onTextChanged: (() -> Void)?
    
    private var baseInset: CGFloat { return 15 }
    private var innerInset: CGFloat { return 10 }
    
    
    private let workoutView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 5
        view.alpha = 0.8
        view.toAutoLayout()
        return view
    }()
    
    let workoutDescriptionLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.layer.borderColor = UIColor.white.cgColor
        label.toAutoLayout()
        return label
    }()
    
    let commentTextView: UITextView = {
       let textView = UITextView()
        textView.toAutoLayout()
        textView.font = UIFont.systemFont(ofSize: 15, weight: .regular)
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
        button.tintColor = .white
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        button.addTarget(self, action: #selector(commentSent), for: .touchUpInside)
        return button
    }()
    
    
    @objc func commentSent() {
        guard let text = commentTextView.text else {return}
        self.onSendCommentPush?(text)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if let backgroundImage = UIImage(named: "general") {
        backgroundColor = UIColor(patternImage: backgroundImage)
        }
        commentTextView.delegate = self
        self.addSubviews (workoutView, commentTextView, addCommentButton)
        workoutView.addSubview(workoutDescriptionLabel)
        
        let constraints = [
            
            workoutView.topAnchor.constraint(equalTo: self.topAnchor, constant: baseInset),
            workoutView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: baseInset),
            workoutView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -baseInset),
            
            workoutDescriptionLabel.topAnchor.constraint(equalTo: workoutView.topAnchor, constant: innerInset),
            workoutDescriptionLabel.leadingAnchor.constraint(equalTo: workoutView.leadingAnchor, constant: innerInset),
            workoutDescriptionLabel.trailingAnchor.constraint(equalTo: workoutView.trailingAnchor, constant: -innerInset),
            workoutDescriptionLabel.bottomAnchor.constraint(equalTo: workoutView.bottomAnchor, constant: -innerInset),
            
            commentTextView.topAnchor.constraint(equalTo: workoutView.bottomAnchor, constant: baseInset),
            commentTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: baseInset),
            commentTextView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -70),

            commentTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -baseInset),
            
            addCommentButton.topAnchor.constraint(equalTo: workoutView.bottomAnchor, constant: baseInset),
            addCommentButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -baseInset),
            addCommentButton.widthAnchor.constraint(equalToConstant: 35),
            addCommentButton.heightAnchor.constraint(equalToConstant: 35),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        onTextChanged?()
    }

}
