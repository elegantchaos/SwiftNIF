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
        return Node(root, file: self)
    }
    

    public func iterateShapes(callback: @escaping (Shape) -> Void) {
        let block = CallbackBlock(file: self, callback: callback)
        let context = Unmanaged.passUnretained(block).toOpaque()
        ni_file_iterate_shapes(file, context, { shape, context in
            CallbackBlock<Shape>.static_callback(shape, context: context)
        })
    }

}
