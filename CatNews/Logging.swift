//
//  Logging.swift
//  CatNews
//
//  Created by Adam Young on 07/12/2020.
//

import Foundation
import os.log

extension OSLog {

  private static var subsystem = Bundle.main.bundleIdentifier!

  static let app = OSLog(subsystem: subsystem, category: "App")

}
