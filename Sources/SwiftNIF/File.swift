// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation
import cnifly

public class File {
    enum Error: Swift.Error {
        case loadFailed(Int)
        case saveFailed(Int)
    }
    
    let file: ni_file;
    
    public init() {
        file = ni_file_new()
    }
    
    deinit {
        ni_file_dispose(file)
    }
    
    public func load(from url: URL) throws {
        let result = ni_file_load(file, url.path)
        guard result == 0 else {
            throw Error.loadFailed(Int(result))
        }
    }
    
    public func save(to url: URL) throws {
        let result = ni_file_save(file, url.path)
        guard result == 0 else {
            throw Error.loadFailed(Int(result))
        }
    }
    
    public var root: Node? {
        let root = ni_file_get_root_node(file)
        return Node(root)
    }
    

    public func iterateChildren(_ node: Node?, callback: @escaping (Node) -> Void) {
        if let parent = node ?? root {
            let block = CallbackBlock(callback: callback)
            let context = Unmanaged.passUnretained(block).toOpaque()
            ni_file_iterate_children(file, parent.wrapped, context, { node, context in
                CallbackBlock<Node>.static_callback(node, context: context)
            })
        }
    }

    public func iterateTree(_ node: Node?, callback: @escaping (Node) -> Void) {
        if let parent = node ?? root {
            let block = CallbackBlock(callback: callback)
            let context = Unmanaged.passUnretained(block).toOpaque()
            ni_file_iterate_tree(file, parent.wrapped, context, { node, context in
                CallbackBlock<Node>.static_callback(node, context: context)
            })
        }
    }

    public func iterateShapes(callback: @escaping (Shape) -> Void) {
        let block = CallbackBlock(callback: callback)
        let context = Unmanaged.passUnretained(block).toOpaque()
        ni_file_iterate_shapes(file, context, { shape, context in
            CallbackBlock<Shape>.static_callback(shape, context: context)
        })
    }

    public func iteratePartitions(_ shape: Shape, callback: @escaping (Partition) -> Void) {
        let block = CallbackBlock(callback: callback)
        let context = Unmanaged.passUnretained(block).toOpaque()
        ni_file_iterate_partitions(file, shape.wrapped, context, { partition, context in
            CallbackBlock<Partition>.static_callback(partition, context: context)
        })
    }

}

public class Partition: NiWrapper {
    public let flags: UInt16
    public let partID: UInt16
    
    required init(_ raw: UInt32) {
        self.flags = UInt16(raw >> 16);
        self.partID = UInt16(raw & 0xFFFF);
    }
    
    var wrapped: UInt32 {
        return UInt32(flags << 16) | UInt32(partID)
    }
    
    typealias Wrapped = UInt32
}

protocol NiWrapper {
    associatedtype Wrapped
    init(_ raw: Wrapped)
    var wrapped: Wrapped { get }
}

class CallbackBlock<T: NiWrapper> {
    internal init(callback: @escaping (T) -> Void) {
        self.callback = callback
    }
    
    let callback: (T) -> Void

    class func static_callback(_ raw: T.Wrapped, context: UnsafeRawPointer) {
        let block = Unmanaged<Self>.fromOpaque(context).takeUnretainedValue()
        block.callback(T(raw))
    }
}

