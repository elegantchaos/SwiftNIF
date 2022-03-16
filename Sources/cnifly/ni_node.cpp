// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#include "ni_node_private.hpp"

#include "Nodes.hpp"
#include "BasicTypes.hpp"

const char* _Nonnull  ni_node_get_name(ni_node node) {
    return asNode(node)->GetBlockName();
}

