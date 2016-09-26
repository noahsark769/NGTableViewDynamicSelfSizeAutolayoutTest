//
//  TestViewCellNoWrap.swift
//  NGTableViewDynamicSelfSizeAutolayoutTest
//
//  Created by Noah Gilmore on 9/23/16.
//  Copyright © 2016 Noah Gilmore. All rights reserved.
//

import UIKit

class TestViewCellNoWrap: UITableViewCell {
  let label: UILabel = {
    let view = UILabel()
    view.numberOfLines = 0
    view.backgroundColor = .green
    return view
  }()

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(label)
    installConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setModel(_ text: String) {
    label.text = text
  }

  override func layoutSubviews() {
    super.layoutSubviews()
  }

  private func installConstraints() {
    label.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[label]-|", options: [], metrics: nil, views: ["label": label]))
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[label]-|", options: [], metrics: nil, views: ["label": label]))
  }
}
