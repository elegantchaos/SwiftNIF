// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

typedef void* ni_file;
typedef void* ni_node;
typedef void (ni_node_callback)(ni_node _Nonnull node, const void *const _Nonnull context);

ni_file _Nonnull ni_file_new();
void ni_file_dispose(ni_file _Nonnull);
int ni_file_load(ni_file _Nonnull file, const char* _Nonnull path);
int ni_file_save(ni_file _Nonnull file, const char* _Nonnull path);
ni_node _Nullable ni_file_get_root_node(ni_file _Nonnull file);
void ni_file_iterate_children(ni_file _Nonnull file, ni_node _Nonnull node, const void *const _Nonnull context, ni_node_callback* _Nonnull callback);
void ni_file_iterate_tree(ni_file _Nonnull file, ni_node _Nonnull parent, const void *const _Nonnull context, ni_node_callback* _Nonnull callback);
