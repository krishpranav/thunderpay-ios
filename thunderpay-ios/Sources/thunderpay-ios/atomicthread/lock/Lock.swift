//
//  Lock.swift
//  thunderpay-ios
//
//  Created by Krisna Pranav on 22/12/24.
//

import Foundation

protocol Lock {
    func lock()
    
    func unlock()
}

extension Lock {
    func around<T>(_ closure: () throws -> T) rethrows -> T {
        lock()
        defer { unlock() }
        return try closure()
    }
    
    func around(_ closure: () throws -> Void) rethrows {
        lock()
        defer { unlock() }
        try closure()
    }
}
