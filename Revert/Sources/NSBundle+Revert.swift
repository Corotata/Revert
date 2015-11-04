//
//  Copyright © 2015 Itty Bitty Apps. All rights reserved.

import Foundation

extension NSBundle {
  var revealWebsiteURL: NSURL {
    guard let URLString = infoDictionary?["revealWebsiteURL"] as? String, URL = NSURL(string: URLString) else {
      fatalError("Reveal website URL missing or invalid")
    }
    return URL
  }
}
