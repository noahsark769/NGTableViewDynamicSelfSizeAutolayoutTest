//
//  TestSimpleCollectionCell.swift
//  NGTableViewDynamicSelfSizeAutolayoutTest
//
//  Created by Noah Gilmore on 9/26/16.
//  Copyright © 2016 Noah Gilmore. All rights reserved.
//

import UIKit

/// A Cell which contains a TestSimpleCollectionViewWithAutolayout. Purely for purposes of displaying
/// a TestSimpleCollectionViewWithAutolayout inside a cell. This class is almost exactly the same as
/// TestCustomCell.
class TestSimpleCollectionCell: UITableViewCell {
  let collectionView = TestSimpleCollectionViewWithAutolayout()

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(collectionView)
    installConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func installConstraints() {
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[collectionView]-|", options: [], metrics: nil, views: ["collectionView": collectionView]))
    contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[collectionView]-|", options: [], metrics: nil, views: ["collectionView": collectionView]))
  }
}
