//
//  Copyright © 2015 Itty Bitty Apps. All rights reserved.

import UIKit

final class HomeCell: BasicCell {
  @IBOutlet private(set) weak var iconImageView: UIImageView!

  func updateSelectedBackgroundColor(isBlue isBlue: Bool) {
    if isBlue {
      self.selectedBackgroundView = UIView()
      self.selectedBackgroundView!.backgroundColor = UIColor.revertTintColor()
    } else {
      self.selectedBackgroundView = nil
    }
  }
}

class BasicCell: UITableViewCell {
  @IBOutlet private(set) weak var titleLabel: UILabel!
  @IBOutlet private(set) weak var subtitleLabel: UILabel!

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    NSNotificationCenter.defaultCenter().addObserver(self, selector: "applyDynamicType:", name:
      UIContentSizeCategoryDidChangeNotification, object: nil)
  }

  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }

  override func awakeFromNib() {
    super.awakeFromNib()

    self.applyDynamicType()
  }

  func applyDynamicType(notification: NSNotification? = nil) {
    self.titleLabel?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
    self.subtitleLabel?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
  }
}
