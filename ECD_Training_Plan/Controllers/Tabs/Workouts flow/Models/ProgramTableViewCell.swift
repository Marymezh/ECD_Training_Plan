//
//  ProgramTableViewCell.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 18/1/23.
//

import UIKit

class ProgramTableViewCell: UITableViewCell {
    
    var program: ProgramDescription? {
        didSet {
            programNameLabel.text = program?.programName
            descriptionLabel.text = program?.programDetail
            self.backgroundView = UIImageView(image: UIImage(named: program?.cellImage ?? "No Image"))
        }
    }
    
    private let programNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        label.toAutoLayout()
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
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
        
       
        contentView.addSubviews(programNameLabel, descriptionLabel)
        
        let constraints = [
            programNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: baseInset),
            programNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: baseInset),
            programNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -baseInset),
            
//            descriptionLabel.topAnchor.constraint(equalTo: programNameLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: baseInset),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -baseInset),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -baseInset)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
//    }
    
 
    
}
