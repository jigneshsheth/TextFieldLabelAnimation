//
//  TextViewAnimatedTableViewController.swift
//  TextFieldLabelAnimation
//
//  Created by Jigs Sheth on 12/11/15.
//  Copyright © 2015 shethjignesh.com. All rights reserved.
//

import UIKit

class TextViewAnimatedTableViewController: UITableViewController {
  
    let datasource = ["First Name","Last Name","Address Line 1","Address Line 2"]
    private var floatingLabels:[UILabel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
  //MARK: Tableview Delegation
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {      return UITableViewAutomaticDimension
  }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AnimatedCellId", forIndexPath: indexPath) as! AnimatedTableViewCell
        let value = datasource[indexPath.row]
        cell.label.text = value
        cell.textValue.placeholder = value
        cell.textValue.tag = indexPath.row
        self.floatingLabels.append(cell.label)
        return cell
    }
}


extension TextViewAnimatedTableViewController : UITextFieldDelegate  {
  
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    
    if (range.length + range.location > textField.text?.characters.count )
    {
      return false;
    }
    
    let currentLabel = self.floatingLabels[textField.tag] as UILabel
    
    let newLength = (textField.text?.characters.count)! + string.characters.count - range.length
    if newLength == 1 && currentLabel.hidden == true {
      currentLabel.hidden = false
      currentLabel.alpha = 0.0
      currentLabel.frame.origin.y += 10
      UIView.animateWithDuration(0.2, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
        currentLabel.alpha = 1.0
        currentLabel.frame.origin.y -= 10
        }, completion:nil)
    }else if newLength == 0 {
      currentLabel.alpha = 1.0
      UIView.animateWithDuration(0.2, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
        currentLabel.alpha = 0.0
        }, completion:  { (finish:Bool) -> Void in
          if finish {
            currentLabel.hidden = true
          }
      })
    }
    
    return newLength <= 50
  }
  

}
