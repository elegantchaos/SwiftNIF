// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 16/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation
import cnifly

public class Shape: NiWrapper {
    typealias Wrapped = ni_shape

    let wrapped: ni_shape
    
    public required init(_ shape: ni_shape) {
        self.wrapped = shape
    }
    
    public init?(_ shape: ni_shape?) {
        guard let shape = shape else { return nil }
        self.wrapped = shape
    }
    
    public var name: String {
        return String(cString: ni_shape_get_name(wrapped))
    }
}
