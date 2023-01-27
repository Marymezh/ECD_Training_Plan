//
//  ProfileHeaderView.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 27/1/23.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var baseInset: CGFloat { return 15 }
    private var innerInset: CGFloat { return 10 }
    
    var onNameChanged:(()-> Void)?
    
    private let userPhotoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "general")
        image.clipsToBounds = true
        image.layer.cornerRadius = 60
        image.contentMode = .scaleAspectFill
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 0.5
        image.toAutoLayout()
        return image
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.sizeToFit()
        label.text = "Current User"
        label.toAutoLayout()
        return label
    }()
    
    private let changeImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Change photo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        button.toAutoLayout()
        return button
    }()
    
    private let changeUserNameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Change name", for: .normal)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(changeName), for: .touchUpInside)
        button.toAutoLayout()
        return button
    }()
    
    @objc func changeName () {
        let alertController = UIAlertController(title: "Change user name", message: nil, preferredStyle: .alert)
        alertController.addTextField { textfield in
            textfield.placeholder = "Enter new name here"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        let changeAction = UIAlertAction(title: "Save", style: .cancel) { action in
            self.userNameLabel.text = alertController.textFields?[0].text
            self.onNameChanged?()
        }
        
        alertController.addAction(changeAction)
        alertController.addAction(cancelAction)

        alertController.view.tintColor = .darkGray
        self.window?.rootViewController?.present(alertController, animated: true)
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemTeal
        
        self.addSubviews(userPhotoImage, userNameLabel, changeUserNameButton, changeImageButton)
        
        let constraints = [
        
            userPhotoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: baseInset),
            userPhotoImage.heightAnchor.constraint(equalToConstant: 120),
            userPhotoImage.widthAnchor.constraint(equalTo: userPhotoImage.heightAnchor),
            userPhotoImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -baseInset*2),

            
            userNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: userPhotoImage.trailingAnchor, constant: baseInset),
            userNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -baseInset),
            
            changeImageButton.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: baseInset),
            changeImageButton.leadingAnchor.constraint(equalTo: userPhotoImage.trailingAnchor, constant: baseInset),
            changeImageButton.heightAnchor.constraint(equalToConstant: 35),
            changeImageButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -baseInset),
            
            changeUserNameButton.topAnchor.constraint(equalTo: changeImageButton.bottomAnchor, constant: baseInset),
            changeUserNameButton.leadingAnchor.constraint(equalTo: changeImageButton.leadingAnchor),
            changeUserNameButton.trailingAnchor.constraint(equalTo: changeImageButton.trailingAnchor),
            changeUserNameButton.heightAnchor.constraint(equalTo: changeImageButton.heightAnchor),
            changeUserNameButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -baseInset*2)

        ]
        
        NSLayoutConstraint.activate(constraints)
    }

}