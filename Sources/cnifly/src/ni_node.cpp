// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#include "ni_node_private.hpp"

#include "Nodes.hpp"
#include "BasicTypes.hpp"

const char* _Nonnull  ni_node_get_kind(ni_node node) {
    return asNode(node)->GetBlockName();
}

ni_string ni_node_get_name(ni_node node) {
    auto string = asNode(node)->name.get();
    char* buffer = (char*) malloc(string.length() + 1);
    std::strncpy(buffer, string.c_str(), string.length() + 1);
    return (char*) buffer;
}

const char* _Nonnull ni_string_chars(ni_string string) {
    return (char*)string;
}

void ni_string_free(ni_string string) {
    free(string);
}
