//
//  TestStaticCollectionView.swift
//  NGTableViewDynamicSelfSizeAutolayoutTest
//
//  Created by Noah Gilmore on 9/25/16.
//  Copyright © 2016 Noah Gilmore. All rights reserved.
//

import UIKit

/// A static collection view. It aims to contain multiple subviews, all of which should define an
/// intrinsicContentSize, and wrap them onto a new line if they exceed this view's width. Currently
/// does not work correctly inside of table view cells.
class TestStaticCollectionView: UIView {
  init() {
    super.init(frame: .zero)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private(set) var arrangedSubviews: [UIView] = []
  private(set) var rowViews: [UIView] = []
  private(set) var tagViewHeight: CGFloat = 0
  private(set) var rows: Int = 0

  private var _preferredMaxLayoutWidth: CGFloat?
  var preferredMaxLayoutWidth: CGFloat? {
    get {
      return _preferredMaxLayoutWidth
    }
    set {
      if let width = newValue {
        __setPreferredMaxLayoutWidth(width)
      } else {
        _preferredMaxLayoutWidth = newValue
      }
    }
  }

  private func __setPreferredMaxLayoutWidth(_ width: CGFloat) {
    if let maximumWidth = _preferredMaxLayoutWidth, maximumWidth == width {
      return
    }
    print("YE OLD PREFERRED MAX LAYOUT WIDTH UPDATE", width)
    _preferredMaxLayoutWidth = width

    print("YE OLD INVALIDATION STEP")
    invalidateIntrinsicContentSize()
  }

  override func layoutSubviews() {
    print("YE OLD WIDTH: ", self.frame.width)
    preferredMaxLayoutWidth = self.frame.width

    if let maximumWidth = preferredMaxLayoutWidth {
      rearrangeViews(using: maximumWidth)
    }
    super.layoutSubviews()
  }

  func rearrangeViews(using maximumWidth: CGFloat) {
    let views = arrangedSubviews + rowViews
    for view in views {
      view.removeFromSuperview()
    }
    rowViews.removeAll(keepingCapacity: true)

    var currentRow = 0
    var currentViewHeight: CGFloat = 0
    var currentRowView: UIView!
    var currentRowViewCount = 0
    var currentRowWidth: CGFloat = 0
    for view in arrangedSubviews {
      view.frame.size = view.intrinsicContentSize
      currentViewHeight = view.frame.height

      if currentRowViewCount == 0 || currentRowWidth + view.frame.width > maximumWidth {
        currentRow += 1
        currentRowWidth = 0
        let nextY = currentRowViewCount == 0 ? 0 : currentRowView.frame.origin.y + currentRowView.frame.height + 0
        currentRowViewCount = 0
        currentRowView = UIView()
        currentRowView.frame.origin.y = nextY

        rowViews.append(currentRowView)
        addSubview(currentRowView)
      }

      view.frame.origin.x = currentRowWidth
      view.frame.origin.y = 0
      currentRowView.addSubview(view)

      currentRowViewCount += 1
      currentRowWidth += view.frame.width + 0

      currentRowView.frame.origin.x = 0
      currentRowView.frame.size.width = currentRowWidth
      currentRowView.frame.size.height = max(currentViewHeight, currentRowView.frame.height)
    }
    rows = currentRow

    invalidateIntrinsicContentSize()
  }

  override var intrinsicContentSize: CGSize {
    guard let maximumWidth = preferredMaxLayoutWidth else {
      print("YE OLD DEFAULT INTRINSIC CONTENT SIZE: ", CGSize(width: UIViewNoIntrinsicMetric, height: UIViewNoIntrinsicMetric))
      return CGSize(width: UIViewNoIntrinsicMetric, height: UIViewNoIntrinsicMetric)
    }

    let intrinsicContentSizes: [CGSize] = arrangedSubviews.map { $0.intrinsicContentSize }
    var currentRowWidth: CGFloat = 0
    var currentHeight: CGFloat = 0

    for size in intrinsicContentSizes {
      if currentRowWidth + size.width > maximumWidth {
        currentHeight += size.height // assumes all are the same height
        // assumes no interline or interlabel spacing
        currentRowWidth = 0
      }
      currentRowWidth += size.width
    }
    currentHeight += intrinsicContentSizes.last!.height

    let size = CGSize(width: maximumWidth, height: currentHeight)
    print("YE OLD INTRINSIC CONTENT SIZE: ", size)
    return size
  }

  func addArrangedSubview(_ view: UIView) {
    arrangedSubviews.append(view)
  }

  func removeAllArrangedSubviews() {
    for view in arrangedSubviews {
      view.removeFromSuperview()
    }
    arrangedSubviews = []
  }
}
