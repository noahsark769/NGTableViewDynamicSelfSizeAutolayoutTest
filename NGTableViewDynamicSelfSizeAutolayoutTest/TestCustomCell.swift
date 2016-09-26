//
//  TestCustomCell.swift
//  NGTableViewDynamicSelfSizeAutolayoutTest
//
//  Created by Noah Gilmore on 9/25/16.
//  Copyright © 2016 Noah Gilmore. All rights reserved.
//

import UIKit

class TestCustomCell: UITableViewCell {
  let collectionView = TestStaticCollectionView()

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(collectionView)
    installConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setModel(_ colors: [UIColor]) {
    collectionView.removeAllArrangedSubviews()
    for color in colors {
      collectionView.addArrangedSubview(ColorRectView(color: color))
    }
  }

  private func installConstraints() {
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[collectionView]-|", options: [], metrics: nil, views: ["collectionView": collectionView]))
    contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[collectionView]-|", options: [], metrics: nil, views: ["collectionView": collectionView]))
  }
}
