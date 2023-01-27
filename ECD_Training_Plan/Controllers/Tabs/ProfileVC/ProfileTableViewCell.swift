//
//  ProfileTableViewCell.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 27/1/23.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    private var baseInset: CGFloat { return 16 }
    
    let movementLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        return label
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "00 kg"
        return label
    }()
    
    private let weightTextField: UITextField = {
        let textfield = UITextField()
        return textfield
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.toAutoLayout()
        return button
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(movementLabel, weightLabel, weightTextField, saveButton)
        
        let constraints = [
            movementLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: baseInset),
            movementLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: baseInset),
            movementLabel.widthAnchor.constraint(equalToConstant: 80),
            movementLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -baseInset),
            
            weightLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: baseInset),
            weightLabel.leadingAnchor.constraint(equalTo: movementLabel.trailingAnchor, constant: baseInset),
            weightLabel.widthAnchor.constraint(equalToConstant: 15),
            
            weightTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: baseInset),
            weightTextField.leadingAnchor.constraint(equalTo: weightLabel.trailingAnchor, constant: baseInset),
            weightTextField.widthAnchor.constraint(equalToConstant: 15),
            
            saveButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: baseInset),
            saveButton.leadingAnchor.constraint(equalTo: weightTextField.trailingAnchor, constant: baseInset),
            saveButton.heightAnchor.constraint(equalToConstant: 20),
            saveButton.widthAnchor.constraint(equalToConstant: 20)
        
        ]
}
}
