// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation
import cnifly

public class NifFile {
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
    
    public var root: NiNode? {
        let root = ni_file_get_root_node(file)
        return NiNode(root)
    }
    
    class CallbackBlock {
        internal init(callback: @escaping (NiNode) -> Void) {
            self.callback = callback
        }
        
        let callback: (NiNode) -> Void
    }

    public func iterateChildren(_ node: NiNode?, callback: @escaping (NiNode) -> Void) {
        if let parent = node ?? root {
            let block = CallbackBlock(callback: callback)
            let context = Unmanaged.passUnretained(block).toOpaque()
            ni_file_iterate_children(file, parent.node, context, { node, context in
                NifFile.static_callback(node: node, context: context)
            })
        }
    }

    class func static_callback(node: ni_node, context: UnsafeRawPointer) {
        let block = Unmanaged<NifFile.CallbackBlock>.fromOpaque(context).takeUnretainedValue()
        if let node = NiNode(node) {
            block.callback(node)
        }

    }

}



