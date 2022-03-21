// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#include "ni_node_private.hpp"
#include "ni_string_private.hpp"

#include "Nodes.hpp"
#include "BasicTypes.hpp"

const char* _Nonnull  ni_node_get_kind(ni_node node) {
    return asNode(node)->GetBlockName();
}

ni_string ni_node_get_name(ni_node node) {
    auto string = asNode(node)->name;
    return string_ref_to_ni_string(string);
}
