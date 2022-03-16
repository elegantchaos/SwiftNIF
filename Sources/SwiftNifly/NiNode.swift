// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation
import cnifly

public class NiNode {
    let node: ni_node
    
    public init?(_ node: ni_node?) {
        guard let node = node else { return nil }
        self.node = node
    }
    
    public var name: String? {
        let name = ni_node_get_name(node)
        return String(cString: name)
    }
}
