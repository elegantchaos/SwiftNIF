// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 16/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation
import cnifly

public class Shape: NiWrapper {
    typealias Wrapped = ni_shape

    let wrapped: ni_shape
    let file: File
    
    public required init(_ shape: ni_shape, file: File) {
        self.wrapped = shape
        self.file = file
    }
    
    public init?(_ shape: ni_shape?, file: File) {
        guard let shape = shape else { return nil }
        self.wrapped = shape
        self.file = file
    }
    
    public var name: String {
        let string = ni_shape_get_name(wrapped)
        let name = String(cString: ni_string_chars(string))
        ni_string_free(string)
        return name
    }
    
    public var partitions: [Partition] {
        get {
            let block = AccumulatingCallbackBlock<Partition>()
            let context = Unmanaged.passUnretained(block).toOpaque()
            ni_file_iterate_partitions(file.file, wrapped, context, { partition, context in
                AccumulatingCallbackBlock<Partition>.static_callback(partition, context: context)
            })

            return block.items
        }
        
        set {
            
        }
    }
    
    public func setPartition(_ partition: Partition) {
        
    }
}
