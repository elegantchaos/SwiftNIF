// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation
import cnifly

public class Node: NiWrapper {
    typealias Wrapped = ni_node
    
    let wrapped: ni_node
    let file: File
    
    public required init(_ node: ni_node, file: File) {
        self.wrapped = node
        self.file = file
    }

    public init?(_ node: ni_node?, file: File) {
        guard let node = node else { return nil }
        self.wrapped = node
        self.file = file
    }

    public var kind: String {
        let kind = ni_node_get_kind(wrapped)
        return String(cString: kind)
    }

    public var name: String {
        let string = ni_node_get_name(wrapped)
        let name = String(cString: ni_string_chars(string))
        ni_string_free(string)
        return name
    }
    
    public var asShape: Shape? {
        return Shape(wrapped, file: file)
    }
    
    public func iterateTree(callback: @escaping (Node) -> Void) {
        let block = CallbackBlock(file: file, callback: callback)
        let context = Unmanaged.passUnretained(block).toOpaque()
        ni_file_iterate_tree(file.file, wrapped, context, { node, context in
                CallbackBlock<Node>.static_callback(node, context: context)
            })
    }
    
    public func iterateChildren(callback: @escaping (Node) -> Void) {
        let block = CallbackBlock(file: file, callback: callback)
        let context = Unmanaged.passUnretained(block).toOpaque()
        ni_file_iterate_children(file.file, wrapped, context, { node, context in
            CallbackBlock<Node>.static_callback(node, context: context)
        })
    }


}
