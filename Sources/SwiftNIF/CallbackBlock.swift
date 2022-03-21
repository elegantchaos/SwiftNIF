// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 21/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

class CallbackBlock<T: NiWrapper> {
    internal init(file: File, callback: @escaping (T) -> Void) {
        self.file = file
        self.callback = callback
    }
    
    let callback: (T) -> Void
    let file: File
    
    class func static_callback(_ raw: T.Wrapped, context: UnsafeRawPointer) {
        let block = Unmanaged<Self>.fromOpaque(context).takeUnretainedValue()
        block.callback(T(raw, file: block.file))
    }
}

class AccumulatingCallbackBlock<T: RawRepresentable> {
    internal init() {
        self.items = []
    }
    
    var items: [T]
    
    class func static_callback(_ raw: T.RawValue, context: UnsafeRawPointer) {
        let block = Unmanaged<Self>.fromOpaque(context).takeUnretainedValue()
        if let value = T(rawValue: raw) {
            block.items.append(value)
        }
    }
}

class AccumulatingRawCallbackBlock<T> {
    internal init() {
        self.items = []
    }
    
    var items: [T]
    
    class func static_callback(_ raw: T, context: UnsafeRawPointer) {
        let block = Unmanaged<Self>.fromOpaque(context).takeUnretainedValue()
        block.items.append(raw)
    }
}

