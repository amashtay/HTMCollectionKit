//
//  TitleHeader.swift
//  HTMCollectionKit
//
//  Created by amashtay on 7/20/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import UIKit

final class TitleHeader: UICollectionReusableView {
    static let reuseId: String = "TitleHeaderReuseId"
    
    private let label: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 28.0, weight: .bold)
        $0.numberOfLines = 1
        return $0
    }(UILabel())
    
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
    
    func configure(title: String) {
        label.text = title
    }
    
    // MARK: Private
    
    private func setup() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
