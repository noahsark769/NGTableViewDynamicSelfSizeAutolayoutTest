//
//  TestViewCell.swift
//  NGTableViewDynamicSelfSizeAutolayoutTest
//
//  Created by Noah Gilmore on 9/23/16.
//  Copyright © 2016 Noah Gilmore. All rights reserved.
//

import UIKit

class TestViewCell: UITableViewCell {
  let label = LabelWrapperView()

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(label)
    installConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setModel(_ text: String) {
    label.setText(text: text)
  }

  override func layoutSubviews() {
    print("TestViewCell layoutSubviews with label.label.intrinsicContentSize:", label.label.intrinsicContentSize)
    super.layoutSubviews()
  }

  override func updateConstraints() {
    print("TestViewCell updateConstraints with label.label.intrinsicContentSize:", label.label.intrinsicContentSize)
    super.updateConstraints()
  }

  override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
    let rtn = super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
    return rtn
  }

  private func installConstraints() {
    label.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[label]-|", options: [], metrics: nil, views: ["label": label]))
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[label]-|", options: [], metrics: nil, views: ["label": label]))
  }
}
