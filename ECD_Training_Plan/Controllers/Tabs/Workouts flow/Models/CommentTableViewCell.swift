//
//  CommentTableViewCell.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 26/1/23.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    private let userImage: UIImageView = {
       let image = UIImageView(image: UIImage(named: "general"))
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFill
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 0.5
        image.toAutoLayout()
        return image
    }()

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
   //     label.text = "Current User"
        label.toAutoLayout()
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy  HH:mm"
        label.text = formatter.string(from: Date())
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    let commentTexLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.toAutoLayout()
        return label
    }()
    
    private var baseInset: CGFloat { return 16 }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.userNameLabel.text = UserDefaults.standard.object(forKey: "userName") as? String
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.backgroundColor = UIColor(named: "lightGreen")
        contentView.addSubviews(userImage,userNameLabel, dateLabel, commentTexLabel)
        
        let constraints = [
            
            userImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: baseInset),
            userImage.heightAnchor.constraint(equalToConstant: 40),
            userImage.widthAnchor.constraint(equalTo: userImage.heightAnchor),
            userImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: baseInset),
            
            userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: baseInset),
            userNameLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: baseInset),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -baseInset),
            
            dateLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: userNameLabel.trailingAnchor),
            
            commentTexLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: baseInset),
            commentTexLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: baseInset),
            commentTexLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -baseInset),
            commentTexLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -baseInset)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
