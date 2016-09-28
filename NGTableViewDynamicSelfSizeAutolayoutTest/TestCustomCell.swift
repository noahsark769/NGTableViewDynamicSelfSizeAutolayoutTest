//
//  TestCustomCell.swift
//  NGTableViewDynamicSelfSizeAutolayoutTest
//
//  Created by Noah Gilmore on 9/25/16.
//  Copyright © 2016 Noah Gilmore. All rights reserved.
//

import UIKit

/// A UITableViewCell that contains a single TestStaticCollectionView.
class TestCustomCell: UITableViewCell {
  let collectionView = TestStaticCollectionView()
  var verticalConstraints: [NSLayoutConstraint]? = nil

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(collectionView)
    installConstraints()
//    setNeedsUpdateConstraints()
//    contentView.layoutIfNeeded()
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

  override func layoutSubviews() {
    print("YE OLD CUSTOM CELL LAYOUT SUBVIEWS")
    super.layoutSubviews()
//    contentView.layoutIfNeeded()
  }

  override func updateConstraints() {
    print("------> ye old cell updateConstraints")
//    self.contentView.layoutIfNeeded()
    super.updateConstraints()
//    self.contentView.layoutIfNeeded()
  }

  override func layoutMarginsDidChange() {
    print("YE OLD LAYOUT MARGINS DID CHANGE TO ", layoutMargins)
    collectionView.setNeedsUpdateConstraints()
    collectionView.updateConstraintsIfNeeded()
    contentView.setNeedsUpdateConstraints()
    contentView.updateConstraintsIfNeeded()
    contentView.layoutIfNeeded()
    print("--------- divider ----------")
    NSLayoutConstraint.activate(verticalConstraints!)
    collectionView.invalidateIntrinsicContentSize()
    self.setNeedsLayout()
    contentView.setNeedsLayout()
    collectionView.setNeedsLayout()
    collectionView.layoutIfNeeded()
    collectionView.setNeedsLayout()
    contentView.layoutIfNeeded()
    contentView.setNeedsLayout()
    self.layoutIfNeeded()
  }

//  override func didMoveToSuperview() {
//    print("---------------YE OLD MOVE TO SUPERVIEW")
//    contentView.setNeedsLayout()
//    contentView.layoutIfNeeded()
//  }

//  override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
//    return super.systemLayoutSizeFitting(targetSize)
//  }
//
//  override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//    return super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
//  }

  private func installConstraints() {
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[collectionView]-|", options: [], metrics: nil, views: ["collectionView": collectionView]))
//    contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[collectionView]-|", options: [], metrics: nil, views: ["collectionView": collectionView]))
    self.verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[collectionView]-|", options: [], metrics: nil, views: ["collectionView": collectionView])
  }
}
