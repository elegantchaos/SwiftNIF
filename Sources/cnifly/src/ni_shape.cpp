// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#include "ni_shape_private.hpp"

#include "Nodes.hpp"
#include "BasicTypes.hpp"

const char* ni_shape_get_name(ni_shape shape) {
    auto string = asShape(shape)->name;
    return string.get().c_str();
}

//const char* _Nonnull  ni_node_get_name(ni_node node) {
//    return asNode(node)->GetBlockName();
//}
//
