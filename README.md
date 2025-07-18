# HTMCollectionKit

[![Version](https://img.shields.io/cocoapods/v/HTMCollectionKit.svg?style=flat)](https://cocoapods.org/pods/HTMCollectionKit)
[![License](https://img.shields.io/cocoapods/l/HTMCollectionKit.svg?style=flat)](https://cocoapods.org/pods/HTMCollectionKit)
[![Platform](https://img.shields.io/cocoapods/p/HTMCollectionKit.svg?style=flat)](https://cocoapods.org/pods/HTMCollectionKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
iOS 15+

## Installation

HTMCollectionKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HTMCollectionKit'
```

## How to use
Use `CollectionLayoutSectionFactory` to create `NSLayoutSection` for `collectionView` `CompositionalLayout`

```Swift
func createCollectionLayout() -> UICollectionViewLayout {
    UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ -> NSCollectionLayoutSection? in
        guard let self, sectionIndex < viewData.sections.count else { return nil }
        
        let layoutSection: NSCollectionLayoutSection?
        let sectionViewModel = viewData.sections[sectionIndex]
        switch sectionViewModel.type {
        case .description:
            layoutSection = collectionLayoutFactory.createLayoutSection(type: .verticalList())
            layoutSection?.contentInsets = .init(top: 16.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
        case .itemsGrid:
            layoutSection = collectionLayoutFactory.createLayoutSection(type: .grid(columnsCount: 2))
            layoutSection?.contentInsets = .init(top: 16.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
            layoutSection?.interGroupSpacing = 8.0
        case .banners:
            layoutSection = collectionLayoutFactory.createLayoutSection(type: .horizontalPagingList(customItemHeight: 300.0))
            layoutSection?.contentInsets = .init(top: 16.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
            layoutSection?.interGroupSpacing = 4.0
        case .reviews:
            layoutSection = collectionLayoutFactory.createLayoutSection(type: .verticalList())
            layoutSection?.contentInsets = .init(top: 16.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
            layoutSection?.interGroupSpacing = 8.0
        }
        
        return layoutSection
    }
}
```

## Author

Hulio Trabajo Montez, amashtay@gmail.com

## License

HTMCollectionKit is available under the MIT license. See the LICENSE file for more info.
