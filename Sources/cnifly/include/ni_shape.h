// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/03/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#include "ni_node.h"

typedef void* _Nonnull ni_shape;
typedef const void *const _Nonnull ni_context;
typedef void (* _Nonnull ni_shape_callback)(ni_shape shape, ni_context context);

ni_string ni_shape_get_name(ni_shape shape);
