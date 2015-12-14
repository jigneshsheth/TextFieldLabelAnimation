//
//  AnimatedTableViewCell.swift
//  TextFieldLabelAnimation
//
//  Created by Jigs Sheth on 12/11/15.
//  Copyright © 2015 shethjignesh.com. All rights reserved.
//

import UIKit

class AnimatedTableViewCell: UITableViewCell {

  @IBOutlet weak var textValue: UITextField!
  @IBOutlet weak var label: UILabel!
  
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
      self.textValue.placeholder = label.text
      self.label.hidden = true
    }

  
  override func prepareForReuse() {
    self.label.text = ""
    self.label.hidden = true
    self.textValue.text = ""
  }
  
  

}
