//
//  ColorRectView.swift
//  NGTableViewDynamicSelfSizeAutolayoutTest
//
//  Created by Noah Gilmore on 9/25/16.
//  Copyright © 2016 Noah Gilmore. All rights reserved.
//

import UIKit

/// A static block with a specified background color.
class ColorRectView: UIView {
  override var intrinsicContentSize: CGSize {
    let diceRoll = Int(arc4random_uniform(50) + 1)
    return CGSize(width: diceRoll, height: 20)
  }

  init(color: UIColor) {
    super.init(frame: .zero)
    self.backgroundColor = color
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
