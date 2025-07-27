//
//  AdvertCardCell.swift
//  HTMCollectionKit
//
//  Created by amashtayon 08.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import HTMCollectionKit
import UIKit

final class AdvertCardCell: CollectionPressableCell {
    static let cellReuseId = "CardCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .secondarySystemFill
        view.layer.cornerRadius = 8.0
        
        return view
    }()
        
    private let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        
        return stackView
    }()
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
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
    
    func configure(model: AdvertCardCellItem) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        imageView.backgroundColor = model.color
    }
    
    // MARK: Private
    
    private func setup() {
        backgroundColor = .clear
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.1
        contentView.layer.shadowRadius = 8.0
        
        contentView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        containerView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 130.0)
        ])
                
        containerView.addSubview(titleStackView)
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleStackView.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 4.0),
            titleStackView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -4.0),
            titleStackView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 4.0),
            titleStackView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -4.0)
        ])
        
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(subtitleLabel)
        
        titleLabel.numberOfLines = 1
        subtitleLabel.numberOfLines = 1
        
        titleLabel.font = .systemFont(ofSize: 14.0, weight: .semibold)
        titleLabel.textColor = .label
        subtitleLabel.font = .systemFont(ofSize: 14.0, weight: .regular)
        subtitleLabel.textColor = .secondaryLabel
    }
}
