//
//  Lock.swift
//  thunderpay-ios
//
//  Created by Krisna Pranav on 22/12/24.
//

import Foundation

@propertyWrapper
@dynamicMemberLookup
public final class Atomic<Value> {
    private let lock = UnfairLock()
    private var value: Value
    
    public var wrappedValue: Value {
        get { lock.withLock { value } }
        set { lock.withLock { value = newValue } }
    }
    
    public init(wrappedValue value: Value) {
        self.value = value
    }
    
    public func read<U>(_ closure: (Value) throws -> U) rethrows -> U {
        try lock.around { try.closure(self.value) }
    }
    
    public func write(_ value: Value) {
        write { $0 = value }
    }
    
    subscript<Property>(dynamicMember keyPath: WritableKeyPath<Value, Property>) -> Property {
        get { lock.around { value[keyPath: keyPath] } }
        set { lock.around { value[keyPath: keyPath] = newValue } }
    }
}