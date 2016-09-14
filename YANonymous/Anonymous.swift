//
//  Anonymous.swift
//  YANonymous
//
//  Created by Simkó Viktor on 2016. 09. 14..
//  Copyright © 2016. Simkó Viktor. All rights reserved.
//

import Foundation
import QuartzCore

class Anonymous {
  var name: String
  var x: CGFloat = 0.0
  var y: CGFloat = 0.0
  
  init(name: String) {
    self.name = name
  }
  
  convenience init(name: String, x: CGFloat, y: CGFloat) {
    self.init(name: name)
    self.x = x
    self.y = y
  }
}
