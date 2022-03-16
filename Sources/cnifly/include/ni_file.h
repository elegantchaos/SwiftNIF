// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#include "ni_node.h"
#include "ni_shape.h"

typedef void* _Nonnull ni_file;
typedef const void *const _Nonnull ni_context;
typedef void (* _Nonnull ni_node_callback)(ni_node node, ni_context context);
typedef void (* _Nonnull ni_partition_callback)(unsigned int partition, ni_context context);

ni_file ni_file_new();
void ni_file_dispose(ni_file);
int ni_file_load(ni_file file, const char* _Nonnull path);
int ni_file_save(ni_file file, const char* _Nonnull path);
ni_node_or_null ni_file_get_root_node(ni_file file);
void ni_file_iterate_children(ni_file file, ni_node node, ni_context context, ni_node_callback callback);
void ni_file_iterate_tree(ni_file file, ni_node parent, ni_context context, ni_node_callback callback);
void ni_file_iterate_shapes(ni_file file, ni_context context, ni_shape_callback callback);
void ni_file_iterate_partitions(ni_file file, ni_shape shape, ni_context context, ni_partition_callback callback);
