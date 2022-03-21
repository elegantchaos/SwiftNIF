// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 21/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

public class Partition: NiWrapper {
    public let flags: UInt16
    public let partID: UInt16
    let file: File
    
    required init(_ raw: UInt32, file: File) {
        self.flags = UInt16(raw >> 16);
        self.partID = UInt16(raw & 0xFFFF);
        self.file = file
    }
    
    var wrapped: UInt32 {
        return UInt32(flags << 16) | UInt32(partID)
    }
    
    typealias Wrapped = UInt32
}
