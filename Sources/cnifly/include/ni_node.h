// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


typedef void* _Nonnull ni_node;
typedef void* _Nullable ni_node_or_null;

typedef void* _Nonnull ni_string;

ni_string ni_node_get_name(ni_node _Nonnull node);
const char* _Nonnull ni_node_get_kind(ni_node _Nonnull node);

const char* _Nonnull ni_string_chars(ni_string string);
void ni_string_free(ni_string string);
