//
//  TestView.swift
//  NGTableViewDynamicSelfSizeAutolayoutTest
//
//  Created by Noah Gilmore on 9/23/16.
//  Copyright © 2016 Noah Gilmore. All rights reserved.
//

import UIKit

/// ViewController's view. Contains a table view and serves as a static table view data source/delegate.
class TestView: UIView {
  let text: String
  private let tableView = UITableView()
  var prototypeCell: TestCustomCell? = nil

  init(text: String) {
    self.text = text
    super.init(frame: .zero)
    self.tableView.dataSource = self
    self.tableView.delegate = self
    self.tableView.register(TestViewCell.self, forCellReuseIdentifier: String(describing: TestViewCell.self))
    self.tableView.register(TestViewCellNoWrap.self, forCellReuseIdentifier: String(describing: TestViewCellNoWrap.self))
    self.tableView.register(TestCustomCell.self, forCellReuseIdentifier: String(describing: TestCustomCell.self))
    self.tableView.register(TestSimpleCollectionCell.self, forCellReuseIdentifier: String(describing: TestSimpleCollectionCell.self))
    tableView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(tableView)
    installConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func installConstraints() {
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableView]|", options: [], metrics: nil, views: ["tableView": tableView]))
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[tableView]|", options: [], metrics: nil, views: ["tableView": tableView]))
  }
}

extension TestView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row % 4 == 0 {
      let cell: TestViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TestViewCell.self), for: indexPath) as! TestViewCell
      cell.setModel(self.text)
      return cell
    } else if indexPath.row % 4 == 1 {
      let cell: TestViewCellNoWrap = tableView.dequeueReusableCell(withIdentifier: String(describing: TestViewCellNoWrap.self), for: indexPath) as! TestViewCellNoWrap
      cell.setModel(self.text)
      return cell
    } else if indexPath.row % 4 == 2 {
      let cell: TestSimpleCollectionCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TestSimpleCollectionCell.self), for: indexPath) as! TestSimpleCollectionCell
      return cell
    } else {
      let cell: TestCustomCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TestCustomCell.self), for: indexPath) as! TestCustomCell
      cell.setModel([.red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue])
      return cell
    }
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
}

extension TestView: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    if indexPath.row % 4 == 3 {
//      if self.prototypeCell == nil {
//        prototypeCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TestCustomCell.self)) as! TestCustomCell
//      }
//      guard let cell = self.prototypeCell else {
//        fatalError("didn't have a prototype cell even though we just set one")
//      }
//  cell.setModel([.red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue])
//
//      cell.layoutSubviews()
//      cell.contentView.layoutSubviews()
//      cell.collectionView.layoutSubviews()
//      let size = cell.collectionView.intrinsicContentSize
//      print("YARR THE HARDCODED HEIGHT: ", size.height)
//      return size.height
//    }
    return UITableViewAutomaticDimension
  }

  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44.0
  }
}
