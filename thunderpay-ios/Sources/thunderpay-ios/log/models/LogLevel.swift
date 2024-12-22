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

    public typealias RawValue = UInt

    public static let off = LogLevel(rawValue: offBitmask)
    public static let debug = LogLevel(rawValue: debugBitmask)
    public static let info = LogLevel(rawValue: infoBitmask)
    public static let error = LogLevel(rawValue: errorBitmask)
    public static let fault = LogLevel(rawValue: faultBitmask)
    public static let all = LogLevel(rawValue: allBitmask)

    public let rawValue: RawValue


    private static let offBitmask: RawValue = 1 << 0
    private static let debugBitmask: RawValue = 1 << 1
    private static let infoBitmask: RawValue = 1 << 2
    private static let errorBitmask: RawValue = 1 << 3
    private static let faultBitmask: RawValue = 1 << 4
    private static let allBitmask: RawValue = 0b1111_1111_1111_1111_1111_1111_1111_1111
}
