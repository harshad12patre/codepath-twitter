//
//  dateCalc.swift
//  Twitter
//
//  Created by Harshad Barapatre on 2/27/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import Foundation
import Swift
import SwiftUI

extension Date {
        func timeAgoDisplay() -> String {

            let calendar = Calendar.current
            let minuteAgo = calendar.date(byAdding: .minute, value: -1, to: Date())!
            let hourAgo = calendar.date(byAdding: .hour, value: -1, to: Date())!
            let dayAgo = calendar.date(byAdding: .day, value: -1, to: Date())!
            let weekAgo = calendar.date(byAdding: .day, value: -7, to: Date())!

            if minuteAgo < self {
                let diff = Calendar.current.dateComponents([.second], from: self, to: Date()).second ?? 0
                return "\(diff)s"
            } else if hourAgo < self {
                let diff = Calendar.current.dateComponents([.minute], from: self, to: Date()).minute ?? 0
                return "\(diff)m"
            } else if dayAgo < self {
                let diff = Calendar.current.dateComponents([.hour], from: self, to: Date()).hour ?? 0
                return "\(diff)h"
            } else if weekAgo < self {
                let diff = Calendar.current.dateComponents([.day], from: self, to: Date()).day ?? 0
                return "\(diff)d"
            }
            let diff = Calendar.current.dateComponents([.weekOfYear], from: self, to: Date()).weekOfYear ?? 0
            return "\(diff)w"
        }
    }
