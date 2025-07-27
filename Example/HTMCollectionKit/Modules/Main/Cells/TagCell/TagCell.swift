//
//  TagCell.swift
//  HTMCollectionKit
//
//  Created by amashtay on 7/27/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import HTMCollectionKit
import UIKit

final class TagCell: CollectionPressableCell {
    static let cellReuseId = "TagCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4.0
        view.backgroundColor = .systemGroupedBackground
        
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        
        return label
    }()
    
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
    func configure(model: TagCellItem) {
        titleLabel.text = model.title
    }
    
    // MARK: Private
    private func setup() {
        contentView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        containerView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4.0),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -4.0),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 4.0),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -4.0)
        ])
    }
}
