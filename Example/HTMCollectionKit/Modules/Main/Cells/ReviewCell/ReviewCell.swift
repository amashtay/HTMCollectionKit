//
//  ReviewCell.swift
//  HTMCollectionKit
//
//  Created by amashtay on 10.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import HTMCollectionKit
import UIKit

final class ReviewCell: CollectionPressableCell {
    static let cellReuseId = "ReviewCell"
    
    private let containerView: UIView = {
        let containerView = UIView()
        containerView.layer.cornerRadius = 8.0
        containerView.layer.masksToBounds = true
        containerView.backgroundColor = .systemGroupedBackground
        
        return containerView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4.0
        
        return stackView
    }()
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    // MARK: Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: Internal
    
    func configure(model: ReviewCellItem) {
        titleLabel.text = model.title
        descriptionLabel.text = model.text
    }
    
    // MARK: Private
    
    private func setup() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8.0),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 4.0),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -4.0),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8.0)
        ])
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = .label
        titleLabel.numberOfLines = 0
        
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .regular)
        descriptionLabel.numberOfLines = 0
    }
}
