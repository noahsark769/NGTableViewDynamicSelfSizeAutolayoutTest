//
//  LabelWrapperView.swift
//  NGTableViewDynamicSelfSizeAutolayoutTest
//
//  Created by Noah Gilmore on 9/23/16.
//  Copyright © 2016 Noah Gilmore. All rights reserved.
//

import UIKit

//class LabelWrapperView: UILabel {
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//    self.numberOfLines = 0
//    self.backgroundColor = .blue
//  }
//  
//  required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//}

class WrappedLabel: UILabel {
  override func layoutSubviews() {
//    print("WrappedLabel layoutSubviews with intrinsicContentSize:", self.intrinsicContentSize)
    super.layoutSubviews()
//    print("~WrappedLabel layoutSubviews with intrinsicContentSize:", self.intrinsicContentSize)
  }

  override func updateConstraints() {
//    print("WrappedLabel updateConstraints with intrinsicContentSize:", self.intrinsicContentSize)
    super.updateConstraints()
//    print("~WrappedLabel updateConstraints with intrinsicContentSize:", self.intrinsicContentSize)
  }

  override var intrinsicContentSize: CGSize {
    get {
      return super.intrinsicContentSize
    }
  }

  override var preferredMaxLayoutWidth: CGFloat {
    get {
      return super.preferredMaxLayoutWidth
    }
    set {
      super.preferredMaxLayoutWidth = newValue
    }
  }

  override var bounds: CGRect {
    get {
      return super.bounds
    }
    set {
      super.bounds = newValue
    }
  }

  override func alignmentRect(forFrame frame: CGRect) -> CGRect {
    let alignmentRect = super.alignmentRect(forFrame: frame)
//    print("LABEL calculating alignment rect %@ for frame %@", alignmentRect, frame)
    return alignmentRect
  }
}

/// A view which is simply a wrapper around a UILabel. Call setText to set the label's text.
class LabelWrapperView: UIView {
  let label: WrappedLabel = {
    let view = WrappedLabel()
    view.numberOfLines = 0
    view.backgroundColor = .blue
    return view
  }()

  func setText(text: String) {
    label.text = text
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(label)
    installConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func installConstraints() {
    label.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[label]|", options: [], metrics: nil, views: ["label": label]))
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label]|", options: [], metrics: nil, views: ["label": label]))
  }
}
