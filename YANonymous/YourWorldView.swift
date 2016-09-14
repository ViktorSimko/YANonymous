//
//  YourWorldView.swift
//  YANonymous
//
//  Created by Simkó Viktor on 2016. 09. 14..
//  Copyright © 2016. Simkó Viktor. All rights reserved.
//

import UIKit

class YourWorldView: UIView {
  var anonyms = [Anonymous]()
  let generalNodeColor = UIColor(
    red: 0.0,
    green: 57.0 / 255,
    blue: 204.0 / 255,
    alpha: 1.0
  )
  let generalNodeBorderColor = UIColor(
    red: 204.0 / 255,
    green: 0.0,
    blue: 0.0,
    alpha: 1.0
  )
  let borderWidth: CGFloat = 3.0
  let anonymDiameter: CGFloat = 40.0
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  func commonInit() {
    let x = UIScreen.main.bounds.width * 0.5
    let y = UIScreen.main.bounds.height * 0.5
    
    let me = Anonymous(name: "Me", x: x, y: y)
    anonyms.append(me)
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    
    let ctx = UIGraphicsGetCurrentContext()
    let offset = anonymDiameter * 0.5
    for anonym in anonyms {
      let anonRect = CGRect(
          x: anonym.x - offset,
          y: anonym.y - offset,
          width: anonymDiameter,
          height: anonymDiameter
        )
      
      ctx?.addEllipse(in: anonRect)
    }
    
    generalNodeColor.setFill()
    generalNodeBorderColor.setStroke()
    ctx?.setLineWidth(borderWidth)
    ctx?.drawPath(using: .fillStroke)
  }
}

extension YourWorldView {
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      let touchLocation = touch.location(in: self)
      let other = Anonymous(
        name: "Other",
        x: touchLocation.x,
        y: touchLocation.y
      )
      
      anonyms.append(other)
    }
    setNeedsDisplay()
  }
}
