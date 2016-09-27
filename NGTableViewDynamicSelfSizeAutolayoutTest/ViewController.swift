//
//  ViewController.swift
//  NGTableViewDynamicSelfSizeAutolayoutTest
//
//  Created by Noah Gilmore on 9/23/16.
//  Copyright © 2016 Noah Gilmore. All rights reserved.
//

import UIKit

/// View controller for the one view in this example app. Doesn't do much except contain a TestView.
class ViewController: UIViewController {

  override func loadView() {
    super.loadView()
    self.view = TestView(text: "This is a long sentence. It might take up a lot of room on the screen, and the hope is that the label will know that it should cut itself off at X number of lines.")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    UserDefaults.standard.set(true, forKey: "UIViewShowAlignmentRects")
    UserDefaults.standard.synchronize()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

