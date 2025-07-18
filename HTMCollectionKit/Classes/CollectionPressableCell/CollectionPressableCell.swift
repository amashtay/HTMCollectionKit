//
//  CollectionPressableCell.swift
//  MRKT
//
//  Created by amashtayon 22.06.2025.
//

import UIKit

open class CollectionPressableCell: UICollectionViewCell {
    public override var isHighlighted: Bool {
        didSet {
            UIView.animate(
                withDuration: 0.4,
                delay: 0.0,
                usingSpringWithDamping: 0.6,
                initialSpringVelocity: 1.0,
                options: .curveEaseInOut
            ) {
                self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.96, y: 0.96) : .identity
            }
        }
    }
}
