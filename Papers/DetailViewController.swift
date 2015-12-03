//
//  DetailViewController.swift
//  Wallpapers
//
//  Created by Pedro Ruíz on 12/03/2015.
//  Copyright (c) 2015 Pedro Ruíz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  
  var paper: Paper?
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    if let paper = paper {
      navigationItem.title = paper.caption
      imageView.image = UIImage(named: paper.imageName)
    }
  }
  
}
