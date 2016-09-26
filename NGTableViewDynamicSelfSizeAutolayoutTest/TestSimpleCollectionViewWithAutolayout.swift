//
//  TestSimpleCollectionViewWithAutolayout.swift
//  NGTableViewDynamicSelfSizeAutolayoutTest
//
//  Created by Noah Gilmore on 9/26/16.
//  Copyright © 2016 Noah Gilmore. All rights reserved.
//

import UIKit

class TestSimpleCollectionViewWithAutolayout: UIView {
  let color1 = ColorRectView(color: .red)
  let color2 = ColorRectView(color: .blue)
  let color3 = ColorRectView(color: .green)

  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(color1)
    addSubview(color2)
    addSubview(color3)

    installConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override var alignmentRectInsets: UIEdgeInsets {
    return UIEdgeInsets(top: 50, left: 50, bottom: 50, right : 50)
  }

  override func alignmentRect(forFrame frame: CGRect) -> CGRect {
    let alignmentRect = super.alignmentRect(forFrame: frame)
    print("SIMPLE VIEW calculating alignment rect %@ for frame %@", alignmentRect, frame)
    return alignmentRect
  }

  override func frame(forAlignmentRect alignmentRect: CGRect) -> CGRect {
    return super.frame(forAlignmentRect: alignmentRect)
  }

  private func installConstraints() {
    let views: [String: UIView] = [
      "color1": color1,
      "color2": color2,
      "color3": color3
    ]
    color1.translatesAutoresizingMaskIntoConstraints = false
    color2.translatesAutoresizingMaskIntoConstraints = false
    color3.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[color1]-[color2]-[color3]", options: [], metrics: nil, views: views))
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[color1]-|", options: [], metrics: nil, views: views))
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[color2]-|", options: [], metrics: nil, views: views))
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[color3]-|", options: [], metrics: nil, views: views))
  }
}
