// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#include "ni_file_private.hpp"
#include "ni_node_private.hpp"

extern "C" {


ni_file ni_file_new() {
    ni_file file = new nifly::NifFile();
    return file;
}

void ni_file_dispose(ni_file file) {
    delete asFile(file);
}

int ni_file_load(ni_file file, const char* path) {
    return asFile(file)->Load(path);
}

int ni_file_save(ni_file file, const char* path) {
    return asFile(file)->Save(path);
}

ni_node ni_file_get_root_node(ni_file file) {
    return asFile(file)->GetRootNode();
}

void ni_file_iterate_children(ni_file file, ni_node node, const void *const _Nonnull context, ni_node_callback* callback) {
    std::vector<uint32_t> indices;
    asNode(node)->GetChildIndices(indices);

    auto hdr = asFile(file)->GetHeader();
    
    for (auto& i : indices) {
        auto child = hdr.GetBlock<nifly::NiObject>(i);
        if (child)
            callback(child, context);
    }
}

void ni_file_iterate_tree(ni_file file, ni_node parent, const void *const _Nonnull context, ni_node_callback* callback) {
    std::vector<nifly::NiObject*> objects;
    asFile(file)->GetTree(objects, asNode(parent));
    
    for (auto& object : objects) {
        callback(object, context);
    }
}

}
