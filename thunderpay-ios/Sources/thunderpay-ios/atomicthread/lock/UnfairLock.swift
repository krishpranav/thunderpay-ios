//
//  UnfairLock.swift
//  thunderpay-ios
//
//  Created by Krisna Pranav on 22/12/24.
//

import Foundation

final class UnfairLock {
    private let unfairLock: os_unfair_lock_t
    
    init() {
        unfairLock = .allocate(capacity: 1)
        unfairLock.initialize(to: os_unfair_lock_t())
    }
    
    deinit {
        unfairLock.deinitialize(count: 1)
        unfairLock.deallocate()
    }
}

extension UnfairLock: Lock {
    func lock() {
        os_unfair_lock_lock(unfairLock)
    }
    
    func unlock() {
        os_unfair_lock_unlock(unfairLock)
    }
}
