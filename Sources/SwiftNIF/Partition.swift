// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 21/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

public class Partition: RawRepresentable {
    public let flags: UInt16
    public let partID: UInt16
    
    public required init(rawValue: UInt32) {
        self.flags = UInt16(rawValue >> 16);
        self.partID = UInt16(rawValue & 0xFFFF);
    }
    
    public var rawValue: UInt32 {
        return UInt32(flags << 16) | UInt32(partID)
    }
}
