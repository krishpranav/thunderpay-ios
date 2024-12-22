//
//  LogLevel.swift
//  thunderpay-ios
//
//  Created by Krisna Pranav on 22/12/24.
//

import Foundation

public struct LogLevel: OptionSet {
    public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
    
    public static let off = LogLevel(rawValue: offBitmask)
    public static let debug = LogLevel(rawValue: debugBitmask)
    public static let info = LogLevel(rawValue: infoBitmask)
    
    
    public typealias RawValue = UInt
    
    
    private static let rawValue: RawValue
    private static let offBitmask: RawValue = 1 << 0
    private static let debugBitmask: RawValue = 1 << 1
    private static let infoBitmask: RawValue = 1 << 2
    private static let errorBitmask: RawValue = 1 << 3
    
}
